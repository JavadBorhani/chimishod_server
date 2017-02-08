using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Description;
using Falcon.EFCommonContext.DbModel;
using AutoMapper;
using Falcon.Web.Models.Api;
using System.Web.Http.Results;
using Falcon.Common;
using System.Collections.Generic;
using Falcon.Web.Common;

namespace Falcon.Web.Api.Controllers.V1
{
    [UnitOfWorkActionFilter]
    public class AchievedPosessionsController : ApiController
    {
        private DbEntity db = new DbEntity();

        private readonly IMapper mMapper;
        private readonly IDateTime mDateTime;

        public AchievedPosessionsController(IMapper Mapper , IDateTime DateTime)
        {
            mMapper = Mapper;
            mDateTime = DateTime;
        }

        [Route("Achievements/{UUID}")]
        [ResponseType(typeof(SAchievement))]
        [HttpPost]
        public async Task<IHttpActionResult> GetAchievementList(string UUID)
        {
            var userID = await db.Users.Where(u => u.UUID == UUID).Select(u => u.ID).SingleOrDefaultAsync();
            if(userID != 0) // user Exists
            {
                var achievables = await db.AchievedPosessions.AsNoTracking()
                                                            .Include( Ap => Ap.Achievement)
                                                            .Where(ap => ap.UserID == userID &&  ap.AchieveStateID == Constants.DefaultValues.AchievementDefaultAchievableID)
                                                            .Select( ap => ap.Achievement)
                                                            .ToListAsync();

                List<Achievement> adhoc = new List<Achievement>();
                List<Achievement> usuals = new List<Achievement>();

                var tempDistinctAchievable = achievables.GroupBy(a => a.CategoryID).Select(g => g.FirstOrDefault()).Count();

                if (tempDistinctAchievable >= Constants.DefaultValues.AchievementsMinimumAchivables)
                {
                    var result = mMapper.Map<List<Achievement>, List<SAchievement>>(achievables.GroupBy( a => a.CategoryID).Select(g => g.FirstOrDefault()).ToList());
                    return Response(HttpStatusCode.OK, result);
                }
                else
                {
                    List<Achievement> newAchievables = new List<Achievement>();
                    var userCurrentLevel = await db.Users.Where(u => u.ID == userID).Select(u => u.CurrentLevelID).SingleOrDefaultAsync();

                    
                    var achievableAndAchievedIDList = await db.AchievedPosessions
                                            .AsNoTracking()
                                            .Include(ap => ap.Achievement)
                                            .Where(ap => ap.UserID == userID &&
                                                   ap.AchieveStateID == Constants.DefaultValues.AchievementDefaultAchievedID)
                                            .Select(ap => ap.Achievement.ID).ToListAsync();

                    achievableAndAchievedIDList.AddRange(achievables.Select( a => a.ID));

                    //Get list of Ad-hoc 
                    adhoc = await db.Achievements.AsNoTracking()
                        .Where(a => a.QueryTypeID == Constants.DefaultValues.AchievementAdHocQueryTypeID && a.LevelID >= userCurrentLevel && !achievableAndAchievedIDList.Contains(a.ID))
                        .ToListAsync();
                    

                    for(int i = adhoc.Count -1 ;  i >= 0; --i)
                    {
                        if (!string.IsNullOrEmpty(adhoc[i].Query))
                        {
                            int result = await db.Database.ExecuteSqlCommandAsync(adhoc[i].Query, userID);
                            if (result == 1)
                            {
                                newAchievables.Add(adhoc[i]);
                                ++tempDistinctAchievable;
                                adhoc.RemoveAt(i);
                            }
                        }
                    }

                    var purchasedCategories = await db.PurchaseCategories.AsNoTracking().Where(pc => pc.UserID == userID).Select( pc => pc.CategoryID).ToListAsync();
                    purchasedCategories.Add(Constants.DefaulUser.CategoryID); // Add Default CategoryID

                    // Get List of category base
                    usuals = await db.Achievements.AsNoTracking()
                        .Where(a => a.QueryTypeID == Constants.DefaultValues.AchievementCategoryQueryTypeID &&
                                                    !achievableAndAchievedIDList.Contains(a.ID) && 
                                                    purchasedCategories.Contains(a.CategoryID ?? 0) )
                        .GroupBy( a => a.CategoryID)
                        .Select( g => g.FirstOrDefault())
                        .ToListAsync();

                    for(int i = usuals.Count -1; i >= 0; --i)
                    {
                        int? value = usuals[i].CategoryID;

                        var isAchievable = await db.Answers
                            .AsNoTracking()
                            .Include(a => a.Question)
                            .Where(u => u.UserID == userID && u.Question.Catgory_ID == (value ?? 0))
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
                            UserID = userID,
                            AchievementID = newAchievables[i].ID,
                            AchieveStateID = Constants.DefaultValues.AchievementDefaultAchievableID,
                            AchievedDate = null,
                            AchievableDate = mDateTime.Now,
                        });
                    }
                    if(list.Count > 0 )
                    {
                        db.AchievedPosessions.AddRange(list);
                        await db.SaveChangesAsync();
                        achievables.AddRange(newAchievables);
                    }
                }

                if(tempDistinctAchievable > 0 && tempDistinctAchievable < Constants.DefaultValues.AchievementsMinimumAchivables)
                {
                    var mapAchivable = mMapper.Map<List<Achievement>, List<SAchievement>>(
                        achievables
                        .GroupBy(a => a.CategoryID)
                        .Select(g => g.FirstOrDefault())
                        .ToList());

                    List<Achievement> notAchieved = new List<Achievement>();

                    int remainedNumber = Constants.DefaultValues.AchievementsMinimumAchivables - mapAchivable.Count;

                    int counter = 0;
                    int adhocSize = adhoc.Count;
                    int usualsSize = usuals.Count;
                    int breakflag = 0;

                    for (int i = 0; i < remainedNumber; ++i)
                    {
                        if (i < adhocSize)
                        {
                            notAchieved.Add(adhoc[i]);
                            ++counter;
                        }
                        else
                        {
                            ++breakflag;
                        }
                        if (counter == remainedNumber) break;

                        if (i < usualsSize)
                        {
                            notAchieved.Add(usuals[i]);
                            ++counter;
                        }
                        else
                        {
                            ++breakflag;
                        }

                        if (counter == remainedNumber) break;
                        if (breakflag == 2)
                            break;
                        else
                            breakflag = 0;
                    }

                    var mapNotAchieved = new List<SAchievement>(notAchieved.Count);
                    for(int i = 0; i < notAchieved.Count; ++i)
                    {
                        mapNotAchieved.Add (new SAchievement
                            {
                                ID = notAchieved[i].ID,
                                Name = notAchieved[i].Name,
                                Description = notAchieved[i].Description,
                                Star = notAchieved[i].Star,
                                Icon = notAchieved[i].Icon,
                                RectangleColor = notAchieved[i].RectangleColor,
                                AchievementState = Constants.DefaultValues.AchievementDefaultNotAchieved
                            });
                    }

                    mapAchivable.AddRange(mapNotAchieved);
                    return Response(HttpStatusCode.OK, mapAchivable);

                }
                else if (tempDistinctAchievable > 0 && tempDistinctAchievable >= Constants.DefaultValues.AchievementsMinimumAchivables) 
                {
                    //map data then send 
                    var result = achievables.
                        GroupBy(a => a.CategoryID)
                        .Select(g => g.FirstOrDefault())
                        .Take(Constants.DefaultValues.AchievementsMinimumAchivables)
                        .ToList();

                    var mapResult = mMapper.Map<List<Achievement>, List<SAchievement>>(result);

                    return Response(HttpStatusCode.OK, mapResult);
                }
                else if(tempDistinctAchievable <= 0)
                {
                    List<Achievement> notAchieved = new List<Achievement>();

                    int remainedNumber = Constants.DefaultValues.AchievementsMinimumAchivables;

                    int counter = 0;
                    int adhocSize = adhoc.Count;
                    int usualsSize = usuals.Count;
                    int breakflag = 0;

                    for (int i = 0; i < remainedNumber; ++i)
                    {
                        if (i < adhocSize)
                        {
                            notAchieved.Add(adhoc[i]);
                            ++counter;
                        }
                        else
                        {
                            ++breakflag;
                        }
                        if (counter == remainedNumber) break;

                        if (i < usualsSize)
                        {
                            notAchieved.Add(usuals[i]);
                            ++counter;
                        }
                        else
                        {
                            ++breakflag;
                        }

                        if (counter == remainedNumber) break;
                        if (breakflag == 2)
                            break;
                        else
                            breakflag = 0; 
                    }

                    var mapNotAchieved = new List<SAchievement>(notAchieved.Count);
                    for (int i = 0; i < notAchieved.Count; ++i)
                    {
                        mapNotAchieved.Add(new SAchievement
                        {
                            ID = notAchieved[i].ID,
                            Name = notAchieved[i].Name,
                            Description = notAchieved[i].Description,
                            Star = notAchieved[i].Star,
                            Icon = notAchieved[i].Icon,
                            RectangleColor = notAchieved[i].RectangleColor,
                            AchievementState = Constants.DefaultValues.AchievementDefaultNotAchieved
                        });
                    }

                    return Response(HttpStatusCode.OK, mapNotAchieved);
                }
                else
                {
                    return Response(HttpStatusCode.NoContent);
                }
            }
            else
            {
                return Response(HttpStatusCode.Unauthorized);
            }
        }

        [ResponseType(typeof(int))]
        [Route("Achievements/Change/{UUID}/{AchievementID}")]
        [HttpPost]
        public async Task<IHttpActionResult> ChangeAchievableToAchieved(string UUID, int AchievementID)
        {
            var user = await db.Users.Where(u => u.UUID == UUID).SingleOrDefaultAsync();

            if (user != null) //user Exists
            {
                var achievable = await db.AchievedPosessions
                                        .Include(ap => ap.Achievement)
                                        .Where(ap => ap.UserID == user.ID &&
                                               ap.AchievementID == AchievementID &&
                                               ap.AchieveStateID == Constants.DefaultValues.AchievementDefaultAchievableID)
                                        .SingleOrDefaultAsync();
                if (achievable != null)
                {
                    achievable.AchieveStateID = Constants.DefaultValues.AchievementDefaultAchievedID;
                    achievable.AchievedDate = mDateTime.Now;
                    user.TotalStars += achievable.Achievement.Star;
                    await db.SaveChangesAsync();
                    return Response(HttpStatusCode.OK, user.TotalStars);
                }
                return Response(HttpStatusCode.Unauthorized);
            }
            else
            {
                return Response(HttpStatusCode.Unauthorized);
            }
        }

        [Route("Achievements/Achieved/{UUID}")]
        [ResponseType(typeof(SAchievement))]
        [HttpPost]
        public async Task<IHttpActionResult> GetAchievedList(string UUID)
        {
            int userID = await db.Users.AsNoTracking().Where(u => u.UUID == UUID).Select(u => u.ID).SingleOrDefaultAsync();
            if(userID != 0) // User Exists
            {
                var achievedList = await db.AchievedPosessions
                                                            .AsNoTracking()
                                                            .Include( ap => ap.Achievement)
                                                            .Where( ap => ap.UserID == userID && 
                                                                    ap.AchieveStateID == Constants.DefaultValues.AchievementDefaultAchievedID)
                                                            .Select(ap => ap.Achievement)
                                                            .ToListAsync();


                var result = mMapper.Map<List<Achievement>, List<SAchievement>>(achievedList);

                if (result.Count > 0)
                    return Response(HttpStatusCode.OK, result);
                else
                    return Response(HttpStatusCode.NoContent);
            }
            else
            {
                return Response(HttpStatusCode.Unauthorized);
            }
        }

        [Route("Achievements/Achievable/{UUID}")]
        [ResponseType(typeof(SAchievement))]
        [HttpPost]
        public async Task<IHttpActionResult> GetAchievableList(string UUID)
        {
            var userID = await db.Users.AsNoTracking().Where(u => u.UUID == UUID).Select(u => u.ID).SingleOrDefaultAsync();
            if(userID != 0)
            {
                var achievableList = await db.AchievedPosessions
                                                .AsNoTracking()
                                                .Include(ap => ap.Achievement)
                                                .Where( ap => ap.UserID == userID &&  
                                                        ap.AchieveStateID == Constants.DefaultValues.AchievementDefaultAchievableID)
                                                .Select(ap => ap.Achievement)
                                                .ToListAsync();

                var result = mMapper.Map<List<Achievement>, List<SAchievement>>(achievableList);

                if (result.Count > 0)
                    return Response(HttpStatusCode.OK, result);
                else
                    return Response(HttpStatusCode.NoContent);
            }
            else
            {
                return Response(HttpStatusCode.Unauthorized);
            }
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool AchievedPosessionExists(int id)
        {
            return db.AchievedPosessions.Count(e => e.ID == id) > 0;
        }

        private ResponseMessageResult Response(HttpStatusCode Code)
        {
            return ResponseMessage(Request.CreateResponse(Code));
        }

        private ResponseMessageResult Response(HttpStatusCode Code, object DataToSend)
        {
            return ResponseMessage(Request.CreateResponse(Code, DataToSend));
        }
    }
}