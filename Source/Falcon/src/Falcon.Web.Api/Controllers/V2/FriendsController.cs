using Falcon.Common;
using Falcon.Web.Api.InquiryProcessing.Public;
using Falcon.Web.Api.MaintenanceProcessing.Public;
using Falcon.Web.Api.Utilities.Base;
using Falcon.Web.Common;
using Falcon.Web.Models;
using Falcon.Web.Models.Api;
using Falcon.Web.Models.Api.Answer;
using Falcon.Web.Models.Api.Friend;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Description;

namespace Falcon.Web.Api.Controllers.V2
{
    [UnitOfWorkActionFilter]
    public class FriendsController : FalconApiController
    {
        private readonly IFriendsMaintenanceProcessor mFriendsMaintenance;
        private readonly IFriendsInquiryProcessor mFriendsInquiry;
        private readonly IPagedDataRequestFactory mPageDataRequestFactory;
        private readonly SApplicationState mServerAppState;
        private readonly IDateTime mDateTime;

        public FriendsController(
            IFriendsMaintenanceProcessor FriendsMaintenance , 
            IFriendsInquiryProcessor FriendsInquiry , 
            IPagedDataRequestFactory PageDataRequestFactory , 
            IGlobalApplicationState AppState,
            IDateTime DateTime)
        {
            mFriendsMaintenance = FriendsMaintenance;
            mFriendsInquiry = FriendsInquiry;
            mPageDataRequestFactory = PageDataRequestFactory;
            mServerAppState = AppState.GetState();
            mDateTime = DateTime;
        }

        [ResponseType(typeof(DataWithServerTime<SFriend[]>))]
        [Route("v2/Friends/")]
        [HttpPost]
        public async Task<DataWithServerTime<SFriend[]>> GetFriendList()
        {
            var friends = await mFriendsInquiry.GetAllFriendList();

            var data = new DataWithServerTime<SFriend[]>()
            {
                Data = friends,
                ServerTime = mDateTime.Now,
            };
            return data;
        }


        [ResponseType(typeof(DataWithServerTime<SFriend>))]
        [Route("v2/Friends/Create/{FriendID}")]
        [HttpPost]
        public async Task<DataWithServerTime<SFriend>> AddFriend(int FriendID)
        {
            var friends = await mFriendsMaintenance.CreateRelation(FriendID);

            var data = new DataWithServerTime<SFriend>()
            {
                Data = friends,
                ServerTime = mDateTime.Now,
            };
            return data;
        }


        [ResponseType(typeof(DataWithServerTime<SFriend>))]
        [Route("v2/Friends/Update/{FriendID}/{Relation}")]
        [HttpPost]
        public async Task<DataWithServerTime<SFriend>> UpdateFriend(int FriendID , RelationStatus Relation)
        {
            if (Relation == RelationStatus.None)
                return null;

            var friends = await mFriendsMaintenance.UpdateRelation(FriendID , Relation);


            var data = new DataWithServerTime<SFriend>()
            {
                Data = friends,
                ServerTime = mDateTime.Now,
            };
            return data;
        }


        [ResponseType(typeof(SFriend))]
        [Route("v2/Friends/Mutual/{FriendID}/{PageNumber}")]
        [HttpPost]
        public async Task<PagedDataInquiryResponse<SQuestionWithAnswerState>> GetMutualQuestions(int FriendID, int PageNumber)
        {
            var page = mPageDataRequestFactory.Create(PageNumber, mServerAppState.Paging_DefaultPageSize);
            var questions = await mFriendsInquiry.GetFriendMutualQuestions(page, FriendID);
            return questions;            
        }


        [ResponseType(typeof(SFriend))]
        [Route("v2/Friends/Public/{FriendID}/{PageNumber}")]
        [HttpPost]
        public async Task<PagedDataInquiryResponse<SQuestionWithAnswerState>> GetFriendPublicQuestions(int FriendID, int PageNumber)
        {

            var page = mPageDataRequestFactory.Create(PageNumber, mServerAppState.Paging_DefaultPageSize);
            var questions = await mFriendsInquiry.GetFriendPublicQuestions(page, FriendID);

            return questions;
        }

        [ResponseType(typeof(SFriend))]
        [Route("v2/Friends/Answer/")]
        [HttpPost]

        public async Task<SFriendAnswer[]> GetFriendAnswers(SFriendAnswerInquiry FriendAnswerInquiry)
        {
            if (!ModelState.IsValid)
                return null;

            var responses = await mFriendsInquiry.GetFriendAnswers(FriendAnswerInquiry);

            return responses;
        }

        //[Route("Comments/{QuestionID}/{PageNumber}")]s
        //[HttpPost]
        //public async Task<PagedDataInquiryResponse<SComment>> GettingComments( int QuestionID , int PageNumber)
        //{
        //    var page = mPagedDataRequestFactory.Create(PageNumber , mAppState.GetState().Paging_DefaultPageSize);
        //    var comments = await mCommentInquiryProcessor.GetComments(page , QuestionID);
        //    return comments;
        //}


    }
}
