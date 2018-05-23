using Falcon.EFCommonContext.DbModel;
using Falcon.Web.Models.Api;
using Falcon.Web.Models.Api.Config;
using Falcon.Web.Models.Api.Level;
using Falcon.Web.Models.Api.Quest;
using Falcon.Web.Models.Api.User;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Falcon.Data.QueryProcessors
{
    public interface IUserQueryProcessor
    {
        Task<int> IncreaseCoin(int Coin);
        Task<int> DecreaseCoin(int Coin);
        Task<int> GetTotalCoin();

        //Task<SUserCount> CreateUser();
        Task<User> LoadUser(int UserID);
       
        //Task<int> GetDWMCount();
        //Task<bool> UpdateLastSeenDateTime();
        //Task<bool> UpdateLastSeenDateTimeToNow();
        Task<SLevelUpInfo> UpdateLevel(int Prize , int LastLevel);
        Task<SQuestUpInfo> UpdateQuest(int Prize, int LastQuestNumber);
        Task<bool> LevelExits(int LevelNumber);
        Task<int> GetLevelPrize(int LevelNumber);
        //Task<SUserCount> GetUserCountInfo(int UserID);

        //v2 Create User
        Task<User> CreateNewUser(SUserRegistrationForm UserRegisterationData , SGameConfig GameConfig);
        Task<User> GetUserByUUIDAsNoTracking(string UUID);
        Task<User> ReteriveUserByUserPass(SUserInfo userInfo);
        Task<bool> UpdateUserNotificationID(int UserID, string UUID);
        Task<bool> Exists(string UserName);
        Task<QueryResult<User>> SearchUserNames(PagedDataRequest RequestInfo , string Expression , int[] Excepts =  null);
        Task<string> GetNotificationID(int friendID);
        Task<string[]> GetNotificationIDs(int[] friendID);
        Task<User> GetUserByID(int UserID);
        Task<List<int>> DeactivePreviousUser(SUserRegistrationForm registrationForm);
        Task<int> GetUserCurrentQuestNumber();
        Task<bool> SaveUserImageUrl(string ImageRelativePath);
        Task<bool> BanUser(int ID);
        Task<bool> CanPurchaseQuest(int QuestNumber , int LastQuestNumber);
        Task<int> GetCurrentUserQuestNumber();
        Task<int> SetQuest(int QuestNumber , bool Purchased);
    }
}
