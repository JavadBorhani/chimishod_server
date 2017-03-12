using System;
using System.Threading.Tasks;
using Falcon.Data;
using Falcon.Web.Models.Api;
using Falcon.EFCommonContext;
using Falcon.Common.Security;
using Falcon.EFCommonContext.DbModel;
using System.Linq;
using System.Data.Entity;
using Falcon.Common;

namespace Falcon.Database.SqlServer.QueryProcessors
{
    public class CodeGiftsQueryProcessor : ICodeGiftsQueryProcessor
    {
        private readonly IDbContext mDb;
        private readonly IWebUserSession mUserSession;
        private readonly IDateTime mDateTime;

        public CodeGiftsQueryProcessor(IDbContext Database , IWebUserSession UserSession , IDateTime DateTime)
        {
            mDb = Database;
            mUserSession = UserSession;
        }
        public async Task<bool> HasGotCodeGift(int ID)
        {
            return await mDb.Set<AchievedCodeGift>()
                .AsNoTracking().
                CountAsync(cg => cg.UserID == mUserSession.UserID && cg.CodeGiftID == ID ) > 0;
        }
        public async Task<bool> AddCodeGiftByID(int ID)
        {
            //TODO : Write trigger to increase and decrease number of added
            if (await CodeGiftExists(ID))
            {
                mDb.Set<AchievedCodeGift>().Add(new AchievedCodeGift
                {
                    UserID = mUserSession.UserID,
                    CodeGiftID = ID,
                    AchievedDate = mDateTime.Now
                });
                mDb.SaveChanges();
                return true;
            }
            else
            {
                return false;
            }
        }

        private async Task<bool> CodeGiftExists(int ID)
        {
            return await mDb.Set<CodeGift>().CountAsync(cg => cg.ID == ID) > 0;
        }

        public async Task<CodeGift> GetCodeGiftByID(int ID)
        {
            return await mDb.Set<CodeGift>().AsNoTracking().Where(cg => cg.ID == ID).SingleOrDefaultAsync();
        }

        public async Task<bool> IsExpired(int ID)
        {
            var time = mDateTime.Now;
            var result = await mDb.Set<CodeGift>().AsNoTracking().Where(cg => cg.ID == ID).Select(cg => new
            {
                cg.StartDate,
                cg.ExpireDate,
                cg.TotalUserCount,
                cg.TotalUserRegistered
            }).SingleOrDefaultAsync();

            if(time >= result.StartDate &&  time <= result.ExpireDate && 
                result.TotalUserRegistered < result.TotalUserCount)
            {
                return true;
            }
            else
            {
                return false; 
            }
        }
    }
}
