using RestSharp;

namespace Falcon.Client.App.Utils
{
    public static class RequestUtils
    {
        public struct HttpParam
        {
            public string key;
            public string value;
        }
        public static RestRequest CreateRequest(string Path, Method Method, string UUIDBase64, HttpParam[] Parameters = null, HttpParam[] Headers = null)
        {
            var request = new RestRequest(Path, Method);

            request.AddHeader("Authorization", "Base " + UUIDBase64);

            for (int parameter = 0; parameter < Parameters?.Length; ++parameter)
            {
                request.AddParameter(Parameters[parameter].key, Parameters[parameter].value);
            }

            for (int header = 0; header < Headers?.Length; ++header)
            {
                request.AddHeader(Headers[header].key, Headers[header].value);
            }

            return request;
        }
    }
}
