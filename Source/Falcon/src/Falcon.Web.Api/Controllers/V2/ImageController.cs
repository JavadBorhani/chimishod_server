using Falcon.Web.Api.Utilities.Base;
using System;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Description;

namespace Falcon.Web.Api.Controllers.V2
{
    public class ImageController : FalconApiController
    {
        
        public ImageController()
        {

        }

        [ResponseType(typeof(IHttpActionResult))]
        [Route("v2/Upload/")]
        [HttpPost]
        public async Task<IHttpActionResult> UplaodProfilePicture()
        {
            throw new NotImplementedException();
        }
    }
}
