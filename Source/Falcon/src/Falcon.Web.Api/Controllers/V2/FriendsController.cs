using Falcon.Web.Api.InquiryProcessing.Public;
using Falcon.Web.Api.MaintenanceProcessing.Public;
using Falcon.Web.Api.Utilities.Base;
using Falcon.Web.Common;
using Falcon.Web.Models.Api;
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

        public FriendsController(
            IFriendsMaintenanceProcessor FriendsMaintenance , 
            IFriendsInquiryProcessor FriendsInquiry , 
            IPagedDataRequestFactory PageDataRequestFactory , 
            IGlobalApplicationState AppState)
        {
            mFriendsMaintenance = FriendsMaintenance;
            mFriendsInquiry = FriendsInquiry;
            mPageDataRequestFactory = PageDataRequestFactory;
            mServerAppState = AppState.GetState();
        }

        [ResponseType(typeof(SFriend[]))]
        [Route("v2/Friends/")]
        [HttpPost]
        public async Task<SFriend[]> GetFriendList()
        {
            var friends = await mFriendsInquiry.GetAllFriendList();
            return friends;
        }


        [ResponseType(typeof(SFriend))]
        [Route("v2/Friends/")]
        [HttpPost]
        public async Task<SFriend> AddFriend(int FriendID)
        {
            var friends = await mFriendsMaintenance.CreateRelation(FriendID);
            return friends;
        }


        [ResponseType(typeof(SFriend))]
        [Route("v2/Friends/")]
        [HttpPost]
        public async Task<SFriend> UpdateFriend(int FriendID , RelationStatus Relation)
        {
            if (Relation == RelationStatus.None)
                return null;

            var friends = await mFriendsMaintenance.UpdateRelation(FriendID , Relation);
            return friends;
        }


        //[Route("Comments/{QuestionID}/{PageNumber}")]
        //[HttpPost]
        //public async Task<PagedDataInquiryResponse<SComment>> GettingComments( int QuestionID , int PageNumber)
        //{
        //    var page = mPagedDataRequestFactory.Create(PageNumber , mAppState.GetState().Paging_DefaultPageSize);
        //    var comments = await mCommentInquiryProcessor.GetComments(page , QuestionID);
        //    return comments;
        //}


    }
}
