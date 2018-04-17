using Falcon.Web.Api.Notification.Private;
using Falcon.Web.Models.Api.Notification;
using Falcon.Web.Models.Api.Notification.Client;
using System.Threading.Tasks;

namespace Falcon.Web.Api.Notification.Public
{
    public interface INotificationSystem
    {
        Task<ResponseToken> SendRequest(
            SClientNotificationData NotificationData , 
            RequestCommonInfo RequestInfo , 
            string[] FriendNotificationIDs = null, 
            string[] Segments = null); // intentionally passing RequestInfo

    }

}
