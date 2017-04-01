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
            mDb.Set<AchievedGift>().Add(new AchievedGift
            {
                GiftID = ID,
                UserID = mUserSession.ID,
                AchievedDate = mDateTime.Now
            });
            await mDb.SaveChangesAsync();

            return true;
        }

        public async Task<Gift> GetByID(int ID)
        {
            return await mDb.Set<Gift>().FindAsync(ID);
        }

        public async Task<bool> Exists(int ID)
        {
            return await mDb.Set<Gift>().AsNoTracking().CountAsync(g => g.ID == ID) > 0; 
        }

        public async Task<List<SGift>> TodayGiftList()
        {
            var date = mDateTime.Now;
            var giftType = mDb.Set<GiftType>();

            var achievedGift = await GetAchievedIdList();

            var result = await mDb.Set<Gift>()
                .AsNoTracking()
                .Where(g => (g.StartDate <= date && g.ExpireDate >= date) && !achievedGift.Contains(g.ID))
                .Join(giftType, g => g.GiftTypeID, gt => gt.ID, (g, gt) => new SGift
                {
                    ID = g.ID,
                    Name = g.Name,
                    Image = g.Image,
                    Prize = g.Prize,
                    Day = g.Day,
                    Priority = gt.Priority,
                    Description = g.Description,
                    GiftType = (GiftTypes)Enum.Parse(typeof(GiftTypes) , g.GiftType.Name)
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

        public bool CheckGiftLogic(SGift CurrentGift)
        {
            switch (CurrentGift.GiftType)
            {
                case GiftTypes.Daily:
                    if ((mDateTime.Now - mUserSession.LastSeenDateTime).Days > CurrentGift.Day)
                        return true;
                    break;

                case GiftTypes.DateTime:
                case GiftTypes.Message:
                    return true;
            }
            return false;
        }

        public bool CheckGiftLogic(SGift CurrentGift, Gift Gift, DateTime DateTime)
        {
            switch (CurrentGift.GiftType)
            {
                case GiftTypes.Daily:

                    if ((DateTime - mUserSession.LastSeenDateTime).Days > CurrentGift.Day)
                        return true;

                    break;

                case GiftTypes.DateTime:

                    if ((Gift.StartDate <= DateTime && Gift.ExpireDate >= DateTime))
                        return false;

                    break;

                default:
                    return false;
            }
            return false;
        }
    }
}