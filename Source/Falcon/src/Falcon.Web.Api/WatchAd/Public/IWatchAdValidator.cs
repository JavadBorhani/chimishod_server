using Falcon.Web.Api.WatchAd.Private;
using System.Threading.Tasks;

namespace Falcon.Web.Api.WatchAd.Public
{
    public interface IWatchAdValidator
    {
        Task<ResponseToken> ValidateWatchAd(string ProviderUri, RequestToken RequestToken);
    }
}