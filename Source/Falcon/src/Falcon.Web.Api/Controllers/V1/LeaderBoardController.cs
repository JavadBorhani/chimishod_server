﻿// Flapp Copyright 2017-2018

using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Threading.Tasks;
using System.Web.Http;
using Falcon.EFCommonContext.DbModel;
using Falcon.Common;
using AutoMapper;
using Falcon.Web.Models.Api;
using Falcon.Web.Common;
using Falcon.EFCommonContext;
using Falcon.Web.Api.Utilities.Base;
using Falcon.Common.Security;

namespace Falcon.Web.Api.Controllers.V1
{
    [UnitOfWorkActionFilter]
    public class LeaderBoardController : FalconApiController
    {
        private readonly IDbContext mDb;
        private readonly IMapper mMapper;
        private readonly IWebUserSession mUserSession;

        public LeaderBoardController(IMapper Mapper, IDbContext Database , IWebUserSession UserSession)
        {
            mMapper = Mapper;
            mDb = Database;
            mUserSession = UserSession;
        }

        [Route("LeaderBoard/")]
        [HttpPost]
        public async Task<IHttpActionResult> GetLeaderBoardList()
        {
            var leaderboard = await mDb.Set<User>().AsNoTracking()
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

            var userAvatarPics = await mDb.Set<SelectedAvatar>().AsNoTracking()
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
    }
}