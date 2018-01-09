using Falcon.EFCommonContext.DbModel;
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

        Task<SUserCount> CreateUser();
        Task<SUserCount> LoadUser();
       
        //Task<int> GetDWMCount();
        //Task<bool> UpdateLastSeenDateTime();
        //Task<bool> UpdateLastSeenDateTimeToNow();
        Task<SLevelUpInfo> UpdateLevel(int Prize);
        Task<bool> LevelExits(int LevelNumber);
        Task<int> GetLevelPrize(int LevelNumber);
        //Task<SUserCount> GetUserCountInfo(int UserID);

        //v2 Create User
        Task<User> CreateNewUser(SUserRegistrationForm UserRegisterationData);


    }
}
