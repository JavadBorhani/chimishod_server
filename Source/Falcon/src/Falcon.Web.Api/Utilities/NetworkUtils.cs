using System;
using System.Linq;
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
                HttpContext.Current.Response.StatusCode = (int)value;
            }
        }

        public string GetRequestNetworkIP()
        {
            var ip = HttpContext.Current.Request.Params[HTTP_CLIENT_IP] ?? HttpContext.Current.Request.UserHostAddress;
            return ip;
        }

        public bool IsIpInternal()
        {
            var ipAddress = GetRequestNetworkIP();

            int[] ipParts = ipAddress.Split(new String[] { "." }, StringSplitOptions.RemoveEmptyEntries)
                         .Select(s => int.Parse(s)).ToArray();
            
            if (ipParts[0] == 10 ||
                (ipParts[0] == 192 && ipParts[1] == 168) ||
                (ipParts[0] == 172 && (ipParts[1] >= 16 && ipParts[1] <= 31)))
            {
                return true;
            }

            return false;
        }

        public bool IsValidUUID(string UUID)
        {
            Guid item;
            var isValid = Guid.TryParse(UUID, out item);
            return isValid;
        }
    }

}