using System.Net;
using System.Net.Http;
using System.Threading;
using System.Threading.Tasks;
using System.Web.Http;

namespace Falcon.Web.Common.ErrorHandling
{
    public class SimpleErrorResult : IHttpActionResult
    {
        private readonly string mErrorMessage;
        private readonly HttpRequestMessage mRequestMessage;
        private readonly HttpStatusCode mStatusCode;

        public SimpleErrorResult(HttpRequestMessage requestMessage, HttpStatusCode statusCode, string errorMessage)
        {
            mRequestMessage = requestMessage;
            mStatusCode = statusCode;
            mErrorMessage = errorMessage;
        }
        public Task<HttpResponseMessage> ExecuteAsync(CancellationToken cancellationToken)
        {
            return Task.FromResult(mRequestMessage.CreateErrorResponse(mStatusCode, mErrorMessage));
        }
    }
}
