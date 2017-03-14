using Falcon.Web.Api.InquiryProcessing.Public;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Falcon.Web.Models.Api;
using System.Threading.Tasks;
using AutoMapper;
using Falcon.Data.QueryProcessors;
using Falcon.Common.Security;

namespace Falcon.Web.Api.InquiryProcessing.Private
{
    public class NotificationInquiryProcessor : INotificationInquiryProcessor
    {
        private readonly IMapper mMapper;
        private readonly IGiftQueryProcessor mGiftQueryProcessor;
        private readonly IWebUserSession mUserSession;

        public NotificationInquiryProcessor(IMapper Mapper , IGiftQueryProcessor GiftQueryProcessor , IWebUserSession UserSession)
        {
            mMapper = Mapper;
            mGiftQueryProcessor = GiftQueryProcessor;
            mUserSession = UserSession;
        }
        public async Task<SNotify> GetNotification()
        {
            
        }
    }
}