// Flapp Copyright 2017-2018

using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Description;
using Falcon.EFCommonContext.DbModel;
using AutoMapper;
using Falcon.Web.Models.Api;
using Falcon.Common;
using System.Collections.Generic;
using Falcon.Web.Common;
using Falcon.EFCommonContext;
using Falcon.Web.Api.Utilities.Base;
using Falcon.Common.Security;
using Falcon.Web.Api.MaintenanceProcessing.Public;

namespace Falcon.Web.Api.Controllers.V1
{
    [UnitOfWorkActionFilter]
    public class AchievedPosessionsController : FalconApiController
    {
        private readonly IMapper mMapper;
        private readonly IDateTime mDateTime;
        private readonly IDbContext mDb;
        private readonly IWebUserSession mUserSession;
        private readonly IGlobalApplicationState mAppState;

        public AchievedPosessionsController(IMapper Mapper , IDateTime DateTime , IDbContext Database , IWebUserSession UserSession , IGlobalApplicationState AppState)
        {
            mMapper = Mapper;
            mDateTime = DateTime;
            mDb = Database;
            mUserSession = UserSession;
            mAppState = AppState;
        }

        [Route("Achievements/")]
        [ResponseType(typeof(SAchievement))]
        [HttpPost]
        public async Task<IHttpActionResult> GetAchievementList()
        {
            var achievables = await mDb.Set<AchievedPosession>()
                                                        .AsNoTracking()
                                                        .Include( Ap => Ap.Achievement)
                                                        .Where( ap => ap.UserID == mUserSession.UserID && 
                                                                ap.AchieveStateID == Constants.DefaultValues.AchievementDefaultAchievableID)
                                                        .Select( ap => ap.Achievement)
                                                        .OrderBy( ap => ap.ID)
                                                        .ToListAsync();

            List<Achievement> adhoc = new List<Achievement>();
            List<Achievement> usuals = new List<Achievement>();

            var tempDistinctAchievable = achievables.GroupBy(a => a.CategoryID).Select(g => g.FirstOrDefault()).Count();

            if (tempDistinctAchievable >= Constants.DefaultValues.AchievementsMinimumAchievables)
            {
                    
                var result = mMapper.Map<List<Achievement>, List<SAchievement>>
                    (achievables
                    .GroupBy(a => a.CategoryID)
                    .Select(g => g.FirstOrDefault())
                    .Take(Constants.DefaultValues.AchievementsMinimumAchievables)
                    .ToList());

                return Response(HttpStatusCode.OK, result);
            }
            else
            {
                List<Achievement> newAchievables = new List<Achievement>();
                var userCurrentLevel = await mDb.Set<User>().Where(u => u.ID == mUserSession.UserID).Select(u => u.CurrentLevelID).SingleOrDefaultAsync();

                    
                var achievableAndAchievedIDList = await mDb.Set<AchievedPosession>()
                                        .AsNoTracking()
                                        .Include(ap => ap.Achievement)
                                        .Where(ap => ap.UserID == mUserSession.UserID &&
                                                ap.AchieveStateID == Constants.DefaultValues.AchievementDefaultAchievedID)
                                        .Select(ap => ap.Achievement.ID).ToListAsync();

                achievableAndAchievedIDList.AddRange(achievables.Select( a => a.ID));

                //Get list of Ad-hoc 
                adhoc = await mDb.Set<Achievement>().AsNoTracking()
                    .Where( a => a.IsActive && 
                            a.QueryTypeID == Constants.DefaultValues.AchievementAdHocQueryTypeID && 
                            a.LevelID >= userCurrentLevel && 
                            !achievableAndAchievedIDList.Contains(a.ID))
                    .ToListAsync();
                    

                for(int i = adhoc.Count -1 ;  i >= 0; --i)
                {
                    if (!string.IsNullOrEmpty(adhoc[i].Query))
                    {
                        int result = await mDb.Database.SqlQuery<int>(adhoc[i].Query, mUserSession.UserID).SingleOrDefaultAsync();
                        if (result >= 1)
                        {
                            newAchievables.Add(adhoc[i]);
                            ++tempDistinctAchievable;
                            adhoc.RemoveAt(i);
                        }
                    }
                }

                // Get List of category base
                usuals = await mDb.Set<Achievement>().AsNoTracking()
                    .Where( a => a.IsActive && 
                            a.QueryTypeID == Constants.DefaultValues.AchievementCategoryQueryTypeID &&
                            !achievableAndAchievedIDList.Contains(a.ID))

                    .GroupBy( a => a.CategoryID)
                    .Select( g => g.FirstOrDefault())
                    .OrderBy(a => a.CategoryQuantity)
                    .ToListAsync();

                for(int i = usuals.Count -1; i >= 0; --i)
                {
                    int? value = usuals[i].CategoryID;

                    var isAchievable = await mDb.Set<Answer>()
                        .AsNoTracking()
                        .Include(a => a.Question)
                        .Where(u => u.UserID == mUserSession.UserID && u.Question.Catgory_ID == (value ?? 0))
                        .CountAsync() >= usuals[i].CategoryQuantity;

                    if (isAchievable)
                    {
                        newAchievables.Add(usuals[i]);
                        ++tempDistinctAchievable;
                        usuals.Remove(usuals[i]);
                    }
                }

                // add list of achievables to achievePossesions , instead of mapping with auto mapper
                List<AchievedPosession> list = new List<AchievedPosession>(newAchievables.Count);
                for(int i = 0;i < newAchievables.Count; ++i)
                {
                    list.Add(new AchievedPosession
                    {
                        UserID = mUserSession.UserID,
                        AchievementID = newAchievables[i].ID,
                        AchieveStateID = Constants.DefaultValues.AchievementDefaultAchievableID,
                        AchievedDate = null,    
                        AchievableDate = mDateTime.Now,
                    });
                }
                if(list.Count > 0 )
                {
                    mDb.Set<AchievedPosession>().AddRange(list);
                    await mDb.SaveChangesAsync();
                    achievables.AddRange(newAchievables);
                }
            }

            if(tempDistinctAchievable >= 0)
            {
                List<SAchievement> mapAchievable = new List<SAchievement>();

                if(tempDistinctAchievable > 0 )
                {
                    mapAchievable = mMapper.Map<List<Achievement>, List<SAchievement>>(
                    achievables
                    .GroupBy(a => a.CategoryID)
                    .Select(g => g.FirstOrDefault())
                    .ToList());
                }
                  
                int remainedNumber = Constants.DefaultValues.AchievementsMinimumAchievables - mapAchievable.Count;

                if(remainedNumber <= 0)
                {
                    var result = mapAchievable.Take(Constants.DefaultValues.AchievementsMinimumAchievables);

                    return Response(HttpStatusCode.OK, result);
                }

                List<Achievement> notAchieved = new List<Achievement>();
                AddRemainedResults(remainedNumber, ref usuals, ref adhoc, ref notAchieved);

                var mapNotAchieved = new List<SAchievement>(notAchieved.Count);
                for(int i = 0; i < notAchieved.Count; ++i)
                {
                    mapNotAchieved.Add (new SAchievement
                        {
                            ID = notAchieved[i].ID,
                            Name = notAchieved[i].Name,
                            Description = notAchieved[i].Description,
                            Star = notAchieved[i].Star,
                            Prize = notAchieved[i].Prize,
                            Icon = notAchieved[i].Icon,
                            RectangleColor = notAchieved[i].RectangleColor,
                            AchievementState = Constants.DefaultValues.AchievementDefaultNotAchievedID
                        });
                }

                mapAchievable.AddRange(mapNotAchieved);
                return Response(HttpStatusCode.OK, mapAchievable);

            }
            else
            {
                return Response(HttpStatusCode.NoContent);
            }
        }

        [ResponseType(typeof(int))]
        [Route("Achievements/Change/{AchievementID}")]
        [HttpPost]
        public async Task<IHttpActionResult> ChangeAchievableToAchieved(int AchievementID)
        {
            var user = await mDb.Set<User>().Where(u => u.UUID == mUserSession.UUID).Include( u => u.Level).SingleOrDefaultAsync();

            if (user != null) //user Exists
            {
                var achievable = await mDb.Set<AchievedPosession>()
                                        .Include(ap => ap.Achievement)
                                        .Where(ap => ap.UserID == user.ID &&
                                               ap.AchievementID == AchievementID &&
                                               ap.AchieveStateID == Constants.DefaultValues.AchievementDefaultAchievableID)
                                        .SingleOrDefaultAsync();
                if (achievable != null)
                {
                    int prize = achievable.Achievement.Prize;
                   
                    achievable.AchieveStateID = Constants.DefaultValues.AchievementDefaultAchievedID;
                    achievable.AchievedDate = mDateTime.Now;
                    user.TotalStars += achievable.Achievement.Star;

                    int nextLevelId = await GetNextLevelID(user.Level.LevelNumber);
                    LevelUpChecking( ref user , user.Level.ScoreCeil, prize , nextLevelId);

                    await mDb.SaveChangesAsync();
                    return Response(HttpStatusCode.OK, user.TotalStars);
                }
                return Response(HttpStatusCode.Unauthorized);
            }
            else
            {
                return Response(HttpStatusCode.Unauthorized);
            }
        }

        [Route("Achievements/Achieved/")]
        [ResponseType(typeof(SAchievement))]
        [HttpPost]
        public async Task<IHttpActionResult> GetAchievedList()
        {
            var achievedList = await mDb.Set<AchievedPosession>()
                                                        .AsNoTracking()
                                                        .Include( ap => ap.Achievement)
                                                        .Where( ap => ap.UserID == mUserSession.UserID && 
                                                                ap.AchieveStateID == Constants.DefaultValues.AchievementDefaultAchievedID)
                                                        .Select(ap => ap.Achievement)
                                                        .ToListAsync();


            var result = mMapper.Map<List<Achievement>, List<SAchievement>>(achievedList);

            if (result.Count > 0)
                return Response(HttpStatusCode.OK, result);
            else
                return Response(HttpStatusCode.NoContent);
        }

        [Route("Achievements/Achievable/")]
        [ResponseType(typeof(SAchievement))]
        [HttpPost]
        public async Task<IHttpActionResult> GetAchievableList()
        {
            var achievableList = await mDb.Set<AchievedPosession>()
                                            .AsNoTracking()
                                            .Include(ap => ap.Achievement)
                                            .Where( ap => ap.UserID == mUserSession.UserID &&  
                                                    ap.AchieveStateID == Constants.DefaultValues.AchievementDefaultAchievableID)
                                            .Select(ap => ap.Achievement)
                                            .ToListAsync();

            var result = mMapper.Map<List<Achievement>, List<SAchievement>>(achievableList); //TODO , replace AchievableIDS

            if (result.Count > 0)
                return Response(HttpStatusCode.OK, result);
            else
                return Response(HttpStatusCode.NoContent);
            
        }

        private void LevelUpChecking(ref User user, int levelCeil ,  int Prize, int nextLevelID)
        {
            user.Score += Prize;
            if (user.LevelProgress + Prize >= levelCeil)
            {
                user.CurrentLevelID = nextLevelID;
                int remained = (user.LevelProgress + Prize) - levelCeil;
                user.LevelProgress = remained;
            }
            else
            {
                user.LevelProgress += Prize;
            }
        }

        private void AddRemainedResults(int RemainedNumber, ref List<Achievement> Usuals, ref List<Achievement> AdHoc, ref List<Achievement> NotAchieved)
        {
            int counter = 0;
            int adhocSize = AdHoc.Count;
            int usualsSize = Usuals.Count;
            int breakflag = 0;

            for (int i = 0; i < RemainedNumber; ++i)
            {
                if (i < adhocSize)
                {
                    NotAchieved.Add(AdHoc[i]);
                    ++counter;
                }
                else
                {
                    ++breakflag;
                }
                if (counter == RemainedNumber) break;

                if (i < usualsSize)
                {
                    NotAchieved.Add(Usuals[i]);
                    ++counter;
                }
                else
                {
                    ++breakflag;
                }

                if (counter == RemainedNumber) break;
                if (breakflag == 2)
                    break;
                else
                    breakflag = 0;
            }
        }

        private async Task<int> GetNextLevelID(int currnetLevelNumber)
        {
            return await mDb.Set<Level>().AsNoTracking().Where(l => l.LevelNumber == (currnetLevelNumber + 1)).Select(l => l.ID).SingleOrDefaultAsync();
        }
    }
}