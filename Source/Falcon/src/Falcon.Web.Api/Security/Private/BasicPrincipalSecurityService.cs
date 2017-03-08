﻿using Falcon.Common;
using Falcon.Common.Logging;
using Falcon.EFCommonContext;
using Falcon.EFCommonContext.DbModel;
using Falcon.Web.Api.Security.Public;
using Falcon.Web.Common;
using log4net;
using System.Linq;
using System.Security.Principal;
using System.Security.Claims;
using System;
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

        public virtual IDbContext mDb
        {
            get
            {
                return WebContainerManager.Get<IDbContext>();
            }
        }

        public virtual User GetUser(string UUID)
        {
            return mDb.Set<User>().AsNoTracking().Where(u => u.UUID == UUID).SingleOrDefault();
        }

        public virtual IPrincipal GetUserPrincipal(User user)
        {
            var identity = new GenericIdentity(user.UserName, Constants.SchemeTypes.Basic);

            identity.AddClaim(new Claim(ClaimTypes.NameIdentifier, user.ID.ToString()));
            identity.AddClaim(new Claim(ClaimTypes.Name , user.UserName));
            identity.AddClaim(new Claim(ClaimTypes.Sid, user.UUID));

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