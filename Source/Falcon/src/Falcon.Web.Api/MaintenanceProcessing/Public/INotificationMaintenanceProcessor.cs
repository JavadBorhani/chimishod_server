using Falcon.Web.Models.Api;
using Falcon.Web.Models.Api.Notification.Client;
using System.Threading.Tasks;

namespace Falcon.Web.Api.MaintenanceProcessing.Public
{
    public interface INotificationMaintenanceProcessor
    {
        Task<bool> SendFriendRequestNotification(int FriendID , int UserInfoToSend);
        Task<bool> SendFriendResponseNotification(int FriendID, SFriendResponse FriendResponse);
        Task<bool> SentQuestionToFriends(int[] FriendID, SQuestion QuestionInfo);
        Task<bool> InboxQuestionToFriends(int[] FriendID, SQuestion QuestionInfo);
        Task<bool> BanQuestionToAllClients(int[] QuestionID);
    }
}