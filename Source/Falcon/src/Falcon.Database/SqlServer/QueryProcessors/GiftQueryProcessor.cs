using Falcon.Data.QueryProcessors;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Falcon.EFCommonContext.DbModel;
using Falcon.Common.Security;
using Falcon.EFCommonContext;
using System.Data.Entity;
using Falcon.Common;
using Falcon.Web.Models.Api;

namespace Falcon.Database.SqlServer.QueryProcessors
{
    public class GiftQueryProcessor : IGiftQueryProcessor
    {

        private readonly IWebUserSession mUserSession;
        private readonly IDbContext mDb;
        private readonly IDateTime mDateTime;

        public GiftQueryProcessor(IWebUserSession UserSession , IDbContext Database , IDateTime DateTime)
        {
            mUserSession    = UserSession;
            mDb             = Database;
            mDateTime       = DateTime;
        }

        public async Task<bool> AddAchievedGift(int ID)
        {
            var result = await Exists(ID);
            if(result)
            {
                mDb.Set<AchievedGift>().Add(new AchievedGift
                {
                    GiftID = ID,
                    UserID = mUserSession.ID,
                    AchievedDate = mDateTime.Now
                });
                await mDb.SaveChangesAsync();

                return true;
            }
            return false;
        }

        public async Task<Gift> GetByID(int ID)
        {
            return await mDb.Set<Gift>().FindAsync(ID);
        }

        public async Task<bool> Exists(int ID)
        {
            return await mDb.Set<Gift>().AsNoTracking().CountAsync(g => g.ID == ID) > 0; 
        }

        public async Task<List<SGift>> TodayList()
        {
            var date = mDateTime.Now;
            var giftType = mDb.Set<GiftType>();

            var achievedGift = await GetAchievedIdList();

            var result = await mDb.Set<Gift>()
                .AsNoTracking()
                .Where(g => g.StartDate <= date && g.ExpireDate >= date && !achievedGift.Contains(g.ID))
                .Join(giftType , g => g.GiftTypeID , gt => gt.ID , (g , gt ) => new SGift
                {
                    ID = g.ID, 
                    Name = g.Name,
                    Image = g.Image , 
                    Prize = g.Prize ,
                    Day = g.Day,
                    Priority = gt.Priority,
                    Description = g.Description,
                })
                .OrderBy(m => m.Priority)
                .ToListAsync();

            return result;  
        }

        public async Task<bool> IsAchieved(int ID)
        {
            return await mDb.Set<AchievedGift>()
                .AsNoTracking()
                .CountAsync(ag => ag.GiftID == ID) > 0;
        }

        public async Task<List<int>> GetAchievedIdList()
        {
            return await mDb.Set<AchievedGift>()
                .AsNoTracking()
                .Where(ag => ag.UserID == mUserSession.ID)
                .Select(u => u.GiftID)
                .ToListAsync();
        }
    }
}