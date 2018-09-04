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
using UserDictionary = System.Collections.Concurrent.ConcurrentDictionary<int, Falcon.Web.Api.MaintenanceProcessing.Public.SUserDetail>;

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
        private readonly UserDictionary mUserInMemory;
        private readonly IUserQueryProcessor mUserQueryProcessor;


        public FriendsInquiryProcessor(
            IFriendsQueryProcessor FriendQuery,
            IQuestionsQueryProcessor QuestionsQuery,
            IMapper Mapper,
            IAnswerQueryProcessor AnswerQuery,
            IGlobalApplicationState AppState,
            IUserSession UserSession,
            IUsersInMemory UserInMemory,
            IUserQueryProcessor UserQueryProcessor)
        {
            mAnswerQuery = AnswerQuery;
            mFriendQuery = FriendQuery;
            mQuestionQuery = QuestionsQuery;
            mMapper = Mapper;
            mServerAppState = AppState.GetState();
            mUserSession = UserSession;
            mUserInMemory = UserInMemory.GetState();
            mUserQueryProcessor = UserQueryProcessor;
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
            var questionType = await mQuestionQuery.GetQuestionType(FriendAnswerInquiry.QuestionID);
            if(questionType != null)
            {
                var isQuestQuestion = (questionType == HashTagID.Quest);

                var friendResponses = await mAnswerQuery.GetAnswerOfUsers(
                    FriendAnswerInquiry.QuestionID, 
                    FriendAnswerInquiry.FriendIDs, 
                    mServerAppState.Friend_FriendResponsesAmount, 
                    isQuestQuestion);

                return friendResponses;
            }
            return null;
        }

        public async Task<SFriendStatus> GetFriendListFromDateUpToNow(DateTime FriendRequestDate, DateTime FriendResponseDate)
        {
            var olderDate = (FriendRequestDate > FriendResponseDate) ? FriendResponseDate : FriendRequestDate;

            var friendList = await mFriendQuery.GetAllFriendFromDateUpToNow(olderDate);

            if (friendList == null || friendList.Length <= 0 )
                return null;

            var friendRequest = new List<SFriendRequest>();
            var friendResponse = new List<SFriendResponse>();

            for (int i = 0; i < friendList.Length; ++i)
            {

                if (friendList[i].Status == RelationStatus.Pending && !friendList[i].RelationOperatorIsMe && friendList[i].UpdatedDate >= FriendRequestDate)
                {
                    friendRequest.Add(new SFriendRequest
                    {
                        PictureURL = friendList[i].UserPictureUrl,
                        RelationState = friendList[i].Status,
                        UserID = friendList[i].UserID,
                        Username = friendList[i].UserName,
                        GenderIsMale = friendList[i].GenderIsMale
                    });
                }
                else if (friendList[i].UpdatedDate >= FriendResponseDate)
                {
                    friendResponse.Add(new SFriendResponse
                    {
                        UserID = friendList[i].UserID,
                        RelationStatus = friendList[i].Status,
                    });
                }

            }

            var response = new SFriendStatus
            {
                FriendRequst = friendRequest,
                FriendResponse = friendResponse,
            };

            return response;
        }

        public List<SUserNameAndImagePath> GetFriendUserNameAndImageFromCache(SFriendCharacterDetailInquiry FriendList)
        {

            int friendLength = FriendList.UserIDs.Length;
            var items = new List<SUserNameAndImagePath>(friendLength);

            for (int i = 0; i < friendLength; ++i)
            {
                SUserDetail detail;

                mUserInMemory.TryGetValue(FriendList.UserIDs[i], out detail);
                if (detail != null)
                {
                    items.Add(new SUserNameAndImagePath
                    {
                        UserID = FriendList.UserIDs[i],
                        ImagePath = detail.ImagePath,
                        UserName = detail.UserName,
                    });
                }
            }

            return items;
        }

        public async Task<SFriend> GetFriend(int FriendID)
        {
           
            var user = await mUserQueryProcessor.LoadUser(FriendID);

            if(user != null)
            {
                SFriend result = new SFriend();

                //TODO : Refactor this to use auto mapper 
                result.UserID = user.ID;
                result.UserName = user.UserName;
                result.UserPictureUrl = user.AvatarImagePath;
                result.GenderIsMale = user.IsMale;
                result.RelationOperatorIsMe = false;
                result.Status = RelationStatus.None;

                var relation = await mFriendQuery.GetFriendRelationshipAsNoTracking(FriendID);

                if(relation != null)
                {  
                    result.RelationOperatorIsMe = (relation.OperatedByID == mUserSession.ID ? true : false);
                    result.Status = (RelationStatus)relation.RelationStatus;
                    result.UpdatedDate = relation.UpdatedDate;
                }

                return result;
            }

            return null;
            
        }
    }
}