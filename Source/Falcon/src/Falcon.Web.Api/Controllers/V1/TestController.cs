using Falcon.Web.Api.Notification.Public;
using Falcon.Web.Api.Utilities.Base;
using Falcon.Web.Api.Utilities.RestClient.Engine;
using Falcon.Web.Common;
using System;
using System.Threading.Tasks;
using System.Web.Http;

namespace Falcon.Web.Api.Controllers.V1
{
    [UnitOfWorkActionFilter]
    public class TestController : FalconApiController
    {


        private readonly INotificationSystem mNotification;
        private readonly IRestClientEngine mRestClient;
        
        public TestController(IRestClientEngine Engine, INotificationSystem NotificationSystem)
        {
            mNotification = NotificationSystem;
            mRestClient = Engine;
        }

        [Route("v2/TestController/")]
        [HttpGet]
        public async Task<string> GetInfo()
        {
            var result = await mNotification.SendToFriend(new string[]
            {
                "d99ac7d4-c0fa-4dd7-94a8-97174c619b9f",
                "c3e9d541-c0f7-4dc1-8c32-9f4222db0e40",
                "9745bd46-df22-4ff7-b113-4cad9483c66b",
                "77acbb38-a33d-49be-9207-23822879c161",
            });

            if (result != null)
                return result.id;
            else
                return  null;
        }


        [Route("v2/TestController/Test")]
        [HttpGet]
        public async Task<string> GetInfoTwo()
        {
            var cafeBazzarUri = new Uri("https://pardakht.cafebazaar.ir/devapi/v2/api/validate/<package_name>/inapp/<product_id>/purchases/<purchase_token>/");
            var addsUri = new Uri("http://api.tapsell.ir/v2/suggestions/validate-suggestion");
            var oneSignalUri = new Uri("http://api.cafebazzar.ir/v1/authentication/data");


            var headers = new HttpParam[]
            {
                new HttpParam { Key = "Authorization" , Value ="Basic " + "YTc0NWY3ZTItYjcyYy00ZWRlLWEzNDMtYjVjOGJjMjA4MmNj" },
            };

            var cafe = mRestClient.CreateRequest(cafeBazzarUri, RestSharp.Method.POST, null, headers);
            var add = mRestClient.CreateRequest(addsUri, RestSharp.Method.POST, null, headers);
            var onesignal = mRestClient.CreateRequest(oneSignalUri, RestSharp.Method.POST, null, headers);


            mRestClient.ExecuteAsync(cafeBazzarUri.ToString(), cafe, res =>
            {
                System.Diagnostics.Debug.WriteLine("1 Result:" + res.Content);
            });

            mRestClient.ExecuteAsync(addsUri.ToString(), add, res =>
            {
                System.Diagnostics.Debug.WriteLine("2 Result:" + res.Content);
            });

            mRestClient.ExecuteAsync(oneSignalUri.ToString(), onesignal, res =>
            {
                System.Diagnostics.Debug.WriteLine("3 Result:" + res.Content);
            });

            mRestClient.ExecuteAsync(cafeBazzarUri.ToString(), cafe, res =>
            {
                System.Diagnostics.Debug.WriteLine("4 Result:" + res.Content);
            });

            mRestClient.ExecuteAsync(addsUri.ToString(), add, res =>
            {
                System.Diagnostics.Debug.WriteLine("5 Result:" + res.Content);
            });

            mRestClient.ExecuteAsync(oneSignalUri.ToString(), onesignal, res =>
            {
                System.Diagnostics.Debug.WriteLine("6 Result:" + res.Content);
            });

            mRestClient.ExecuteAsync(cafeBazzarUri.ToString(), cafe, res =>
            {
                System.Diagnostics.Debug.WriteLine("7 Result:" + res.Content);
            });

            mRestClient.ExecuteAsync(addsUri.ToString(), add, res =>
            {
                System.Diagnostics.Debug.WriteLine("8 Result:" + res.Content);
            });

            mRestClient.ExecuteAsync(oneSignalUri.ToString(), onesignal, res =>
            {
                System.Diagnostics.Debug.WriteLine("9 Result:" + res.Content);
            });

            return null;
        }


    }
}