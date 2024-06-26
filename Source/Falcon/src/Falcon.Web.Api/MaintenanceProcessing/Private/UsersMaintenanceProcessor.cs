﻿using Falcon.Common;
using Falcon.Common.Security;
using Falcon.Data.QueryProcessors;
using Falcon.Web.Api.InMemory.Public;
using Falcon.Web.Api.InquiryProcessing.Public;
using Falcon.Web.Api.MaintenanceProcessing.Public;
using Falcon.Web.Api.Utilities;
using Falcon.Web.Common.Memmory;
using Falcon.Web.Models.Api;
using Falcon.Web.Models.Api.Level;
using Falcon.Web.Models.Api.Notification;
using Falcon.Web.Models.Api.Quest;
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
        private readonly IQuestAndLevelInMemory mQuestAndLevelInMemory;
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
            IQuestAndLevelInMemory QuestInMemory , 
            IUserSession UserSession , 
            IQuestionsQueryProcessor QuestionQuery)
        {
            mUserQuery = UserQueryProcessor;
            mUserInfoQuery = UserInfoQuery;
            mNetworkUtils = NetworkUtils;
            mUUID = Generator;
            mGameConfig = GameConfig;
            mMemory = Memory;
            mUserInMemory = UserInMemory;
            mQuestAndLevelInMemory = QuestInMemory;
            mUserSession = UserSession;
            mQuestionQuery = QuestionQuery; 
        }

        public async Task<int> LevelUp(int Prize , int WatchedAdMultiplier)
        {
            var totalCoin = Constants.DefaultValues.NoNewCoin;

            if (Prize == 0)
                return totalCoin;


            SLevelUpInfo info;
            do
            {
                info = await mUserQuery.UpdateLevel(Prize , mQuestAndLevelInMemory.GetLastLevel());

                if (info.LevelUpMode != LevelUpMode.NotLeveledUp)
                {
                    var levelPrize = mQuestAndLevelInMemory.GetLevelPrize(info.LevelUpNumber);

                    if (levelPrize >= 0)
                    {
                        totalCoin = await mUserQuery.IncreaseCoin(levelPrize  * WatchedAdMultiplier);
                    }
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


            var deactiveUsers = await DeactivePreviousUser(RegistrationForm);


            RegistrationForm.IPAddress = mNetworkUtils.GetRequestNetworkIP();
            RegistrationForm.UUID = mUUID.GetNewUUID();

            var user = await mUserQuery.CreateNewUser(RegistrationForm , mGameConfig.GetState());
            var created = await mUserInfoQuery.CreateEmptyUserInfo(user.ID);

            if (created)
            {
                mUserInMemory.AddItem(user.ID, new SUserDetail()
                {
                    ID = user.ID,
                    UserName = RegistrationForm.UserName ,
                    NotificationID = RegistrationForm.NotificationID ,
                    UUID =  RegistrationForm.UUID
                });

                return RegistrationForm.UUID;
            }

            throw new BusinessRuleViolationException("User Creation Process Shouldn't be here");
                
        }

        private async Task<bool> DeactivePreviousUser(SUserRegistrationForm RegistrationForm)
        {
            if (string.IsNullOrWhiteSpace(RegistrationForm.NotificationID))
                return false;

            var userInfoIsDuplicate = await mUserQuery.DeactivePreviousUser(RegistrationForm);

            if (userInfoIsDuplicate != null)
            {
                for (int i = 0; i < userInfoIsDuplicate.Count; ++i)
                {
                    mUserInMemory.RemoveUser(userInfoIsDuplicate[i]);
                }
                return true;
            }

            return false;   
        }

        private async Task<bool> DeactivePreviousUser(string NotificationID)
        {
            if (string.IsNullOrWhiteSpace(NotificationID))
                return false;
            var userInfoIsDuplicate = await mUserQuery.DeactivePreviousUser(NotificationID);

            if (userInfoIsDuplicate != null)
            {
                for (int i = 0; i < userInfoIsDuplicate.Count; ++i)
                {
                    mUserInMemory.RemoveUser(userInfoIsDuplicate[i]);
                }
                return true;
            }

            return false;
        }

        public async Task<bool> SaveImageUrl(string ImageRelativePath)
        {
            var response = await mUserQuery.SaveUserImageUrl(ImageRelativePath);

            return response;
        }

        public async Task<bool> UpdateNotificationID(SNotificationID Notification)
        {
            var notificationID = Notification.UUID.ToString();

            var deactivePreviousUsers = await DeactivePreviousUser(notificationID);

            var response = await mUserQuery.UpdateUserNotificationID(mUserSession.ID, notificationID);

            if (response)
                mUserInMemory.UpdateNotificationID(mUserSession.ID, notificationID);

            return response;
        }

        public async Task<bool> BanUserByQuestionID(int QuestionID)
        {
            var userID = await mQuestionQuery.GetQuestionCreatorByID(QuestionID);
            var userBanned = await mUserQuery.BanUser(userID);
            return userBanned;
        }

        public async Task<int> QuestUp(int Prize)
        {
            if (Prize == 0)
                return -1;

            SQuestUpInfo info;
            do
            {
                info = await mUserQuery.UpdateQuest(Prize, mQuestAndLevelInMemory.GetLastQuest());

            } while (info.QuestUpMode == QuestUpMode.QuestUppedAndNeedAnother);

            return -1; 
        }

        public async Task<string> RecoverUser(SUserInfo UserInfo)
        {
            var user = await mUserQuery.ReteriveUserByUserPass(UserInfo);

            if (user != null)
            {
                var result = await mUserQuery.UpdateUserLoginInfo(user.ID, UserInfo);

                if (result)
                {
                    var changed = mUserInMemory.UpdateNotificationID(user.ID, UserInfo.NotificationID.ToString());

                    if(!changed)
                    {
                        mUserInMemory.AddItem(user.ID, new SUserDetail
                        {
                            ID = user.ID,
                            ImagePath = user.AvatarImagePath,
                            NotificationID = user.NotificationID,
                            UserName = user.UserName,
                            UUID = user.UUID
                        });
                    }
                }

                return user.UUID;
            }
            else
            {
                return null;
            }
        }
    }
}