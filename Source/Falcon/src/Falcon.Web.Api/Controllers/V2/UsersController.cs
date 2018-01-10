using Falcon.Common;
using Falcon.Web.Api.InquiryProcessing.Public;
using Falcon.Web.Api.MaintenanceProcessing.Public;
using Falcon.Web.Api.Utilities.Base;
using Falcon.Web.Common;
using Falcon.Web.Models.Api;
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

        public UsersController(IUsersMaintenanceProcessor UserMaintenanceProcessor , IDateTime DateTime , IUsersInquiryProcessor UsersInquiry)
        {
            mUsersMaintenance = UserMaintenanceProcessor;
            mDateTime = DateTime;
            mUsersInquiry = UsersInquiry;
        }

        [ResponseType(typeof(string))]
        [Route("v2/User")] //// should ignore authentication
        [HttpPost]
        public async Task<string> SignInUser([FromBody] SUserRegistrationForm Info)
        {
            if(!ModelState.IsValid)
            {
                return null;
            }

            var user = await mUsersMaintenance.CreateNewUser(Info);
            return user;
        }

        [ResponseType(typeof(SUserData))]
        [Route("v2/User/")]
        [HttpPost]
        public async Task<SUserData> LoadingUserData(int QuestVersion)
        {
            //actual user data info -> will return user current state in quest and quest information 
            return null;    
        }

        [ResponseType(typeof(string))]
        [Route("v2/User/Recover/")] // should ignore authentication
        [HttpPost]
        public async Task<IHttpActionResult> RecoverUser([FromBody] SUserInfo UserInfo)
        {
            UserInfo.Email = "one@one.com";

            if(!ModelState.IsValid)
                return Response(HttpStatusCode.Unauthorized);


            var result = await mUsersInquiry.RecoverUser(UserInfo);

            if (string.IsNullOrEmpty(result))
                return Response(HttpStatusCode.Unauthorized);
            else
                return Ok(result);
        }



    }
}
