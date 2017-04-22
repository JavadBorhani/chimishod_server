using Falcon.Data.QueryProcessors;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Falcon.Web.Models.Api;
using Falcon.EFCommonContext;
using Falcon.EFCommonContext.DbModel;

namespace Falcon.Database.SqlServer.QueryProcessors
{
    public class NotificationsQueryProcessor : INotificationsQueryProcessor
    {
        private readonly IDbContext mDb;

        public NotificationsQueryProcessor(IDbContext Database)
        {
            mDb = Database;
        }
        public async Task<bool> AddDisplayedNotification(SDisplayedNotification DisplayedNotification)
        {
            mDb.Set<DisplayedNotification>().Add(new DisplayedNotification
            {
                UserID = DisplayedNotification.UserID , 
                InsertDate = DisplayedNotification.InsertDate , 
                ExpireDate = DisplayedNotification.ExpireDate,
                NotificationID = DisplayedNotification.NotificationID,
            });
            await mDb.SaveChangesAsync();
            return true;
        }
    }
}
