using System.Net;
using System.Web;

namespace Falcon.Web.Api.Utilities
{
    public class NetworkUtils : INetworkUtils
    {
        private const string HTTP_CLIENT_IP = "HTTP_CLIENT_IP";

        public HttpStatusCode Response
        {
            set
            {
                HttpContext.Current.Response.StatusCode = (int) value;
            }
        }

        public string GetRequestNetworkIP()
        {
            var ip = HttpContext.Current.Request.Params[HTTP_CLIENT_IP] ?? HttpContext.Current.Request.UserHostAddress;
            return ip;
        }

    }
}