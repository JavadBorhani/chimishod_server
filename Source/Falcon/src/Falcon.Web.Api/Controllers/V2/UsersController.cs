using Falcon.Common;
using Falcon.Web.Api.MaintenanceProcessing.Public;
using Falcon.Web.Api.Utilities.Base;
using Falcon.Web.Common;
using Falcon.Web.Models.Api;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Description;

namespace Falcon.Web.Api.Controllers.V2
{
    [UnitOfWorkActionFilter]
    public class UsersController : FalconApiController
    {

        private readonly IUsersMaintenanceProcessor mUsersMaintenance;
        private readonly IDateTime mDateTime;

        public UsersController(IUsersMaintenanceProcessor UserMaintenanceProcessor , IDateTime DateTime)
        {
            mUsersMaintenance = UserMaintenanceProcessor;
            mDateTime = DateTime;
        }

        [ResponseType(typeof(SUser))]
        [Route("User")]
        public async Task<SUser> CreateUser()
        {
            var user = await mUsersMaintenance.CreateNewUser();
            return user;
        }



    }
}
