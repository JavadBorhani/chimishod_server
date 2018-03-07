using Falcon.Web.Api.InquiryProcessing.Public;
using Falcon.Web.Api.Utilities.Base;
using Falcon.Web.Common;
using System.Web.Http;

namespace Falcon.Web.Api.Controllers.V1
{
    [UnitOfWorkActionFilter]
    public class TestController : FalconApiController
    {
        private readonly IFriendsInquiryProcessor mFriendInquiry;
        public TestController(IFriendsInquiryProcessor FriendInquiry)
        {
            mFriendInquiry = FriendInquiry;
        }

        [Route("v2/TestController/")]
        [HttpGet]
        public  IHttpActionResult GetInfo()
        {

            var item = mFriendInquiry.GetFriendUserNameAndImageFromCache(new Models.Api.Friend.SFriendCharacterDetailInquiry
            {
                UserIDs = new int[] { 1201, 1202, 1203 , 1202 },
            });

            return Ok(item);
        }

    }
}