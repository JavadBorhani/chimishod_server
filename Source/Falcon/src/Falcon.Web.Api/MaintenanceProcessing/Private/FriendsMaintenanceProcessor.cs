using Falcon.Common;
using Falcon.Common.Security;
using Falcon.Data.QueryProcessors;
using Falcon.EFCommonContext.DbModel;
using Falcon.Web.Api.JobSystem.Public;
using Falcon.Web.Api.MaintenanceProcessing.Public;
using Falcon.Web.Models.Api.Friend;
using System.Threading.Tasks;

namespace Falcon.Web.Api.MaintenanceProcessing.Private
{
    public class FriendsMaintenanceProcessor : IFriendsMaintenanceProcessor
    {
        private readonly IFriendsQueryProcessor mFriendQuery;
        private readonly IUserSession mUserSession;
        private readonly IJobManager mJobManager;
        private readonly INotificationMaintenanceProcessor mNotificationManager;
        private readonly IDateTime mDateTime;

        public FriendsMaintenanceProcessor(
            IFriendsQueryProcessor FriendsQuery , 
            IUserSession UserSession , 
            IJobManager JobManager ,
            INotificationMaintenanceProcessor NotificationManager , IUserQueryProcessor UserQuery , IDateTime DateTime)
        {
            mFriendQuery = FriendsQuery;
            mUserSession = UserSession;
            mJobManager = JobManager;
            mNotificationManager = NotificationManager;
            mDateTime = DateTime;
        }

        public async Task<SFriend> CreateRelation(int FriendID)
        {
            var relation = await mFriendQuery.CreateRelation(FriendID);

            if (relation)
            {
                await mNotificationManager.SendFriendRequestNotification(FriendID, mUserSession.ID);

                var friend = new SFriend
                {
                    UserID = FriendID,
                    RelationOperatorIsMe = true,
                    Status = RelationStatus.Pending
                };

                return friend;
            }
            else
            {
                return null;
            }

        }

        public async Task<SFriend> DeleteRelation(int FriendID)
        {
            var deleted = await mFriendQuery.DeleteRelation(FriendID);
            if(deleted)
            {
                var friend = new SFriend
                {
                    UserID = FriendID,
                    RelationOperatorIsMe = true,
                    Status = RelationStatus.None
                };
                return friend;
            }
            else
            {
                return null;
            }
        }

        public async Task<SFriend> UpdateRelation(int FriendID, RelationStatus Status)
        {
            var friend = await mFriendQuery.GetFriendRelationshipAsNoTracking(FriendID);

            if (friend != null)
            {
                switch (friend.RelationStatus)
                {
                    case (int) RelationStatus.Pending:

                        var pending = await PendingToStatus(friend, FriendID, Status);

                        if(pending != null)
                        {
                            await mNotificationManager.SendFriendResponseNotification(FriendID, new Models.Api.Notification.Client.SFriendResponse
                            {
                                UserID = mUserSession.ID, 
                                RelationStatus = pending.Status
                            });
                        }
                        return pending;


                    case (int) RelationStatus.Accepted:

                        var accpeted = await AcceptedToStatus(FriendID, Status);
                        return accpeted;    

                    case (int)RelationStatus.Rejected:

                        var rejected = RejectedToStatus();
                        return rejected;

                    case (int)RelationStatus.Blocked:

                        var blocked = await BlockedToStatus(FriendID, friend, Status);
                        return blocked;

                }

            }
            return null;
        }

        private async Task<SFriend> PendingToStatus(Relationship Relationship, int FriendID , RelationStatus Status)
        {

            if (Status == RelationStatus.Pending || Status == RelationStatus.Accepted || Status == RelationStatus.Blocked)
                return null;

            var status = await mFriendQuery.UpdateRelationship(FriendID, Status);

            if (status)
            {
                if(Status == RelationStatus.Rejected || Status == RelationStatus.None)
                {
                    return new SFriend
                    {
                        UserID = FriendID,
                        RelationOperatorIsMe = true,
                        Status = RelationStatus.None
                    };
                }
                else
                {
                    return new SFriend
                    {
                        UserID = FriendID,
                        RelationOperatorIsMe = true,
                        Status = Status
                    };
                }                   
            }
            return null;

        }
        private async Task<SFriend> AcceptedToStatus(int FriendID , RelationStatus Status)
        {
            if (Status == RelationStatus.Accepted ||
                           Status == RelationStatus.Pending)
                return null;

            var accepted = await mFriendQuery.UpdateRelationship(FriendID, Status);

            if (accepted)
            {
                return new SFriend
                {
                    RelationOperatorIsMe = true,
                    Status = Status,
                    UserID = mUserSession.ID,
                };
            }

            return null;
        }
        private  SFriend RejectedToStatus()
        {
            // no request should come here
            return null;
        }
        private async Task<SFriend> BlockedToStatus(int FriendID , Relationship Relationship , RelationStatus Status)
        {
            if (Relationship.OperatedByID == mUserSession.ID)
            {
                if(Status == RelationStatus.Accepted || 
                    Status == RelationStatus.Rejected)
                {
                    var accepted = await mFriendQuery.UpdateRelationship(FriendID, Status);

                    if (accepted)
                    {
                        return new SFriend
                        {
                            RelationOperatorIsMe = true,
                            Status = Status,
                            UserID = mUserSession.ID,
                        };
                    }

                    return null;
                }
            }
            return null;
        }
    }
}