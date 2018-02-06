﻿using AutoMapper;
using Falcon.Data;
using Falcon.Data.QueryProcessors;
using Falcon.Web.Api.InquiryProcessing.Public;
using Falcon.Web.Models;
using Falcon.Web.Models.Api.Friend;
using System.Linq;
using System.Threading.Tasks;
using PagedQuesttionWithAnswerInquiryResponse = Falcon.Web.Models.PagedDataInquiryResponse<Falcon.Web.Models.Api.Friend.SPublicQuestionWithAnswerState>;

namespace Falcon.Web.Api.InquiryProcessing.Private
{
    public class FriendsInquiryProcessor : IFriendsInquiryProcessor
    {
        private readonly IFriendsQueryProcessor mFriendQuery;
        private readonly IQuestionsQueryProcessor mQuestionQuery;
        private readonly IMapper mMapper;
        public FriendsInquiryProcessor(IFriendsQueryProcessor FriendQuery , IQuestionsQueryProcessor QuestionsQuery , IMapper Mapper)
        {
            mFriendQuery = FriendQuery;
            mQuestionQuery = QuestionsQuery;
            mMapper = Mapper;
        }

        public async Task<int[]> GetAllFriendIds()
        {
            var friendIds = await mFriendQuery.GetAllFriendIds();
            return friendIds;   
        }

        public async Task<SFriend[]> GetAllFriendList()
        {
            var friends = await mFriendQuery.GetAllFriendList();
            return friends;
        }

        public async Task<PagedDataInquiryResponse<SPublicQuestionWithAnswerState>> GetFriendPublicQuestions(PagedDataRequest RequestInfo, int FriendID)
        {

            var queryResult = await mQuestionQuery.GetUserPublicQuestions(RequestInfo , FriendID);

            var items = queryResult.QueriedItems.ToList();

            var inquiryResponse = new PagedQuesttionWithAnswerInquiryResponse
            {
                Items = items,
                PageCount = queryResult.TotalPageCount,
                PageNumber = RequestInfo.PageNumber,
                PageSize = RequestInfo.PageSize
            };

            return inquiryResponse;
        }

        public async Task<bool> HasFriends(int[] FriendIds)
        {
            var exists = await mFriendQuery.HasFriends(FriendIds);
            return exists;
        }

    }
}