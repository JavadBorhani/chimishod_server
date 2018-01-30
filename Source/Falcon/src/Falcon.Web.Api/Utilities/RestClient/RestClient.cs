namespace Falcon.Web.Api.Utilities.RestClient
{
    using Falcon.Common;
    using System;
    using System.Collections.Generic;
    using System.IO;
    using System.Linq;
    using System.Net;
    using System.Net.Http;
    using System.Threading;
    using System.Threading.Tasks;

    /// <summary>
    /// An abstraction over <see cref="HttpClient"/> to address the following issues:
    /// <para><see href="http://aspnetmonsters.com/2016/08/2016-08-27-httpclientwrong/"/></para>
    /// <para><see href="http://byterot.blogspot.co.uk/2016/07/singleton-httpclient-dns.html"/></para>
    /// <para><see href="http://naeem.khedarun.co.uk/blog/2016/11/30/httpclient-dns-settings-for-azure-cloud-services-and-traffic-manager-1480285049222/"/></para>
    /// </summary>
    public sealed class RestClient : IRestClient
    {
        private readonly HttpClient mClient;
        private readonly HashSet<Uri> mEndpoints;
        private readonly TimeSpan mConnectionCloseTimeoutPeriod;

        /// <summary>
        /// Creates an instance of the <see cref="RestClient"/>.
        /// </summary>
        public RestClient(
            IDictionary<string, string> defaultRequestHeaders = null,
            HttpMessageHandler handler = null,
            bool disposeHandler = true,
            TimeSpan? timeout = null,
            ulong? maxResponseContentBufferSize = null)
        {
            mClient = handler == null ? new HttpClient() : new HttpClient(handler, disposeHandler);

            AddDefaultHeaders(defaultRequestHeaders);
            AddRequestTimeout(timeout);
            AddMaxResponseBufferSize(maxResponseContentBufferSize);

            mEndpoints = new HashSet<Uri>();
            mConnectionCloseTimeoutPeriod = TimeSpan.FromMinutes(1);

            // Default is 2 minutes: https://msdn.microsoft.com/en-us/library/system.net.servicepointmanager.dnsrefreshtimeout(v=vs.110).aspx
            
            ServicePointManager.DnsRefreshTimeout = (int)TimeSpan.FromMinutes(1).TotalMilliseconds;

            // Increases the concurrent outbound connections
            ServicePointManager.DefaultConnectionLimit = 1024;
        }

        public RestClient()
        {
            if(mClient == null)
            {
                mClient = new HttpClient();
                AddDefaultHeaders(new Dictionary<string, string>()
                {
                    { Constants.MediaTypeNames.Authorization , "Basic " },
                    { Constants.MediaTypeNames.KeepAlive, "true" }
                });

                AddRequestTimeout(TimeSpan.FromSeconds(15));

                mEndpoints = new HashSet<Uri>();
                mConnectionCloseTimeoutPeriod = TimeSpan.FromMinutes(1);

                // Default is 2 minutes: https://msdn.microsoft.com/en-us/library/system.net.servicepointmanager.dnsrefreshtimeout(v=vs.110).aspx

                ServicePointManager.DnsRefreshTimeout = (int)TimeSpan.FromMinutes(1).TotalMilliseconds;

                // Increases the concurrent outbound connections
                ServicePointManager.DefaultConnectionLimit = 1024;
            }
        }



        /// <summary>
        /// Gets the headers which should be sent with each request.
        /// </summary>
        public IDictionary<string, string> DefaultRequestHeaders => mClient.DefaultRequestHeaders.ToDictionary(x => x.Key, x => x.Value.First());

        /// <summary>
        /// Gets the time to wait before the request times out.
        /// </summary>
        public TimeSpan Timeout => mClient.Timeout;

        /// <summary>
        /// Gets the maximum number of bytes to buffer when reading the response content.
        /// </summary>
        public uint MaxResponseContentBufferSize => (uint)mClient.MaxResponseContentBufferSize;

        /// <summary>
        /// Gets all of the endpoints which this instance has sent a request to.
        /// </summary>
        public Uri[] Endpoints
        {
            get { lock (mEndpoints) { return mEndpoints.ToArray(); } }
        }

        /// <summary>
        /// Sends the given <paramref name="request"/>.
        /// </summary>
        /// <exception cref="ArgumentNullException"/>
        public Task<HttpResponseMessage> SendAsync(HttpRequestMessage request)
            => SendAsync(request, HttpCompletionOption.ResponseContentRead, CancellationToken.None);

        /// <summary>
        /// Sends the given <paramref name="request"/> with the given <paramref name="cToken"/>.
        /// </summary>
        /// <exception cref="ArgumentNullException"/>
        public Task<HttpResponseMessage> SendAsync(HttpRequestMessage request, CancellationToken cToken)
            => SendAsync(request, HttpCompletionOption.ResponseContentRead, cToken);

        /// <summary>
        /// Sends the given <paramref name="request"/> with the given <paramref name="option"/>.
        /// </summary>
        /// <exception cref="ArgumentNullException"/>
        public Task<HttpResponseMessage> SendAsync(HttpRequestMessage request, HttpCompletionOption option)
            => SendAsync(request, option, CancellationToken.None);

        /// <summary>
        /// Sends the given <paramref name="request"/> with the given <paramref name="option"/> and <paramref name="cToken"/>.
        /// </summary>
        /// <exception cref="ArgumentNullException"/>
        public Task<HttpResponseMessage> SendAsync(HttpRequestMessage request, HttpCompletionOption option, CancellationToken cToken)
        {
            AddConnectionLeaseTimeout(request.RequestUri);
            return mClient.SendAsync(request, option, cToken);
        }

        /// <summary>
        /// Sends a <c>GET</c> request to the specified <paramref name="uri"/>.
        /// </summary>
        /// <exception cref="UriFormatException"/>
        /// <exception cref="ArgumentException"/>
        public Task<HttpResponseMessage> GetAsync(string uri) => SendAsync(new HttpRequestMessage(HttpMethod.Get, uri));

        /// <summary>
        /// Sends a <c>GET</c> request to the specified <paramref name="uri"/>.
        /// </summary>
        /// <exception cref="ArgumentNullException"/>
        public Task<HttpResponseMessage> GetAsync(Uri uri) => SendAsync(new HttpRequestMessage(HttpMethod.Get, uri));

        /// <summary>
        /// Sends a <c>GET</c> request to the specified <paramref name="uri"/> with the given <paramref name="cToken"/>.
        /// </summary>
        /// <exception cref="UriFormatException"/>
        /// <exception cref="ArgumentException"/>
        public Task<HttpResponseMessage> GetAsync(string uri, CancellationToken cToken)
            => SendAsync(new HttpRequestMessage(HttpMethod.Get, uri), cToken);

        /// <summary>
        /// Sends a <c>GET</c> request to the specified <paramref name="uri"/> with the given <paramref name="cToken"/>.
        /// </summary>
        /// <exception cref="ArgumentNullException"/>
        public Task<HttpResponseMessage> GetAsync(Uri uri, CancellationToken cToken)
            => SendAsync(new HttpRequestMessage(HttpMethod.Get, uri), cToken);

        /// <summary>
        /// Sends a <c>GET</c> request to the specified <paramref name="uri"/> with the given <paramref name="option"/>.
        /// </summary>
        /// <exception cref="UriFormatException"/>
        /// <exception cref="ArgumentException"/>
        public Task<HttpResponseMessage> GetAsync(string uri, HttpCompletionOption option)
            => SendAsync(new HttpRequestMessage(HttpMethod.Get, uri), option);

        /// <summary>
        /// Sends a <c>GET</c> request to the specified <paramref name="uri"/> with the given <paramref name="option"/>.
        /// </summary>
        /// <exception cref="ArgumentNullException"/>
        public Task<HttpResponseMessage> GetAsync(Uri uri, HttpCompletionOption option)
            => SendAsync(new HttpRequestMessage(HttpMethod.Get, uri), option);

        /// <summary>
        /// Sends a <c>GET</c> request to the specified <paramref name="uri"/> with the given <paramref name="option"/> and <paramref name="cToken"/>.
        /// </summary>
        /// <exception cref="UriFormatException"/>
        /// <exception cref="ArgumentException"/>
        public Task<HttpResponseMessage> GetAsync(string uri, HttpCompletionOption option, CancellationToken cToken)
            => SendAsync(new HttpRequestMessage(HttpMethod.Get, uri), option, cToken);

        /// <summary>
        /// Sends a <c>GET</c> request to the specified <paramref name="uri"/> with the given <paramref name="option"/> and <paramref name="cToken"/>.
        /// </summary>
        /// <exception cref="ArgumentNullException"/>
        public Task<HttpResponseMessage> GetAsync(Uri uri, HttpCompletionOption option, CancellationToken cToken)
            => SendAsync(new HttpRequestMessage(HttpMethod.Get, uri), option, cToken);

        /// <summary>
        /// Sends a <c>PUT</c> request with the given <paramref name="content"/> to the specified <paramref name="uri"/>.
        /// </summary>
        /// <exception cref="ArgumentNullException"/>
        /// <exception cref="ArgumentException"/>
        /// <exception cref="UriFormatException"/>
        public Task<HttpResponseMessage> PutAsync(string uri, HttpContent content)
            => SendAsync(new HttpRequestMessage(HttpMethod.Put, uri) { Content = content });

        /// <summary>
        /// Sends a <c>PUT</c> request with the given <paramref name="content"/> to the specified <paramref name="uri"/>.
        /// </summary>
        /// <exception cref="ArgumentNullException"/>
        public Task<HttpResponseMessage> PutAsync(Uri uri, HttpContent content)
            => SendAsync(new HttpRequestMessage(HttpMethod.Put, uri) { Content = content });

        /// <summary>
        /// Sends a <c>PUT</c> request with the given <paramref name="content"/> to the specified <paramref name="uri"/> 
        /// with the given <paramref name="cToken"/>.
        /// </summary>
        /// <exception cref="ArgumentNullException"/>
        public Task<HttpResponseMessage> PutAsync(Uri uri, HttpContent content, CancellationToken cToken)
            => SendAsync(new HttpRequestMessage(HttpMethod.Put, uri) { Content = content }, cToken);

        /// <summary>
        /// Sends a <c>PUT</c> request with the given <paramref name="content"/> to the specified <paramref name="uri"/> 
        /// with the given <paramref name="cToken"/>.
        /// </summary>     
        /// <exception cref="ArgumentNullException"/>
        /// <exception cref="ArgumentException"/>
        /// <exception cref="UriFormatException"/>
        public Task<HttpResponseMessage> PutAsync(string uri, HttpContent content, CancellationToken cToken)
            => SendAsync(new HttpRequestMessage(HttpMethod.Put, uri) { Content = content }, cToken);

        /// <summary>
        /// Sends a <c>POST</c> request with the given <paramref name="content"/> to the specified <paramref name="uri"/>.
        /// </summary>
        /// <exception cref="ArgumentException"/>
        /// <exception cref="ArgumentNullException"/>
        /// <exception cref="UriFormatException"/>
        public Task<HttpResponseMessage> PostAsync(string uri, HttpContent content)
            => SendAsync(new HttpRequestMessage(HttpMethod.Post, uri) { Content = content });

        /// <summary>
        /// Sends a <c>POST</c> request with the given <paramref name="content"/> to the specified <paramref name="uri"/>.
        /// </summary>
        /// <exception cref="ArgumentNullException"/>
        public Task<HttpResponseMessage> PostAsync(Uri uri, HttpContent content)
            => SendAsync(new HttpRequestMessage(HttpMethod.Post, uri) { Content = content });

        /// <summary>
        /// Sends a <c>POST</c> request with the given <paramref name="content"/> to the specified <paramref name="uri"/> 
        /// with the given <paramref name="cToken"/>.
        /// </summary>
        /// <exception cref="ArgumentNullException"/>
        public Task<HttpResponseMessage> PostAsync(Uri uri, HttpContent content, CancellationToken cToken)
            => SendAsync(new HttpRequestMessage(HttpMethod.Post, uri) { Content = content }, cToken);

        /// <summary>
        /// Sends a <c>POST</c> request with the given <paramref name="content"/> to the specified <paramref name="uri"/> 
        /// with the given <paramref name="cToken"/>.
        /// </summary>     
        /// <exception cref="ArgumentException"/>
        /// <exception cref="ArgumentNullException"/>
        /// <exception cref="UriFormatException"/>
        public Task<HttpResponseMessage> PostAsync(string uri, HttpContent content, CancellationToken cToken)
            => SendAsync(new HttpRequestMessage(HttpMethod.Post, uri) { Content = content }, cToken);

        /// <summary>
        /// Sends a <c>DELETE</c> request to the specified <paramref name="uri"/>.
        /// </summary>
        /// <exception cref="UriFormatException"/>
        /// <exception cref="ArgumentException"/>
        /// <exception cref="InvalidOperationException"/>
        public Task<HttpResponseMessage> DeleteAsync(string uri)
            => SendAsync(new HttpRequestMessage(HttpMethod.Delete, uri));

        /// <summary>
        /// Sends a <c>DELETE</c> request to the specified <paramref name="uri"/>.
        /// </summary>
        /// <exception cref="ArgumentNullException"/>
        /// <exception cref="InvalidOperationException"/>
        public Task<HttpResponseMessage> DeleteAsync(Uri uri)
            => SendAsync(new HttpRequestMessage(HttpMethod.Delete, uri));

        /// <summary>
        /// Sends a <c>DELETE</c> request to the specified <paramref name="uri"/> with the given <paramref name="cToken"/>.
        /// </summary>
        /// <exception cref="UriFormatException"/>
        /// <exception cref="ArgumentException"/>
        /// <exception cref="InvalidOperationException"/>
        public Task<HttpResponseMessage> DeleteAsync(string uri, CancellationToken cToken)
            => SendAsync(new HttpRequestMessage(HttpMethod.Delete, uri), cToken);

        /// <summary>
        /// Sends a <c>DELETE</c> request to the specified <paramref name="uri"/> with the given <paramref name="cToken"/>.
        /// </summary>
        /// <exception cref="ArgumentNullException"/>
        /// <exception cref="InvalidOperationException"/>
        public Task<HttpResponseMessage> DeleteAsync(Uri uri, CancellationToken cToken)
            => SendAsync(new HttpRequestMessage(HttpMethod.Delete, uri), cToken);

        /// <summary>
        /// Sends a <c>GET</c> request to the specified <paramref name="uri"/>.
        /// </summary>
        /// <exception cref="ArgumentException"/>
        ///<exception cref="UriFormatException"/>
        public Task<string> GetStringAsync(string uri)
        {
            
            return GetStringAsync(new Uri(uri, UriKind.RelativeOrAbsolute));
        }

        /// <summary>
        /// Sends a <c>GET</c> request to the specified <paramref name="uri"/>.
        /// </summary>
        ///<exception cref="ArgumentNullException"/>
        public Task<string> GetStringAsync(Uri uri)
        {
            
            AddConnectionLeaseTimeout(uri);
            return mClient.GetStringAsync(uri);
        }

        /// <summary>
        /// Sends a <c>GET</c> request to the specified <paramref name="uri"/>.
        /// </summary>
        /// <exception cref="ArgumentException"/>
        ///<exception cref="UriFormatException"/>
        public Task<Stream> GetStreamAsync(string uri)
        {
            
            return GetStreamAsync(new Uri(uri, UriKind.RelativeOrAbsolute));
        }

        /// <summary>
        /// Sends a <c>GET</c> request to the specified <paramref name="uri"/>.
        /// </summary>
        ///<exception cref="ArgumentNullException"/>
        public Task<Stream> GetStreamAsync(Uri uri)
        {
            
            AddConnectionLeaseTimeout(uri);
            return mClient.GetStreamAsync(uri);
        }

        /// <summary>
        /// Sends a <c>GET</c> request to the specified <paramref name="uri"/>.
        /// </summary>
        ///<exception cref="UriFormatException"/>
        /// <exception cref="ArgumentException"/>
        public Task<byte[]> GetByteArrayAsync(string uri)
        {
            
            return GetByteArrayAsync(new Uri(uri, UriKind.RelativeOrAbsolute));
        }

        /// <summary>
        /// Sends a <c>GET</c> request to the specified <paramref name="uri"/>.
        /// </summary>
        ///<exception cref="ArgumentNullException"/>
        public Task<byte[]> GetByteArrayAsync(Uri uri)
        {
            AddConnectionLeaseTimeout(uri);
            return mClient.GetByteArrayAsync(uri);
        }

        /// <summary>
        /// Clears all of the endpoints which this instance has sent a request to.
        /// </summary>
        public void ClearEndpoints()
        {
            lock (mEndpoints) { mEndpoints.Clear(); }
        }

        /// <summary>
        /// Cancels all pending requests on this instance.
        /// </summary>
        public void CancelPendingRequests() => mClient.CancelPendingRequests();

        /// <summary>
        /// Releases the unmanaged resources and disposes of the managed resources used by the <see cref="HttpClient"/>.
        /// </summary>
        public void Dispose()
        {
            mClient.Dispose();
            lock (mEndpoints) { mEndpoints.Clear(); }
        }

        private void AddDefaultHeaders(IDictionary<string, string> headers)
        {
            if (headers == null) { return; }

            foreach (var item in headers)
            {
                mClient.DefaultRequestHeaders.Add(item.Key, item.Value);
            }
        }

        public void SetAuthorization(string AuthenticationKey , string Key = "Basic")
        {
            mClient.DefaultRequestHeaders.Authorization = new System.Net.Http.Headers.AuthenticationHeaderValue(Key, AuthenticationKey);
        }

        private void AddRequestTimeout(TimeSpan? timeout)
        {
            if (!timeout.HasValue) { return; }
            mClient.Timeout = timeout.Value;
        }

        private void AddMaxResponseBufferSize(ulong? size)
        {
            if (!size.HasValue) { return; }
            mClient.MaxResponseContentBufferSize = (long)size.Value;
        }

        private void AddConnectionLeaseTimeout(Uri endpoint)
        {
            lock (mEndpoints)
            {
                if (mEndpoints.Contains(endpoint)) { return; }

                ServicePointManager.FindServicePoint(endpoint)
                    .ConnectionLeaseTimeout = (int)mConnectionCloseTimeoutPeriod.TotalMilliseconds;
                mEndpoints.Add(endpoint);
            }
        }
    }
}