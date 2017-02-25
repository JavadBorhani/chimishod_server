using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Description;
using Falcon.EFCommonContext.DbModel;
using Falcon.Common;
using Falcon.Web.Api.Utilities.Extentions;
using AutoMapper;
using Falcon.Web.Models.Api;

namespace Falcon.Web.Api.Controllers.V1
{
    public class LeaderBoardController : FalconApiController
    {
        private DbEntity db = new DbEntity();

        private readonly IMapper mMapper;

        public LeaderBoardController(IMapper Mapper)
        {
            mMapper = Mapper;
        }

        [Route("LeaderBoard/{UUID}")]
        [HttpPost]
        public async Task<IHttpActionResult> GetLeaderBoardList(string UUID)
        {
            var userID = await db.Users.AsNoTracking().Where(u => u.UUID == UUID).Select(u => u.ID).SingleOrDefaultAsync();
            if(userID != 0)
            {
                var leaderboard = await db.Users.AsNoTracking()
                                            .OrderByDescending(u => u.Score)
                                            .Include(u => u.Level)
                                            .Take(Constants.Paging.UserNumberToShow)
                                            .Select(u => new SLeaderBoard
                                            {
                                                UserID = u.ID,
                                                UserName = u.UserName,
                                                LevelCeil = u.Level.ScoreCeil,
                                                LevelNumber = u.Level.LevelNumber,
                                                LevelProgress = u.LevelProgress,
                                                Score = u.Score,
                                                Rank = 0,
                                                UserAvatarUrl = ""
                                            })
                                            .ToArrayAsync();
                var userIDs = leaderboard.Select(l => l.UserID).ToList();

                var userAvatarPics = await db.SelectedAvatars.AsNoTracking()
                    .Where(sa => userIDs.Contains(sa.UserID))
                    .Include(sa => sa.UserAvatar)
                    .Select(sa => new { sa.UserAvatar.PicUrl , sa.UserID})
                    .ToListAsync();

                for(int i = 0; i < leaderboard.Length; ++i)
                {
                    leaderboard[i].Rank = (i + 1);
                    var temp = userAvatarPics.Find(uap => uap.UserID == leaderboard[i].UserID);
                    if(temp != null)
                    {
                        leaderboard[i].UserAvatarUrl = temp.PicUrl;
                        userAvatarPics.Remove(temp);
                    }
                }

                return Response(HttpStatusCode.OK, leaderboard);
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

        private bool UserExists(int id)
        {
            return db.Users.Count(e => e.ID == id) > 0;
        }
    }
}