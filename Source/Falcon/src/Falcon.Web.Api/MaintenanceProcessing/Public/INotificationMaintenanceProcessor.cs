using System.Threading.Tasks;

namespace Falcon.Web.Api.MaintenanceProcessing.Public
{
    public interface INotificationMaintenanceProcessor
    {
        Task<bool> SendFriendRequestNotification(int UserID);

    }
}