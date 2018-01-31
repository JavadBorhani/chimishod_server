
using System;
using System.Threading.Tasks;

namespace Falcon.Web.Api.Utilities.RestClient.Engine
{
    using RestSharp;
    using System.Collections.Concurrent;

    public class RestClientEngine : IRestClientEngine
    {
        private ConcurrentDictionary<string, RestClient> mClients;

        public RestClientEngine()
        {
            if(mClients == null)
                mClients = new ConcurrentDictionary<string, RestClient>();
        }

        public RestRequest CreateRequest(string Uri, Method Method , object BodyItems, HttpParam[] Parameters = null, HttpParam[] Headers = null)
        {
            var relativePath = new Uri(Uri).PathAndQuery;
            var request = new RestRequest(relativePath, Method);
            request.RequestFormat = DataFormat.Json;
            request.AddJsonBody(BodyItems);

            for (int parameter = 0; parameter < Parameters?.Length; ++parameter)
            {
                request.AddParameter(Parameters[parameter].Key, Parameters[parameter].Value);
            }

            for (int header = 0; header < Headers?.Length; ++header)
            {
                request.AddHeader(Headers[header].Key, Headers[header].Value);
            }


            return request;
        }

        public RestRequest CreateRequest(Uri Uri, Method Method, object BodyItems, HttpParam[] Headers = null)
        {
            var relativePath = Uri.PathAndQuery;
            var request = new RestRequest(relativePath, Method);
            request.RequestFormat = DataFormat.Json;

            request.AddJsonBody(BodyItems);

            for (int header = 0; header < Headers?.Length; ++header)
            {
                request.AddHeader(Headers[header].Key, Headers[header].Value);
            }


            return request;
        }

        public RestRequestAsyncHandle ExecuteAsync(string Uri, IRestRequest request, Action<IRestResponse> callback = null)
        {
            var restClient = AddOrGetRestClient(Uri);

            return restClient.ExecuteAsync(request, res =>
            {
                callback.Invoke(res);
            });
        }

        public Task<IRestResponse> ExecuteTaskAsync(string Uri , IRestRequest request)
        {
            var restClient = AddOrGetRestClient(Uri);

            return restClient.ExecuteTaskAsync(request);
        }

        private RestClient AddOrGetRestClient(string Request)
        {
            var uri = new Uri(Request);
            var baseUri = uri.GetLeftPart(UriPartial.Authority);

            return mClients.GetOrAdd(baseUri, new RestClient(baseUri));
        }

        public RestRequest CreateRequest(string Uri, Method Method, object BodyItems, HttpParam[] Headers = null)
        {
            var relativePath = new Uri(Uri).PathAndQuery;
            var request = new RestRequest(relativePath, Method);
            request.RequestFormat = DataFormat.Json;

            request.AddJsonBody(BodyItems);

            for (int header = 0; header < Headers?.Length; ++header)
            {
                request.AddHeader(Headers[header].Key, Headers[header].Value);
            }


            return request;
        }
    }
}