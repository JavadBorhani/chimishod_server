using Falcon.Web.Api.Utilities.Base;
using Falcon.Web.Common;
using Falcon.Web.Models.Api;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Http;
using System.Web.Http.Description;

namespace Falcon.Web.Api.Controllers.V1
{
    [UnitOfWorkActionFilter]
    public class WatchAdController : FalconApiController
    {

        [HttpPost]
        [ResponseType(typeof(int))]
        public async Task<IHttpActionResult> ValidateWatchAd( [FromBody]  SWatchAdValidation WatchAdValidation)
        {
            if(!ModelState.IsValid)
            {
                return NotFound();
            }

            return null;   
        }

    }
}