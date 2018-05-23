// Flapp Copyright 2017-2018
using Falcon.Common;
using Falcon.Common.Logging;
using Falcon.EFCommonContext.DbModel;
using Falcon.Web.Api.MaintenanceProcessing.Public;
using Falcon.Web.Api.Security.Public;
using Falcon.Web.Common;
using log4net;
using System.Security.Claims;
using System.Security.Principal;
using System.Threading;
using System.Web;

namespace Falcon.Web.Api.Security.Private
{
    public class BasicPrincipalSecurityService : IBasicPrincipalSecurityService
    {
        //TODO : Refactor this to set needed principals
        private readonly ILog mLogger;

        public BasicPrincipalSecurityService(ILogManager LogManager)
        {
            mLogger = LogManager.GetLog(typeof(BasicPrincipalSecurityService));
        }

        public virtual IUsersInMemory UsersInMemory
        {
            get
            {
                return WebContainerManager.Get<IUsersInMemory>();
            }
        }

        public virtual User GetUser(string UUID)
        {
            var user = UsersInMemory.GetUser(UUID);

            if(user != null)
            {
                return new User
                {
                    ID = user.ID,
                    AvatarImagePath = user.ImagePath,
                    UUID = user.UUID,
                    NotificationID = user.NotificationID,
                    UserName = user.UserName
                };
            }

            return null;
        }

        public virtual IPrincipal GetUserPrincipal(User user)
        {
            var identity = new GenericIdentity(user.UserName, Constants.SchemeTypes.Basic);

            identity.AddClaim(new Claim(ClaimTypes.NameIdentifier, user.ID.ToString()));
            identity.AddClaim(new Claim(ClaimTypes.Name , user.UserName));
            identity.AddClaim(new Claim(ClaimTypes.Sid, user.UUID));
            identity.AddClaim(new Claim(ClaimTypes.Thumbprint, user.AvatarImagePath ?? string.Empty));            
            //identity.AddClaim(new Claim(ClaimTypes.DateOfBirth, user.LastSeenDateTime.ToString()));
            //identity.AddClaim(new Claim(ClaimTypes.UserData, user.PrevLastSeenDateTime.ToString()));

            //identity.AddClaim(new Claim(ClaimTypes.IsPersistent, user.IsTutorial.ToString()));

            return new ClaimsPrincipal(identity);
        }

        public virtual IPrincipal GetUserPrincipal(string UUID)
        {
            var identity = new GenericIdentity("RAW", Constants.SchemeTypes.Basic);
            identity.AddClaim(new Claim(ClaimTypes.Sid, UUID));

            return new ClaimsPrincipal(identity);
        }

        public bool SetPrincipal(string UUID)
        {
            var user = GetUser(UUID);

            IPrincipal principal = null;
            if(user == null || (principal = GetUserPrincipal(user)) == null)
            {

                //TODO : record ip address and all related informations 
                mLogger.ErrorFormat("Unauthorized User Access UUID : {0} , IP:{1}", UUID, HttpContext.Current.Request.UserHostName);
                return false;   
            }

            Thread.CurrentPrincipal = principal;
            if(HttpContext.Current != null)
            {
                HttpContext.Current.User = principal;
            }
            return true;
        }
        public bool SetRawPrincipal(string UUID)
        {
            if(string.IsNullOrEmpty(UUID))
            {
                return false;
            }

            IPrincipal principal = GetUserPrincipal(UUID);

            Thread.CurrentPrincipal = principal;
            if(HttpContext.Current != null)
            {
                HttpContext.Current.User = principal;
            }
            return true;
        }
    }
}