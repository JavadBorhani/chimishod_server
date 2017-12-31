using Falcon.Common.Security;
using Falcon.EFCommonContext;

namespace Falcon.Database.SqlServer.QueryProcessors
{
    public class NotificationsQueryProcessor /*: INotificationsQueryProcessor*/
    {
        private readonly IDbContext mDb;
        private readonly IWebUserSession mUserSession;

        public NotificationsQueryProcessor(IDbContext Database , IWebUserSession WebUserSession)
        {
            mDb = Database;
            mUserSession = WebUserSession;
        }
        //public async Task<bool> AddDisplayedNotification(SDisplayedNotification DisplayedNotification)
        //{
        //    mDb.Set<DisplayedNotification>().Add(new DisplayedNotification
        //    {
        //        UserID = DisplayedNotification.UserID , 
        //        InsertDate = DisplayedNotification.InsertDate , 
        //        ExpireDate = DisplayedNotification.ExpireDate,
        //        NotificationID = DisplayedNotification.NotificationID,
        //    });

        //    await mDb.SaveChangesAsync();
        //    return true;
        //}
        //public async Task<List<int>> GetDisplayedIdList()
        //{
        //    return await mDb.Set<DisplayedNotification>()
        //       .AsNoTracking()
        //       .Where(ag => ag.UserID == mUserSession.ID)
        //       .Select(u => u.NotificationID)
        //       .ToListAsync();
        //}
    }
}
