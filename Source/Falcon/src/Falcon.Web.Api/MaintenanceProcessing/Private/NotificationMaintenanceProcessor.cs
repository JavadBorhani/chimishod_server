using Falcon.Common;
using Falcon.Data.QueryProcessors;
using Falcon.Web.Api.JobSystem.Public;
using Falcon.Web.Api.MaintenanceProcessing.Public;
using Falcon.Web.Api.Notification.Public;
using Falcon.Web.Models.Api;
using Falcon.Web.Models.Api.Friend;
using Falcon.Web.Models.Api.Notification;
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
        private readonly SNotificationConfig mNotificationConfig;
        public NotificationMaintenanceProcessor(
            IUserQueryProcessor UserQuery, 
            IDateTime DateTime, 
            INotificationSystem Notification , 
            IJobManager JobManager , 
            INotificationData NotificationData)
        {
            mDateTime = DateTime;
            mUserQuery = UserQuery;
            mNotificationSystem = Notification;
            mJobManager = JobManager;
            mNotificationConfig = NotificationData.GetState();
        }


        public async Task<bool> SendFriendRequestNotification(int FriendID, int UserInfoToSend)
        {
            var friendNotificationID = await mUserQuery.GetNotificationID(FriendID);
            var user = await mUserQuery.GetUserByID(UserInfoToSend);

            var notification = new SClientNotificationData()
            {
                FriendRequest = new System.Collections.Generic.List<SFriendRequest>()
                {
                    new SFriendRequest
                    {
                        UserID = UserInfoToSend ,
                        PictureURL = user.AvatarImagePath ,
                        RelationState =  (int)RelationStatus.Pending ,
                        Username = user.UserName
                    }
                },
                ServerDate = mDateTime.Now,
                Type = NotificationType.FriendRequest
            };

            RequestCommonInfo Info = new RequestCommonInfo
            {
              Title = mNotificationConfig.FriendRequest_Title,
              Descrption = mNotificationConfig.FriendRequest_Description,
              ImageUrl = mNotificationConfig.FriendRequest_Image,
            };

            mJobManager.Enqueue(() => mNotificationSystem.SendRequest(new string[] { friendNotificationID }, notification, Info));

            return true;
        }

        public async Task<bool> SendFriendResponseNotification(int FriendID, SFriendResponse FriendResponse)
        {
            var friendNotificationID = await mUserQuery.GetNotificationID(FriendID);

            var notification = new SClientNotificationData()
            {
                FriendResponse = new System.Collections.Generic.List<SFriendResponse>()
                {
                    new SFriendResponse
                    {
                        RelationStatus = FriendResponse.RelationStatus,
                        UserID = FriendResponse.UserID
                    },
                },

                ServerDate = mDateTime.Now,
                Type = NotificationType.FriendResponse
            };

            RequestCommonInfo Info = new RequestCommonInfo
            {
                Title = mNotificationConfig.FriendResponse_Title,
                Descrption = mNotificationConfig.FriendResponse_Description,
                ImageUrl = mNotificationConfig.FriendResponse_Image,
            };

            mJobManager.Enqueue(() => mNotificationSystem.SendRequest(new string[] { friendNotificationID }, notification , Info));

            return true;
        }

        public async Task<bool> SentQuestionToFriends(int[] FriendID, SQuestion QuestionInfo)
        {
            var friendNotificationID = await mUserQuery.GetNotificationIDs(FriendID);

            var notification = new SClientNotificationData()
            {

                SentQuestion = new System.Collections.Generic.List<SSentQuestion>()
                {
                    
                },
                ServerDate = mDateTime.Now,
                Type = NotificationType.SentQuestion
            };

            RequestCommonInfo Info = new RequestCommonInfo
            {
                Title = mNotificationConfig.SentRequest_Title,
                Descrption = mNotificationConfig.SentRequest_Description,
                ImageUrl = mNotificationConfig.SentRequest_Image,
            };

            mJobManager.Enqueue(() => mNotificationSystem.SendRequest(friendNotificationID , notification, Info));

            return true;
        }

        public async Task<bool> InboxQuestionToFriends(int[] FriendID, SQuestion QuestionInfo)
        {
            var friendNotificationID = await mUserQuery.GetNotificationIDs(FriendID);

            var notification = new SClientNotificationData()
            {

                InboxQuestion = new System.Collections.Generic.List<SInboxQuestion>()
                {
                    
                },
                ServerDate = mDateTime.Now,
                Type = NotificationType.InboxQuestion
            };

            RequestCommonInfo Info = new RequestCommonInfo
            {
                Title = mNotificationConfig.InboxRequest_Title,
                Descrption = mNotificationConfig.InboxRequest_Title,
                ImageUrl = mNotificationConfig.FriendResponse_Image,
            };

            mJobManager.Enqueue(() => mNotificationSystem.SendRequest(friendNotificationID, notification, Info));

            return true;
        }
    }
}