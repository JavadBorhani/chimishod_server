using AutoMapper;
using Falcon.Common.Security;
using Falcon.Data;
using Falcon.Data.QueryProcessors;
using Falcon.Web.Api.InquiryProcessing.Public;
using Falcon.Web.Api.MaintenanceProcessing.Public;
using Falcon.Web.Models;
using Falcon.Web.Models.Api;
using Falcon.Web.Models.Api.Answer;
using Falcon.Web.Models.Api.Friend;
using Falcon.Web.Models.Api.Notification.Client;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using PagedQuesttionWithAnswerInquiryResponse = Falcon.Web.Models.PagedDataInquiryResponse<Falcon.Web.Models.Api.Friend.SQuestionWithAnswerState>;

namespace Falcon.Web.Api.InquiryProcessing.Private
{
    public class FriendsInquiryProcessor : IFriendsInquiryProcessor
    {
        private readonly IFriendsQueryProcessor mFriendQuery;
        private readonly IQuestionsQueryProcessor mQuestionQuery;
        private readonly IAnswerQueryProcessor mAnswerQuery;
        private readonly IMapper mMapper;
        private readonly SApplicationState mServerAppState;
        private readonly IUserSession mUserSession;

        public FriendsInquiryProcessor(
            IFriendsQueryProcessor FriendQuery , 
            IQuestionsQueryProcessor QuestionsQuery , 
            IMapper Mapper , 
            IAnswerQueryProcessor AnswerQuery , 
            IGlobalApplicationState AppState,
            IUserSession UserSession)
        {
            mAnswerQuery = AnswerQuery;
            mFriendQuery = FriendQuery;
            mQuestionQuery = QuestionsQuery;
            mMapper = Mapper;
            mServerAppState = AppState.GetState();
            mUserSession = UserSession;
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

        public async Task<PagedDataInquiryResponse<SQuestionWithAnswerState>> GetFriendPublicQuestions(PagedDataRequest RequestInfo, int FriendID)
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

        public async Task<PagedQuesttionWithAnswerInquiryResponse> GetFriendMutualQuestions(PagedDataRequest RequestInfo, int FriendID)
        {
            var queryResult = await mQuestionQuery.GetUserMutualQuestions(RequestInfo, FriendID);

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

        public async Task<SFriendAnswer[]> GetFriendAnswers(SFriendAnswerInquiry FriendAnswerInquiry)
        {
            var friendResponses = await mAnswerQuery
                .GetAnswerOfUsers (FriendAnswerInquiry.QuestionID, FriendAnswerInquiry.FriendIDs ,  mServerAppState.Friend_FriendResponsesAmount);

            return friendResponses;
        }

        public async Task<SFriendStatus> GetFriendListFromDateUpToNow(DateTime FriendRequestDate, DateTime FriendResponseDate)
        {
            var olderDate = (FriendRequestDate > FriendResponseDate) ? FriendResponseDate : FriendRequestDate;

            var friendList = await mFriendQuery.GetAllFriendFromDateUpToNow(olderDate);

            var friendRequest = new List<SFriendRequest>();
            var friendResponse = new List<SFriendResponse>();

            for(int i = 0; i < friendList.Length;  ++i)
            {
                
                if(friendList[i].RelationOperatorIsMe == true)
                friendRequest.Add(new SFriendRequest
                {
                    
                });

                friendResponse.Add(new SFriendResponse
                {

                });
            }
        
            var response = new SFriendStatus
            {
                FriendRequst = friendRequest,
                FriendResponse = friendResponse,
            };

            return response;
        }
    }
}