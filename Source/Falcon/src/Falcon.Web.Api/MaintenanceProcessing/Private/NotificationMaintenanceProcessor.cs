using Falcon.Common;
using Falcon.Data.QueryProcessors;
using Falcon.Web.Api.JobSystem.Public;
using Falcon.Web.Api.MaintenanceProcessing.Public;
using Falcon.Web.Api.Notification.Public;
using Falcon.Web.Models.Api.Friend;
using Falcon.Web.Models.Api.Notification.Client;
using System.Threading.Tasks;


namespace Falcon.Web.Api.MaintenanceProcessing.Private
{
    public class NotificationMaintenanceProcessor : INotificationMaintenanceProcessor
    {
        private readonly IUserQueryProcessor mUserQuery;
        private readonly IDateTime mDateTime;
        private readonly IJobManager mJobManager;
        private readonly INotificationSystem mNotificationSystem;
        public NotificationMaintenanceProcessor(IUserQueryProcessor UserQuery, IDateTime DateTime, INotificationSystem Notification , IJobManager JobManager)
        {
            mDateTime = DateTime;
            mUserQuery = UserQuery;
            mNotificationSystem = Notification;
            mJobManager = JobManager;
        }
        public async Task<bool> SendFriendRequestNotification(int UserID)
        {
            var user = await mUserQuery.GetUserByID(UserID);

            var notification = new SClientNotificationData()
            {
                FriendRequest = new System.Collections.Generic.List<SFriendRequest>()
                {
                    new SFriendRequest
                    {
                        UserID = UserID ,
                        PictureURL = user.AvatarImagePath ,
                        RelationState =  (int)RelationStatus.Pending ,
                        Username = user.UserName
                    }
                },
                ServerDate = mDateTime.Now,
                Type = NotificationType.FriendRequest
            };

            mJobManager.Enqueue(() => mNotificationSystem.SendFriendRequest(new string[] { user.NotificationID }, notification));

            return true;
        }
    }
}