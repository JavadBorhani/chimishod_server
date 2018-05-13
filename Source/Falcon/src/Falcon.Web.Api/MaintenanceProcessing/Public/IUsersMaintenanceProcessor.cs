using Falcon.Web.Models.Api.Notification;
using Falcon.Web.Models.Api.User;
using System.Threading.Tasks;

namespace Falcon.Web.Api.MaintenanceProcessing.Public
{
    public interface IUsersMaintenanceProcessor
    {
        /// <summary>
        /// will return new amount of coin if the user has leveled up 
        /// </summary>
        /// <param name="Prize"></param>
        /// <returns></returns>
        Task<int> LevelUp(int Prize , int WatchedAdMultiplier); 

        Task<string> CreateNewUser(SUserRegistrationForm RegistrationForm);

        Task<bool> SaveImageUrl(string ImageRelativePath);

        Task<bool> UpdateNotificationID(SNotificationID notificationID);

        Task<bool> BanUserByQuestionID(int QuestionID);

        Task<int> QuestUp(int Prize);
    }
}
