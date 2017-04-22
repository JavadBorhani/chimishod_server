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
using Falcon.Common;
using Falcon.EFCommonContext.DbModel;

namespace Falcon.Web.Api.InquiryProcessing.Private
{
    public class NotificationInquiryProcessor : INotificationInquiryProcessor
    {
        private readonly IMapper mMapper;
        private readonly IGiftQueryProcessor mGiftQueryProcessor;
        private readonly IUserQueryProcessor mUserQueryProcessor;
        private readonly IWebUserSession mUserSession;
        private readonly IDateTime mDateTime;
        private readonly INotificationsQueryProcessor mNotificationsQueryProcessor;

        public NotificationInquiryProcessor(IMapper Mapper , 
            IGiftQueryProcessor GiftQueryProcessor , 
            IWebUserSession UserSession , 
            IUserQueryProcessor UserQueryProcessor , 
            IDateTime DateTime ,
            INotificationsQueryProcessor NotificationsQueryProcessor)
        {
            mMapper = Mapper;
            mGiftQueryProcessor = GiftQueryProcessor;
            mUserSession = UserSession;
            mUserQueryProcessor = UserQueryProcessor;
            mDateTime = DateTime;
            mNotificationsQueryProcessor = NotificationsQueryProcessor;  
        }
        public async Task<SNotify> GetNotification()
        {
            var userGiftList = await mGiftQueryProcessor.TodayGiftList();
            //check the type and rule based on decision

            if(userGiftList != null && userGiftList.Count > 0)
            { 
                for(int i = 0; i < userGiftList.Count; ++i)
                {
                    if(mGiftQueryProcessor.CheckGiftLogic(userGiftList[i]))
                    {
                        SNotify result = mMapper.Map<SGift, SNotify>(userGiftList[i]);

                        await mNotificationsQueryProcessor.AddDisplayedNotification(new SDisplayedNotification
                        {
                            UserID = mUserSession.ID,
                            NotificationID = result.ID,
                            InsertDate = mDateTime.Now,
                            ExpireDate = userGiftList[i].ExpireDate ?? mDateTime.Now.AddDays(Constants.Notfication.DefaultExpireDays),
                        });

                        return result;
                    }
                }
            }
            return null;
        }
        public async Task<int> RegisterNotification(int NotificationID)
        {
            var gift = await mGiftQueryProcessor.GetByID(NotificationID);
            var sGift = mMapper.Map<Gift, SGift>(gift);

            if(sGift != null)
            {
                var achieved = await mGiftQueryProcessor.IsAchieved(NotificationID);

                if (!achieved || sGift.GiftType == GiftTypes.Daily)
                {
                    if (mGiftQueryProcessor.CheckGiftLogic(sGift, gift, mDateTime.Now))
                    {
                        var result = await mGiftQueryProcessor.AddAchievedGift(NotificationID);

                        if (sGift.GiftType == GiftTypes.Daily)
                        {
                            await mUserQueryProcessor.UpdateLastSeenDateTimeToNow();
                        }

                        if (sGift.GiftType != GiftTypes.Message)
                        {
                            var coin = await mUserQueryProcessor.AddCoin(sGift.Prize);
                            return coin;
                        }
                        else
                        {
                            var coin = await mUserQueryProcessor.GetTotalCoin();
                            return coin;
                        }
                    }
                }
            }
            return 0;   
        }
    }
}