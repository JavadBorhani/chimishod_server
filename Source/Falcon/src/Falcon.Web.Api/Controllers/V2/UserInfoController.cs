using Falcon.Common;
using Falcon.Common.Security;
using Falcon.EFCommonContext;
using Falcon.EFCommonContext.DbModel;
using Falcon.Web.Api.InquiryProcessing.Public;
using Falcon.Web.Api.MaintenanceProcessing.Public;
using Falcon.Web.Api.Utilities.Base;
using Falcon.Web.Common;
using Falcon.Web.Models.Api;
using Falcon.Web.Models.Api.User;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Description;

namespace Falcon.Web.Api.Controllers.V2
{
    [UnitOfWorkActionFilter]
    public class UserInfoController : FalconApiController
    {
        private readonly IUserInfoMaintenanceProcessor mUserInfoMaintenance;
        private readonly IUserInfoInquiryProcessor mUserInfoInquiry;
        private readonly IDateTime mDateTime;
        private readonly IWebUserSession mUserSession;
        private readonly IGlobalApplicationState mAppState;
        private readonly IDbContext mDb;
        private readonly IUsersInMemory mUsersInMemory;

        public UserInfoController(IUserInfoMaintenanceProcessor UserInfoMaintenance, IUserInfoInquiryProcessor UserInfoInquiry, IDateTime DateTime,
            IDbContext Database,
            IWebUserSession UserSession,
            IGlobalApplicationState AppState , 
            IUsersInMemory UsersInMemory)
        {
            mUserInfoMaintenance = UserInfoMaintenance;
            mUserInfoInquiry = UserInfoInquiry;
            mDateTime = DateTime;
            mDb = Database;
            mUserSession = UserSession;
            mAppState = AppState;
            mUsersInMemory = UsersInMemory;
        }

        [ResponseType(typeof(SUserInfo))]
        [Route("v2/UserInfoChange/")] //TODO : Refactor This 
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

        [Route("v2/UserInfoChange/Edit/")] //TODO : Refactor This
        [HttpPost]
        public async Task<IHttpActionResult> EditUserInfo([FromBody] SNewUserInfo UserInfo)
        {
            if (ModelState.IsValid)
            {
                string EditSucceed;
                var Info = await mDb.Set<UserInfo>().Where(u => u.UserID == mUserSession.ID).Include(u => u.User).SingleOrDefaultAsync();
                if (Info.IsEditable > 0 && !string.IsNullOrEmpty(UserInfo.Email))
                {
                    if (await UserNameIsAccessible(mUserSession.ID, UserInfo.UserName))
                    {
                        if (await EmailIsAccessible(Info.ID, UserInfo.Email))
                        {
                            --Info.IsEditable;
                            Info.Email = UserInfo.Email;
                            Info.User.UserName = UserInfo.UserName;
                            Info.Password = UserInfo.Password;
                            Info.ChangeInfoDate = mDateTime.Now;
                            Info.IsInfoEnable = true;
                            await mDb.SaveChangesAsync();
                            mUsersInMemory.UpdateUserName(mUserSession.ID, UserInfo.UserName);

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
                    return Response(HttpStatusCode.OK, new { EditSucceed });
                }
            }
            else
            {
                return Response(HttpStatusCode.BadRequest);
            }
        }


        [ResponseType(typeof(bool))]
        [Route("v2/UserInfo/Forgot/")]
        [HttpPost]
        public async Task<bool> ForgotPassword([FromBody] SGoogleAuthentication Info)
        {
            if (!ModelState.IsValid)
                return false;

            var forgotPassword = await mUserInfoInquiry.ForgotPassword(Info);
            return forgotPassword;

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