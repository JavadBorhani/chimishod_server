using Falcon.Common;
using Falcon.Web.Api.InquiryProcessing.Public;
using Falcon.Web.Api.MaintenanceProcessing.Public;
using Falcon.Web.Api.Utilities.Base;
using Falcon.Web.Common;
using Falcon.Web.Models;
using Falcon.Web.Models.Api;
using Falcon.Web.Models.Api.Friend;
using Falcon.Web.Models.Api.Notification;
using Falcon.Web.Models.Api.User;
using System.Net;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Description;

namespace Falcon.Web.Api.Controllers.V2
{
    [UnitOfWorkActionFilter]
    public class UsersController : FalconApiController
    {

        private readonly IUsersMaintenanceProcessor mUsersMaintenance;
        private readonly IUsersInquiryProcessor mUsersInquiry;
        private readonly IDateTime mDateTime;
        private readonly IPagedDataRequestFactory mPageDataRequestFactory;
        private readonly SApplicationState mServerAppState;

        public UsersController(
            IUsersMaintenanceProcessor UserMaintenanceProcessor , 
            IDateTime DateTime , 
            IUsersInquiryProcessor UsersInquiry, 
            IPagedDataRequestFactory PageDataRequestFactory , 
            IGlobalApplicationState ServerState)
        {
            mUsersMaintenance = UserMaintenanceProcessor;
            mDateTime = DateTime;
            mUsersInquiry = UsersInquiry;
            mPageDataRequestFactory = PageDataRequestFactory;
            mServerAppState = ServerState.GetState();
        }

        [ResponseType(typeof(string))]
        [Route("v2/User")] //// should ignore authentication
        [HttpPost]
        public async Task<IHttpActionResult> SignInUser([FromBody] SUserRegistrationForm Info)
        {
            if(!ModelState.IsValid)
            {
                return BadRequest();
            }

            var userUUID = await mUsersMaintenance.CreateNewUser(Info);
            return Ok(userUUID);
        }



        [ResponseType(typeof(string))]
        [Route("v2/User/Recover/")] // should ignore authentication
        [HttpPost]
        public async Task<IHttpActionResult> RecoverUser([FromBody] SUserInfo UserInfo)
        {
            UserInfo.Email = "one@one.com";

            if(!ModelState.IsValid)
                return Response(HttpStatusCode.Unauthorized);


            var result = await mUsersMaintenance.RecoverUser(UserInfo);

            if (string.IsNullOrEmpty(result))
                return Response(HttpStatusCode.Unauthorized);
            else
                return Ok(result);
        }

        [ResponseType(typeof(PagedDataInquiryResponse<SFriend>))]
        [Route("v2/Users/Search")]
        [HttpPost]
        public async Task<PagedDataInquiryResponse<SFriend>> SearchUsers(SInputSearchExpression InputSearchExpression)
        {
            if (!ModelState.IsValid)
                return null;

            var page = mPageDataRequestFactory.Create(InputSearchExpression.PageNumber, mServerAppState.Paging_DefaultPageSize);
            var friends = await mUsersInquiry.SearchUsersByExpression(page, InputSearchExpression.Expression);

            return friends;
        }


        [ResponseType(typeof(bool))]
        [Route("v2/Users/NotifyID")]
        [HttpPost]
        public async Task<IHttpActionResult> UpdateNotificationID(SNotificationID NotificationID)
        {
            if (!ModelState.IsValid)
                return BadRequest();

            var response = await mUsersMaintenance.UpdateNotificationID(NotificationID);
            return Ok(response);
        }

    }
}
