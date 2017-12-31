using Falcon.Common;
using Falcon.Common.Security;
using Falcon.Data.QueryProcessors;
using Falcon.EFCommonContext;

namespace Falcon.Database.SqlServer.QueryProcessors
{
    public class GiftQueryProcessor /*: IGiftQueryProcessor*/
    {

        private readonly IWebUserSession mUserSession;
        private readonly IDbContext mDb;
        private readonly IDateTime mDateTime;
        private readonly INotificationsQueryProcessor mNotificationQueryProcessor;

        public GiftQueryProcessor(IWebUserSession UserSession , 
            IDbContext Database , 
            IDateTime DateTime ,
            INotificationsQueryProcessor NotificationQueryProcessor)
        {
            mUserSession                = UserSession;
            mDb                         = Database;
            mDateTime                   = DateTime;
            mNotificationQueryProcessor = NotificationQueryProcessor;
        }

        /*
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
            var displayedGift = await mNotificationQueryProcessor.GetDisplayedIdList();

            var result = await mDb.Set<Gift>()
                .AsNoTracking()
                .Where(g => (g.StartDate <= date && g.ExpireDate >= date) && !achievedGift.Contains(g.ID) && !displayedGift.Contains(g.ID) )
                .Join(giftType, g => g.GiftTypeID, gt => gt.ID, (g, gt) => new SGift
                {
                    ID = g.ID,
                    Name = g.Name,
                    Image = g.Image,
                    Prize = g.Prize,
                    Day = g.Day,
                    Priority = gt.Priority,
                    Description = g.Description,
                    GiftTypeString = gt.Name,
                    ExpireDate = g.ExpireDate,
                })
                .OrderBy(m => m.Priority)
                .ToListAsync();

            return result;  
        }

        public async Task<bool> IsAchieved(int ID)
        {
            return await mDb.Set<AchievedGift>()
                .AsNoTracking()
                .CountAsync(ag => ag.GiftID == ID && ag.UserID == mUserSession.ID) > 0;
        }

        public async Task<List<int>> GetAchievedIdList()
        {
            return await mDb.Set<AchievedGift>()
                .AsNoTracking()
                .Where(ag => ag.UserID == mUserSession.ID)
                .Select(u => u.GiftID)
                .ToListAsync();
        }

        public async Task<bool> CheckGiftLogic(SGift CurrentGift)
        {
            CurrentGift.GiftType = (GiftTypes)Enum.Parse(typeof(GiftTypes), CurrentGift.GiftTypeString);
            switch (CurrentGift.GiftType)
            {
                case GiftTypes.Daily:
                    if ((mDateTime.Now - mUserSession.LastSeenDateTime).Days >= CurrentGift.Day)
                        return true;
                    break;

                case GiftTypes.AdHoc:
                    {
                        
                        if (string.IsNullOrEmpty(CurrentGift.QueryString))
                            return false;

                        int result = await mDb.Database.SqlQuery<int>(CurrentGift.QueryString, mUserSession.ID).SingleOrDefaultAsync();
                        if (result >= 1)
                            return true;

                        return false;
                    }
                case GiftTypes.DateTime:
                case GiftTypes.Message:
                    return true;
            }
            return false;
        }

        public async Task<bool> CheckGiftLogic(SGift CurrentGift, Gift Gift, DateTime DateTime)
        {
            CurrentGift.GiftType = (GiftTypes)Enum.Parse(typeof(GiftTypes), CurrentGift.GiftTypeString);
            switch (CurrentGift.GiftType)
            {
                case GiftTypes.Daily:
                    {
                        if ((DateTime - mUserSession.PrevLastSeenDateTime).Days >= CurrentGift.Day ||
                            (DateTime - mUserSession.LastSeenDateTime).Days >= CurrentGift.Day)
                            return true;
                    }
                    break;

                case GiftTypes.DateTime:

                    if ((Gift.StartDate <= DateTime && Gift.ExpireDate >= DateTime))
                        return true;

                    break;

                case GiftTypes.Message:
                    return true;

                case GiftTypes.AdHoc:
                    {
                        
                        if (string.IsNullOrEmpty(Gift.QueryString))
                            return false;

                        int result = await mDb.Database.SqlQuery<int>(Gift.QueryString, mUserSession.ID).SingleOrDefaultAsync();
                        if (result >= 1)
                            return true;

                        return false;
                    }
                default:
                    return false;
            }
            return false;
        }
        */
    }
}