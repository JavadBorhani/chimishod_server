using Falcon.Web.Api.InquiryProcessing.Public;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Threading.Tasks;
using Falcon.Data.QueryProcessors;
using Falcon.Web.Models.Api.User;
using AutoMapper;

namespace Falcon.Web.Api.InquiryProcessing.Private
{
    public class UsersInquiryProcessor : IUsersInquiryProcessor
    {
        private readonly IUserQueryProcessor mUserQueryProcessor;
        private readonly IMapper mMapper;

        public UsersInquiryProcessor(IUserQueryProcessor UserQueryProcessor , IMapper Mapper)
        {
            mUserQueryProcessor = UserQueryProcessor;
            mMapper = Mapper;
        }
        public async Task<int> GetTotalCoin()
        {
            int totalCoin = await mUserQueryProcessor.GetTotalCoin();
            return totalCoin;
        }

        public async Task<SUserCount> GetUserCountInfo(int UserID)
        {
            var data = await mUserQueryProcessor.GetUserCountInfo(UserID);
            var result = mMapper.Map<SUserCount>(data);

            return data;    

        }

        public async Task<bool> LevelExist(int LevelNumber)
        {
            bool exists = await mUserQueryProcessor.LevelExits(LevelNumber);
            return exists;   
        }
    }
}