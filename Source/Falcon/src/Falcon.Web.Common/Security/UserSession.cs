// Flapp Copyright 2017-2018

using Falcon.Common.Security;
using System;
using System.Security.Claims;
using System.Web;

namespace Falcon.Web.Common.Security
{
    public class UserSession : IWebUserSession
    {
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

        public int ID
        {
            get
            {
                return Convert.ToInt32(((ClaimsPrincipal)HttpContext.Current.User).FindFirst(ClaimTypes.NameIdentifier).Value);
            }
        }

        public string UserName
        {
            get
            {
                return ((ClaimsPrincipal)HttpContext.Current.User).FindFirst(ClaimTypes.Name).Value;
            }
        }

        public string UUID
        {
            get
            {
                return ((ClaimsPrincipal)HttpContext.Current.User).FindFirst(ClaimTypes.Sid).Value; //TODO : Solve This issue later
            }
        }

        public DateTime LastSeenDateTime
        {
            get
            {
                return Convert.ToDateTime(((ClaimsPrincipal)HttpContext.Current.User).FindFirst(ClaimTypes.DateOfBirth).Value);
            }
        }
    }
}
