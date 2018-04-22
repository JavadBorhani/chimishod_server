using System.Net;

namespace Falcon.Web.Api.Utilities
{
    public interface INetworkUtils
    {
        string GetRequestNetworkIP();
        HttpStatusCode Response { set; }

        bool IsIpInternal();
    }
}
