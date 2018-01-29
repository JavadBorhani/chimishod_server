using Falcon.Web.Api.Notification.Private;
using System.Threading.Tasks;

namespace Falcon.Web.Api.Notification.Public
{
    public interface INotificationSystem
    {
        Task<ResponseToken> SendToFriend(string[] FriendNotificationIDs);

    }
}
