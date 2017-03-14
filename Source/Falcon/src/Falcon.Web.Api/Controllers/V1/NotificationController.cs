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

        public NotificationController(INotificationInquiryProcessor NotificationInquiryProcessor)
        {
            mNotificationInquiryProcessor = NotificationInquiryProcessor; 
        }

        [Route("Notification/")]
        [ResponseType(typeof(SNotify))]
        [HttpPost]
        public async Task<SNotify> GetNotification()
        {
            SNotify result = await mNotificationInquiryProcessor.GetNotification();
            return result;
        }

    }
}
