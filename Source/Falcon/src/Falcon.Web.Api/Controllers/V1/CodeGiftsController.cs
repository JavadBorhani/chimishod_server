using Falcon.Common;
using Falcon.Common.Security;
using System.Web.Http;

namespace Falcon.Web.Api.Controllers.V1
{
    public class CodeGiftsController : ApiController
    {
        private readonly IDateTime mDateTime;
        private readonly IWebUserSession mUserSession;

        public CodeGiftsController(IDateTime DateTime , IWebUserSession UserSession)
        {
            
        }
    }
}
