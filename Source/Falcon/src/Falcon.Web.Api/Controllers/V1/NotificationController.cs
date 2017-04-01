using Falcon.Web.Api.InquiryProcessing.Public;
using Falcon.Web.Common;
using Falcon.Web.Models.Api;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Description;

namespace Falcon.Web.Api.Controllers.V1
{
    [UnitOfWorkActionFilter]
    public class NotificationController : ApiController
    {
        private readonly INotificationInquiryProcessor mNotificationInquiryProcessor;
        private readonly IUsersInquiryProcessor mUsersInquiryProcessor;

        public NotificationController(INotificationInquiryProcessor NotificationInquiryProcessor , IUsersInquiryProcessor UsersInquiryProcessor)
        {
            mNotificationInquiryProcessor = NotificationInquiryProcessor;
            mUsersInquiryProcessor = UsersInquiryProcessor;
        }

        [Route("Notification/")]
        [ResponseType(typeof(SNotify))]
        [HttpPost]
        public async Task<SNotify> GetNotification()
        {
            SNotify result = await mNotificationInquiryProcessor.GetNotification();
            return result;
        }

        [Route("Notification/Register/{NotificationID}")]
        [ResponseType(typeof(int))]
        [HttpPost]
        public async Task<int> RegisterNotification(int NotificationID)
        {
            int totalCoin = await mNotificationInquiryProcessor.RegisterNotification(NotificationID);
            return totalCoin; 
        }

    }
}
