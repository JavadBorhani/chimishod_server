using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Description;
using Falcon.EFCommonContext.DbModel;
using Falcon.Common;
using System.Web.Http.Results;
using Falcon.Web.Models.Api;

namespace Falcon.Web.Api.Controllers.V1
{
    public class UserInfoesController : ApiController
    {
        private DbEntity db = new DbEntity();


        private readonly IDateTime mDateTime;

        public UserInfoesController(IDateTime DateTime)
        {
            mDateTime = DateTime;
        }

        [ResponseType(typeof(SUserInfo))]
        [Route("UserInfos/{UUID}")]
        [HttpPost]
        public async Task<IHttpActionResult> GetUserInfo(string UUID)
        {
            var userID = await db.Users.AsNoTracking().Where(u => u.UUID == UUID).Select(u => u.ID).SingleOrDefaultAsync();

            if (userID != 0)
            {
                SUserInfo userInfo = await db.UserInfoes.AsNoTracking()
                    .Where(ui => ui.UserID == userID)
                    .Include( ui => ui.User)
                    .Select( ui => new SUserInfo
                    {
                        Email       =  ui.Email,
                        UserName    =  ui.User.UserName,
                        IsEditable  =  ui.IsEditable > 0 ? true : false,
                    })
                    .SingleOrDefaultAsync();

                return Ok(userInfo);
            }
            else
            {
                return Response(HttpStatusCode.Unauthorized);
            }
        }

        [Route("UserInfos/{UUID}")]
        [HttpPost]
        public async Task<IHttpActionResult> EditUserInfo(string UUID , [FromBody] SUserInfo UserInfo)
        {
            var userID = await db.Users.AsNoTracking().Where(u => u.UUID == UUID).Select(u => u.ID).SingleOrDefaultAsync();

            if (userID != 0)
            {

            }
            else
            {
                Response(HttpStatusCode.Unauthorized);
            }
        }

        [Route("UserInfos/{UUID}"]
        [HttpPost]
        public async Task<IHttpActionResult> RecoverUser(string UUID)
        {
            var userID = await db.Users.AsNoTracking().Where(u => u.UUID == UUID).Select(u => u.ID).SingleOrDefaultAsync();

            if (userID != 0)
            {

            }
            else
            {
                Response(HttpStatusCode.Unauthorized);
            }
        }

        [Route("UserInfos/{UUID}"]
        [HttpPost]
        public async Task<IHttpActionResult> ForgotPassword(string UUID)
        {
            var userID = await db.Users.AsNoTracking().Where(u => u.UUID == UUID).Select(u => u.ID).SingleOrDefaultAsync();

            if (userID != 0)
            {

            }
            else
            {
                Response(HttpStatusCode.Unauthorized);
            }
        }


        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool UserInfoExists(int id)
        {
            return db.UserInfoes.Count(e => e.ID == id) > 0;
        }
        private ResponseMessageResult Response(HttpStatusCode Code)
        {
            return ResponseMessage(Request.CreateResponse(Code));
        }
    }
}