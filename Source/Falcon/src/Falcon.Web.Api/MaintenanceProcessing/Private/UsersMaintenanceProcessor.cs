using Falcon.Common;
using Falcon.Common.Security;
using Falcon.Data.QueryProcessors;
using Falcon.Web.Api.InquiryProcessing.Public;
using Falcon.Web.Api.MaintenanceProcessing.Public;
using Falcon.Web.Api.Utilities;
using Falcon.Web.Common.Memmory;
using Falcon.Web.Models.Api.Level;
using Falcon.Web.Models.Api.Notification;
using Falcon.Web.Models.Api.User;
using System.Threading.Tasks;

namespace Falcon.Web.Api.MaintenanceProcessing.Private
{
    public class UsersMaintenanceProcessor : IUsersMaintenanceProcessor
    {
        private readonly IUserQueryProcessor mUserQuery;
        private readonly IUserInfoQueryProcessor mUserInfoQuery;
        private readonly INetworkUtils mNetworkUtils;
        private readonly IUUIDGenerator mUUID;
        private readonly IGameConfig mGameConfig;
        private readonly IMemoryStore mMemory;
        private readonly IUsersInMemory mUserInMemory;
        private readonly IQuestInMemoryProcessor mQuestInMemory;
        private readonly IUserSession mUserSession;
        private readonly IQuestionsQueryProcessor mQuestionQuery;

        public UsersMaintenanceProcessor
            (
            IUserInfoQueryProcessor UserInfoQuery,
            IUserQueryProcessor UserQueryProcessor ,
            INetworkUtils NetworkUtils , 
            IUUIDGenerator Generator , 
            IGameConfig GameConfig , 
            IMemoryStore Memory , 
            IUsersInMemory UserInMemory , 
            IQuestInMemoryProcessor QuestInMemory , 
            IUserSession UserSession)
        {
            mUserQuery = UserQueryProcessor;
            mUserInfoQuery = UserInfoQuery;
            mNetworkUtils = NetworkUtils;
            mUUID = Generator;
            mGameConfig = GameConfig;
            mMemory = Memory;
            mUserInMemory = UserInMemory;
            mQuestInMemory = QuestInMemory;
            mUserSession = UserSession;
        }

        public async Task<int> LevelUp(int Prize)
        {
            var totalCoin = Constants.DefaultValues.NoNewCoin;

            if (Prize == 0)
                return totalCoin;


            SLevelUpInfo info;
            do
            {
                info = await mUserQuery.UpdateLevel(Prize , mQuestInMemory.GetLastLevel());

                if (info.LevelUpMode != LevelUpMode.NotLeveledUp)
                {
                    var levelPrize = await mUserQuery.GetLevelPrize(info.LevelUpNumber);

                    if (levelPrize >= 0)
                    {
                        totalCoin = await mUserQuery.IncreaseCoin(levelPrize);
                    }
                    //push the level

                    mMemory.SaveState(GlobalVariables.LevelToTakeSnapshot, info.LevelUpNumber - 1 );
                }

                Prize = 0; 

            } while (info.LevelUpMode == LevelUpMode.LeveledUpAndNeedAnother);

            return totalCoin;
        }        

        

        public async Task<string> CreateNewUser(SUserRegistrationForm RegistrationForm)
        {
            var exists = await mUserQuery.Exists(RegistrationForm.UserName);
            if (exists)
                return null;


            var userInfoIsDuplicate = await mUserQuery.DeactivePreviousUser(RegistrationForm);


            RegistrationForm.IPAddress = mNetworkUtils.GetRequestNetworkIP();
            RegistrationForm.UUID = mUUID.GetNewUUID();

            var user = await mUserQuery.CreateNewUser(RegistrationForm , mGameConfig.GetState());
            var created = await mUserInfoQuery.CreateEmptyUserInfo(user.ID);

            if (created)
            {
                mUserInMemory.AddItem(user.ID, new SUserDetail() { UserName = RegistrationForm.UserName });

                return RegistrationForm.UUID;
            }
            else
            {
                return null;
            }
                
        }

        public async Task<bool> SaveImageUrl(string ImageRelativePath)
        {
            var response = await mUserQuery.SaveUserImageUrl(ImageRelativePath);

            return response;
        }

        public async Task<bool> UpdateNotificationID(SNotificationID Notification)
        {
            var response = await mUserQuery.UpdateUserNotificationID(mUserSession.ID, Notification.UUID.ToString());
            return response;
        }

        public async Task<bool> BanUserByQuestionID(int QuestionID)
        {
            var question = await 
            var response = await mUserQuery.GetUserByID()
        }
    }
}