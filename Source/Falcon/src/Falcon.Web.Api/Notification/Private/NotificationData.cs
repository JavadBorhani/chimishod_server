using AutoMapper;
using Falcon.EFCommonContext;
using Falcon.EFCommonContext.DbModel;
using Falcon.Web.Api.Notification.Public;
using Falcon.Web.Common;
using Falcon.Web.Models.Api.Notification;
using System.Linq;

namespace Falcon.Web.Api.Notification.Private
{
    public class NotificationData : INotificationData
    {

        private SNotificationConfig mCurrentNotificationConfig;

        public virtual IDbContext mDB
        {
            get
            {
                return WebContainerManager.Get<IDbContext>();
            }
        }

        public virtual IMapper mMapper
        {
            get
            {
                return WebContainerManager.Get<IMapper>();
            }
        }

        public SNotificationConfig GetState()
        {
            if (mCurrentNotificationConfig == null)
            {
                ReadStateFromDatabase();
            }
            return mCurrentNotificationConfig;
        }

        public void ReadStateFromDatabase()
        {
            var appState = mDB.Set<NotificationSystemConfiguration>().AsNoTracking().FirstOrDefault();
            if (appState != null)
            {
                mCurrentNotificationConfig = mMapper.Map<SNotificationConfig>(appState);
            }
        }

        public bool SetState(SNotificationConfig NewState)
        {
            if (ModelIsValid(NewState))
            {
                var dbAppState = mDB.Set<NotificationSystemConfiguration>().FirstOrDefault();
                dbAppState = mMapper.Map<NotificationSystemConfiguration>(NewState);
                mDB.SaveChanges();
            }
            return false;
        }

        private bool ModelIsValid(SNotificationConfig model)
        {
            return (!string.IsNullOrEmpty(model.Name) ||
                !string.IsNullOrEmpty(model.EndPointUri) ||
                !string.IsNullOrEmpty(model.AuthenticationKey) ||
                !string.IsNullOrEmpty(model.FriendRequest_Title) ||
                !string.IsNullOrEmpty(model.SentRequest_Title) ||
                !string.IsNullOrEmpty(model.InboxRequest_Title) ||
                !string.IsNullOrEmpty(model.FriendResponse_Title) ||

                !string.IsNullOrEmpty(model.FriendRequest_Description) ||
                !string.IsNullOrEmpty(model.SentRequest_Description) ||
                !string.IsNullOrEmpty(model.InboxRequest_Description) ||
                !string.IsNullOrEmpty(model.FriendResponse_Description) ||

                !string.IsNullOrEmpty(model.FriendRequest_Image) ||
                !string.IsNullOrEmpty(model.SentRequest_Image) ||
                !string.IsNullOrEmpty(model.InboxRequest_Image) ||
                !string.IsNullOrEmpty(model.FriendResponse_Image) 
                );

        }
    }
}