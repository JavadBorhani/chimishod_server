
using RestSharp;
using System;
using System.Threading.Tasks;

namespace Falcon.Web.Api.Utilities.RestClient.Engine
{
    public struct HttpParam
    {
        public string Key { get; set; }
        public string Value { get; set; }
    }

    public interface IRestClientEngine
    {
        RestRequest CreateRequest(string Request, Method Method, object BodyItems, HttpParam[] Parameters, HttpParam[] Headers = null);

        RestRequest CreateRequest(string Uri, Method Method, object BodyItems, HttpParam[] Headers = null);

        RestRequest CreateRequest(Uri Uri, Method Method, object BodyItems, HttpParam[] Headers = null);

        Task<IRestResponse> ExecuteTaskAsync(string BaseUri, IRestRequest request);

        RestRequestAsyncHandle ExecuteAsync(string BaseUri, IRestRequest request, Action<IRestResponse> callback = null);
    }
}