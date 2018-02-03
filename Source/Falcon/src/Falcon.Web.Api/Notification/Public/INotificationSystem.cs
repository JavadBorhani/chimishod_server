using Falcon.Web.Api.Notification.Private;
using Falcon.Web.Models.Api;
using Falcon.Web.Models.Api.Notification.Client;
using System.Threading.Tasks;

namespace Falcon.Web.Api.Notification.Public
{
    public interface INotificationSystem
    {
        Task<ResponseToken> SendFriendRequest(string[] FriendNotificationIDs ,SClientNotificationData NotificationData); // intentionally passing this
        Task<ResponseToken> SendQuestionToFriends(string[] FriendNotificationID, SQuestion Question);

    }
}
