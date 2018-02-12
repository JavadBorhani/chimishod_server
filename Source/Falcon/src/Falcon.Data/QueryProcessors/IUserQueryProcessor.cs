using Falcon.EFCommonContext.DbModel;
using Falcon.Web.Models.Api;
using Falcon.Web.Models.Api.Config;
using Falcon.Web.Models.Api.Level;
using Falcon.Web.Models.Api.User;
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
        Task<SLevelUpInfo> UpdateLevel(int Prize);
        Task<bool> LevelExits(int LevelNumber);
        Task<int> GetLevelPrize(int LevelNumber);
        //Task<SUserCount> GetUserCountInfo(int UserID);

        //v2 Create User
        Task<User> CreateNewUser(SUserRegistrationForm UserRegisterationData , SGameConfig GameConfig);

        Task<string> ReteriveUserUUID(SUserInfo userInfo);
        Task<bool> UpdateUserNotificationID(string UUID);
        Task<bool> Exists(string UserName);
        Task<QueryResult<User>> SearchUserNames(PagedDataRequest RequestInfo , string Expression , int[] Excepts =  null);
        Task<string> GetNotificationID(int friendID);
        Task<string[]> GetNotificationIDs(int[] friendID);
        Task<User> GetUserByID(int UserID);
        Task<bool> DeactivePreviousUser(SUserRegistrationForm registrationForm);
    }
}
