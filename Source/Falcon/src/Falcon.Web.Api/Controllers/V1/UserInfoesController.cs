// Flapp Copyright 2017-2018

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
using Falcon.Web.Models.Api;
using System.Text.RegularExpressions;
using Falcon.Web.Common;
using Falcon.EFCommonContext;
using Falcon.Web.Api.Utilities.Base;
using Falcon.Common.Security;
using Falcon.Web.Api.MaintenanceProcessing.Public;
using Falcon.Web.Api.JobSystem.Public;
using Falcon.Web.Api.Utilities.Mail;

namespace Falcon.Web.Api.Controllers.V1
{
    [UnitOfWorkActionFilter]
    public class UserInfoesController : FalconApiController
    {
        
        private readonly IDbContext mDb;
        private readonly IDateTime mDateTime;
        private readonly IWebUserSession mUserSession;
        private readonly IGlobalApplicationState mAppState;
        private readonly IMailManager mMailManager;
        private readonly IJobManager mJobManager;
       
        public UserInfoesController(IDateTime DateTime, 
            IDbContext Database , 
            IWebUserSession UserSession , 
            IGlobalApplicationState AppState , 
            IMailManager MailManager , 
            IJobManager JobManager)
        {
            mDateTime = DateTime;
            mDb = Database;
            mUserSession = UserSession;
            mAppState = AppState;
            mMailManager = MailManager;
            mJobManager = JobManager;
        }

        //[ResponseType(typeof(SUserInfo))]
        //[Route("UserInfo/GoogleSignIn/")]
        //[HttpPost]
        //public async Task<IHttpActionResult> GoogleSignIn([FromBody] SGoogleAuthentication GoogleAuthentication) //TODO : Move to User Authenticator
        //{
        //    if(ModelState.IsValid)
        //    {
        //        return Response(HttpStatusCode.OK);
        //    }
        //    else
        //    {
        //        return Response(HttpStatusCode.BadRequest);
        //    }
        //}

        //[ResponseType(typeof(SUserInfo))]
        //[Route("UserInfo/GoogleRecovery/")]
        //[HttpPost]
        //public async Task<IHttpActionResult> GoogleRecovery([FromBody] SGoogleAuthentication GoogleAuthentication)
        //{
        //    if (ModelState.IsValid)
        //    {
        //        return Response(HttpStatusCode.OK);
        //    }
        //    else
        //    {
        //        return Response(HttpStatusCode.BadRequest);
        //    }
        //}

        [ResponseType(typeof(SUserInfo))]
        [Route("UserInfoChange/")] //TODO : Refactor This 
        [HttpPost]
        public async Task<IHttpActionResult> GetUserInfo()
        {
            
            var info = await mDb.Set<UserInfo>().AsNoTracking()
                .Where(ui => ui.UserID == mUserSession.ID)
                .Include(ui => ui.User)
                .Select(ui => new 
                {
                    Email = ui.Email,
                    UserName = ui.User.UserName,
                    IsEditable = ui.IsEditable > 0 ? true : false,
                    ChangeInfoDate = ui.ChangeInfoDate,
                })
                .SingleOrDefaultAsync();

            SUserInfo result = new SUserInfo
            {
                UserName = info.UserName,
                Email = info.Email,
                HasRegistered = (info.ChangeInfoDate != null) ? true : false,
                IsEditable = info.IsEditable,
            };

            return Ok(result);
        }

        [Route("UserInfoChange/Edit/")] //TODO : Refactor This
        [HttpPost] 
        public async Task<IHttpActionResult> EditUserInfo([FromBody] SUserInfo UserInfo)
        {
            if (ModelState.IsValid)
            {
                string EditSucceed;
                var Info = await mDb.Set<UserInfo>().Where(u => u.UserID == mUserSession.ID).Include(u => u.User).SingleOrDefaultAsync();
                if (Info.IsEditable > 0 && !string.IsNullOrEmpty(UserInfo.Email))
                {
                    if(await UserNameIsAccessible(mUserSession.ID, UserInfo.UserName))
                    {
                        if(await EmailIsAccessible(Info.ID, UserInfo.Email))
                        {
                            --Info.IsEditable;
                            Info.Email = UserInfo.Email;
                            Info.User.UserName = UserInfo.UserName;
                            Info.Password = UserInfo.Password;
                            Info.ChangeInfoDate = mDateTime.Now;
                            await mDb.SaveChangesAsync();
                                
                            UserInfo.IsEditable = Info.IsEditable > 0 ? true : false;
                            UserInfo.Password = null;
                            UserInfo.HasRegistered = true;
                            //TODO, Refactor This
                            EditSucceed = Constants.UserInfoStatusType.EditSucceed;
                            return ResponseMessage(Request.CreateResponse(HttpStatusCode.OK, new { EditSucceed, UserInfo }));
                        }
                        else
                        {
                            EditSucceed = Constants.UserInfoStatusType.EmailConflict;
                            return Response(HttpStatusCode.OK, new { EditSucceed });
                        }
                    }
                    else
                    {
                        EditSucceed = Constants.UserInfoStatusType.UserNameConflict;
                        return Response(HttpStatusCode.OK, new { EditSucceed });
                    }
                }
                else
                {
                    EditSucceed = Constants.UserInfoStatusType.Error;
                    return Response(HttpStatusCode.OK , new { EditSucceed });
                }
            }
            else
            {
                return Response(HttpStatusCode.BadRequest);
            }
        }


        [Route("UserInfo/Recover/")]
        [HttpPost]
        public async Task<IHttpActionResult> RecoverUser([FromBody] SUserInfo UserInfo)
        {

            UserInfo.Email = "one@one.com";
            if (ModelState.IsValid)
            {
                var UUID = await mDb.Set<UserInfo>().AsNoTracking()
                    .Include(u => u.User)
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
        [ResponseType(typeof(bool))]
        [Route("UserInfo/Forgot/")]
        [HttpPost]
        public async Task<IHttpActionResult> ForgotPassword([FromBody] SGoogleAuthentication Info)
        {
            if(Info != null)
            {
                if (IsValidMail(Info.Email))
                {
                    var userInfo = await mDb.Set<UserInfo>().AsNoTracking()
                                                        .Where(u => u.Email == Info.Email)
                                                        .Select(u => new { u.User.UserName, u.Password })
                                                        .SingleOrDefaultAsync();
                    if (userInfo != null)
                    {
                       
                        mJobManager.Enqueue(() => 
                        mMailManager.SendRecoverySupportMail(Info.Email, "بازیابی پسورد", Info.Email, userInfo.UserName, userInfo.Password));                        

                        return Ok(true);
                    }
                    else
                    {
                        return Response(HttpStatusCode.OK, false);
                    }
                }
                else
                {
                    return Response(HttpStatusCode.Unauthorized, false);
                }
            }
            else
            {
                return Response(HttpStatusCode.BadRequest, false);
            }
            
        }

        private bool IsValidMail(string Mail)
        {
          return Regex.IsMatch(Mail, @"\A(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?)\Z", RegexOptions.IgnoreCase);
        }

        private async Task<bool> IsAbleToEditProfile(int userID)
        {
            return await mDb.Set<UserInfo>().Where(ui => ui.UserID == userID).Select(ui => ui.IsEditable).SingleOrDefaultAsync() > 0; 
        }


        private async Task<bool> UserNameIsAccessible(int UserID, string UserName)
        {
            //TODO : Move Email and password to User Table
            return await mDb.Set<User>().AsNoTracking().CountAsync(u => u.ID != UserID && u.UserName == UserName) == 0;
        }
        private async Task<bool> EmailIsAccessible(int UserInfoID, string Email)
        {
            //TODO : Move Email and password to User Table
            return await mDb.Set<UserInfo>().AsNoTracking().CountAsync(u => u.ID != UserInfoID && u.Email == Email) == 0;
        }
    }
}