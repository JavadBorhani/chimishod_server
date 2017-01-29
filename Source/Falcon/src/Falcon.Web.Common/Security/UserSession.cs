// BMS-Studio Copyright 2017-2018

using Falcon.Common.Security;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;
using System.Web;

namespace Falcon.Web.Common.Security
{
    public class UserSession : IWebUserSession
    {
        public string ApiVersionInUse
        {
            get
            {
                int versionIndex = 2; 
                if(HttpContext.Current.Request.Url.Segments.Count() < versionIndex + 1)
                {
                    return string.Empty;
                }

                var apiVersionInUse = HttpContext.Current.Request.Url.Segments[versionIndex].Replace("/", string.Empty);
                return apiVersionInUse;
            }
        }

        public string FirstName
        {
            get
            {
                return ((ClaimsPrincipal)HttpContext.Current.User).FindFirst(ClaimTypes.GivenName).Value;
            }
        }

        public string LastName
        {
            get
            {
                return ((ClaimsPrincipal)HttpContext.Current.User).FindFirst(ClaimTypes.Surname).Value; 
            }
        }

        public string UserName
        {
            get
            {
                return ((ClaimsPrincipal)HttpContext.Current.User).FindFirst(ClaimTypes.Name).Value;
            }
        }

        public string HttpRequestMethod
        {
            get
            {
                return HttpContext.Current.Request.HttpMethod; 
            }
        }
       
        public Uri RequestUri
        {
            get
            {
                return HttpContext.Current.Request.Url;
            }
        }

        public string UUID
        {
            get
            {
                return HttpContext.Current.User.Identity.Name; //TODO : Solve This issue later
            }
        }

        public bool IsInRle(string roleName)
        {
            return HttpContext.Current.User.IsInRole(roleName);
        }
    }
}
