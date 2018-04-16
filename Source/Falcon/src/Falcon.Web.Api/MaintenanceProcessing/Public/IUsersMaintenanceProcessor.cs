using Falcon.Web.Models.Api.Notification;
using Falcon.Web.Models.Api.User;
using System.Threading.Tasks;

namespace Falcon.Web.Api.MaintenanceProcessing.Public
{
    public interface IUsersMaintenanceProcessor
    {
        Task<int> LevelUp(int Prize); // will return new amount of coin if the user has leveled up 
        Task<string> CreateNewUser(SUserRegistrationForm RegistrationForm);
        Task<bool> SaveImageUrl(string ImageRelativePath);
        Task<bool> UpdateNotificationID(SNotificationID notificationID);
        Task<bool> BanUserByQuestionID(int QuestionID);
    }
}
