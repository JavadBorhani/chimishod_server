using Falcon.Common.Security;
using Falcon.Data.QueryProcessors;
using Falcon.EFCommonContext;
using Falcon.EFCommonContext.DbModel;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Falcon.Web.Models.Api;
using Falcon.Data;

namespace Falcon.Database.SqlServer.QueryProcessors
{
    public class UserStatQueryProcessor : IUserStatQueryProcessor
    {
        private readonly IDbContext mDb;
        private readonly IUserSession mUserSession;
        public UserStatQueryProcessor(IDbContext Database , IUserSession UserSession)
        {
            mDb = Database;
            mUserSession = UserSession;
        }
        public async Task<bool> AddFortune(int Amount)
        {
            var userStat = await mDb.Set<UserStat>().FirstOrDefaultAsync(us => us.UserID == mUserSession.ID);
            userStat.SpinRemainedChance += Amount;

            await mDb.SaveChangesAsync();
            return true;
        }

        public async Task<UserStat> GetById(int ID)
        {
            var result =  await mDb.Set<UserStat>().AsNoTracking().FirstOrDefaultAsync(us => us.ID == ID);
            return result;
        }

        public Task<List<SUserCharacter>> GetLeaderBoard()
        {
            throw new NotImplementedException();
        }

        public async Task<QueryResult<SLeaderBoard>> GetLeaderBoard(PagedDataRequest RequestInfo)
        {
            var userAvatar = mDb.Set<SelectedAvatar>()
                .AsNoTracking()
                .Include(sa => sa.UserAvatar);

            var query = mDb.Set<UserStat>()
                .AsNoTracking()
                .OrderBy(pc => pc.Rank)
                .Include(pc => pc.User)
                .Include(pc => pc.User.Level)
                .Join(userAvatar , pc => pc.UserID , sa => sa.UserID, (pc, sa ) => new SLeaderBoard
                {
                    UserID = pc.User.ID,
                    LevelNumber = pc.User.Level.LevelNumber,
                    UserName = pc.User.UserName,
                    Rank = pc.Rank,
                    Score = pc.OldScore,
                    UserAvatarUrl = sa.UserAvatar.PicUrl
                })
                .OrderBy(pc => pc.Rank);

            var totalItemCount = await query.CountAsync();

            var startIndex = ResultPagingUtility.CalculateStartIndex(RequestInfo.PageNumber, RequestInfo.PageSize);

            var players = await query.Skip(startIndex).Take(RequestInfo.PageSize).ToListAsync();

            var queryResult = new QueryResult<SLeaderBoard>(players, totalItemCount, RequestInfo.PageSize);

            return queryResult;
        }

        public async Task<int> GetRemainedFortune()
        {
            var amount = await mDb.Set<UserStat>()
                .AsNoTracking()
                .Where(u => u.UserID == mUserSession.ID)
                .Select(u => u.SpinRemainedChance)
                .SingleOrDefaultAsync();

            return amount;
        }

        public async Task<SLeaderBoard> GetUserLeaderBoard()
        {
            var userAvatar = mDb.Set<SelectedAvatar>()
                .AsNoTracking()
                .Include(sa => sa.UserAvatar);

            var query = mDb.Set<UserStat>()
                .AsNoTracking()
                .Where(pc => pc.UserID == mUserSession.ID)
                .OrderBy(pc => pc.Rank)
                .Include(pc => pc.User)
                .Include(pc => pc.User.Level)
                .Join(userAvatar, pc => pc.UserID, sa => sa.UserID, (pc, sa) => new SLeaderBoard
                {
                    UserID = pc.User.ID,
                    LevelNumber = pc.User.Level.LevelNumber,
                    UserName = pc.User.UserName,
                    Rank = pc.Rank,
                    Score = pc.OldScore,
                    UserAvatarUrl = sa.UserAvatar.PicUrl
                })
                .OrderBy(pc => pc.Rank);

            var result = await query.SingleOrDefaultAsync();
            return result;
        }
    }
}
