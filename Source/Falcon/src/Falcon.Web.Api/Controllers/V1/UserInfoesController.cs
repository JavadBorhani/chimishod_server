using System.Data;
using System.Data.Entity;
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
using System.Net.Mail;
using System.Text.RegularExpressions;

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
        public async Task<IHttpActionResult> GoogleSignIn([FromBody] SGoogleAuthentication GoogleAuthentication) //TODO : Move to User Authenticator
        {
            if(ModelState.IsValid)
            {
                return Response(HttpStatusCode.OK);
            }
            else
            {
                return Response(HttpStatusCode.BadRequest);
            }
        }

        [ResponseType(typeof(SUserInfo))]
        [Route("UserInfos/{UUID}")]
        [HttpPost]
        public async Task<IHttpActionResult> GoogleRecovery([FromBody] SGoogleAuthentication GoogleAuthentication)
        {
            if (ModelState.IsValid)
            {
                return Response(HttpStatusCode.OK);
            }
            else
            {
                return Response(HttpStatusCode.BadRequest);
            }
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
                    .Include(ui => ui.User)
                    .Select(ui => new SUserInfo
                    {
                        Email = ui.Email,
                        UserName = ui.User.UserName,
                        IsEditable = ui.IsEditable > 0 ? true : false,
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
        public async Task<IHttpActionResult> EditUserInfo(string UUID, [FromBody] SUserInfo UserInfo)
        {
            if (ModelState.IsValid)
            {
                var userID = await db.Users.AsNoTracking().Where(u => u.UUID == UUID).Select(u => u.ID).SingleOrDefaultAsync();

                if (userID != 0)
                {
                    var userInfo = await db.UserInfoes.Where(u => u.UserID == userID).Include(u => u.User).SingleOrDefaultAsync();
                    if (userInfo.IsEditable > 0 && !string.IsNullOrEmpty(UserInfo.Email))
                    {
                        //TODO : Validate User information

                        --userInfo.IsEditable;
                        userInfo.Email = UserInfo.Email;
                        userInfo.User.UserName = UserInfo.UserName;
                        UserInfo.Password = UserInfo.Password;
                        await db.SaveChangesAsync();

                        return Ok(Constants.UserInfoStatusType.EditSucceed);
                    }
                    else
                    {
                        return Response(HttpStatusCode.OK , Constants.UserInfoStatusType.Error);
                    }
                }
                else
                {
                    return Response(HttpStatusCode.Unauthorized);
                }
            }
            else
            {
                return Response(HttpStatusCode.BadRequest);
            }
        }

        [Route("UserInfos")]
        [HttpPost]
        public async Task<IHttpActionResult> RecoverUser([FromBody] SUserInfo UserInfo)
        {

            if (ModelState.IsValid)
            {
                var UUID = await db.UserInfoes.AsNoTracking()
                    .Where(u => u.User.UserName == UserInfo.UserName && u.Password == UserInfo.Password)
                    .Select(u => u.User.UUID)
                    .SingleOrDefaultAsync();

                if (!string.IsNullOrEmpty(UUID))
                {
                    return Ok(UUID);
                }
                else
                {
                    return Response(HttpStatusCode.Unauthorized);
                }
            }
            else
            {
                return Response(HttpStatusCode.BadRequest);
            }

        }

        [Route("UserInfos/{Email}")]
        [HttpPost]
        public async Task<IHttpActionResult> ForgotPassword(string Email)
        {
            if (IsValidMail(Email))
            {
                var userInfo = await db.UserInfoes.Where(u => u.Email == Email).Select(u => new { u.User.UserName, u.Password }).SingleOrDefaultAsync();
                if (userInfo != null)
                {
                    SendVerificationEmailViaWebApi(Email, userInfo.UserName, userInfo.Password);
                    return Ok(true);
                }
                else
                {
                    return Response(HttpStatusCode.OK, false);
                }
            }
            else
            {
                return Response(HttpStatusCode.Unauthorized , false);
            }
        }

        private void SendVerificationEmailViaWebApi(string EmailToSend, string UserName, string Password)
        {
            string subject = "Verification Mail";
            string body = string.Format("Flapp Studio - What if Game \n This is password Recovery \n UserName : '{0}' \n Password : '{1}'", UserName, Password);
            string FromMail = Constants.DefaultHostConfig.WebSiteNoReplyMail;
            string emailTo = EmailToSend;
            MailMessage mail = new MailMessage();
            SmtpClient SmtpServer = new SmtpClient(Constants.DefaultHostConfig.HostSmtpServer);
            mail.From = new MailAddress(FromMail);
            mail.To.Add(emailTo);
            mail.Subject = subject;
            mail.Body = body;
            SmtpServer.Port = 8383;
            SmtpServer.Credentials = new NetworkCredential(Constants.DefaultHostConfig.WebSiteNoReplyMail, Constants.DefaultHostConfig.WebSiteNoReplyMailPassword);
            SmtpServer.EnableSsl = false;
            SmtpServer.Send(mail);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool IsValidMail(string Mail)
        {
          return Regex.IsMatch(Mail, @"\A(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?)\Z", RegexOptions.IgnoreCase);
        }

        private async Task<bool> IsAbleToEditProfile(int userID)
        {
            return await db.UserInfoes.Where(ui => ui.UserID == userID).Select(ui => ui.IsEditable).SingleOrDefaultAsync() > 0; 
        }

        private bool UserInfoExists(int id)
        {
            return db.UserInfoes.Count(e => e.ID == id) > 0;
        }
        private ResponseMessageResult Response(HttpStatusCode Code)
        {
            return ResponseMessage(Request.CreateResponse(Code));
        }

        private ResponseMessageResult Response(HttpStatusCode Code, object DataToSend)
        {
            return ResponseMessage(Request.CreateResponse(Code, DataToSend));
        }
    }
}