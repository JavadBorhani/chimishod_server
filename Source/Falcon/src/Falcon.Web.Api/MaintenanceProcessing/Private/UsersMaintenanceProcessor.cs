﻿using Falcon.Common;
using Falcon.Data.QueryProcessors;
using Falcon.Web.Api.MaintenanceProcessing.Public;
using Falcon.Web.Api.Utilities;
using Falcon.Web.Models.Api;
using Falcon.Web.Models.Api.Level;
using Falcon.Web.Models.Api.User;
using System;
using System.Threading.Tasks;

namespace Falcon.Web.Api.MaintenanceProcessing.Private
{
    public class UsersMaintenanceProcessor : IUsersMaintenanceProcessor
    {
        private readonly IUserQueryProcessor mUserQuery;
        private readonly IUserInfoQueryProcessor mUserInfoQuery;
        private readonly INetworkUtils mNetworkUtils;
        private readonly IUUIDGenerator mUUID;

        public UsersMaintenanceProcessor
            (
            IUserQueryProcessor UserQueryProcessor ,
            IUserInfoQueryProcessor UserInfoQuery , 
            INetworkUtils NetworkUtils , 
            IUUIDGenerator Generator)
        {
            mUserQuery = UserQueryProcessor;
            mUserInfoQuery = UserInfoQuery;
            mNetworkUtils = NetworkUtils;
            mUUID = Generator;
            
        }

        public async Task<int> LevelUp(int Prize)
        {
            var totalCoin = Constants.DefaultValues.NoNewCoin;

            SLevelUpInfo info;
            do
            {
                info = await mUserQuery.UpdateLevel(Prize);

                if (info.LevelUpMode != LevelUpMode.NotLeveledUp)
                {
                    var levelPrize = await mUserQuery.GetLevelPrize(info.LevelUpNumber);

                    if (levelPrize >= 0)
                    {
                        totalCoin = await mUserQuery.IncreaseCoin(levelPrize);
                    }
                }

                Prize = 0; 

            } while (info.LevelUpMode == LevelUpMode.LeveledUpAndNeedAnother);

            return totalCoin;
        }

        public async Task<SUser> LoadUser(int UserID)
        {
            throw new NotImplementedException();
        }

        

        public async Task<string> CreateNewUser(SUserRegistrationForm RegistrationForm)
        {
            RegistrationForm.IPAddress = mNetworkUtils.GetRequestNetworkIP();
            RegistrationForm.UUID = mUUID.GetNewUUID();

            var user = await mUserQuery.CreateNewUser(RegistrationForm);
            var created = await mUserInfoQuery.CreateEmptyUserInfo(user.ID);

            if (created)
            {
                return RegistrationForm.UUID;
            }
            else
            {
                return null;
            }
                
        }
    }
}