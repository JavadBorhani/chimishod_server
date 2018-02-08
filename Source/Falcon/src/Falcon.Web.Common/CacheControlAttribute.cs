using System;
using System.Net.Http.Headers;
using System.Web.Http.Filters;

namespace Falcon.Web.Common
{
    public class CacheControlAttribute  : ActionFilterAttribute
    {
        public int MaxAge { get; set; }

        public CacheControlAttribute(int MaxAge)
        {

        }
        public override bool AllowMultiple
        {
            get
            {
                return false;
            }
        }

        public override void OnActionExecuted(HttpActionExecutedContext Context)
        {
            Context.Response.Headers.CacheControl = new CacheControlHeaderValue()
            {
                Public = true,
                MaxAge = TimeSpan.FromSeconds(MaxAge),
            };
            base.OnActionExecuted(Context);
        }

    }
}
