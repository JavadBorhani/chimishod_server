using Falcon.Common;
using Falcon.Common.Security;
using Falcon.Web.Api.MaintenanceProcessing.Public;
using Falcon.Web.Api.Utilities.Base;
using Falcon.Web.Common;
using Falcon.Web.Models.Api;
using Falcon.Web.Models.Api.User;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Description;

namespace Falcon.Web.Api.Controllers.V2
{
    [UnitOfWorkActionFilter]
    public class UsersController : FalconApiController
    {

        private readonly IWebUserSession mUserSession;
        private readonly IUsersMaintenanceProcessor mUsersMaintenance;
        private readonly IDateTime mDateTime;

        public UsersController(IUsersMaintenanceProcessor UserMaintenanceProcessor , IWebUserSession User, IDateTime DateTime)
        {
            mUsersMaintenance = UserMaintenanceProcessor;
            mDateTime = DateTime;
            mUserSession = User;
        }

        [ResponseType(typeof(SUser))]
        [Route("User")]
        public async Task<SUser> CreateUser([FromBody] SUserRegistrationForm Info)
        {
            var user = await mUsersMaintenance.CreateNewUser(Info);
            return user;
        }

        [ResponseType(typeof(SUser))]
        [Route("User")]
        public async Task<SUser> LoginUser(string Data)
        {
            return null; 
        }

    }
}
