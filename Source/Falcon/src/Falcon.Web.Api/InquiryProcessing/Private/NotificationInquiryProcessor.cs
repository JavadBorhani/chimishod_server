using AutoMapper;
using Falcon.Common;
using Falcon.Common.Security;
using Falcon.Data.QueryProcessors;
using Falcon.EFCommonContext.DbModel;
using Falcon.Web.Api.InquiryProcessing.Public;
using Falcon.Web.Models.Api;
using System.Threading.Tasks;

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
                    var isOk = await mGiftQueryProcessor.CheckGiftLogic(userGiftList[i]); 
                    if (isOk)
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
                    var isOk = await mGiftQueryProcessor.CheckGiftLogic(sGift, gift, mDateTime.Now);

                    if (isOk)
                    {
                        var result = await mGiftQueryProcessor.AddAchievedGift(NotificationID);

                        if (sGift.GiftType == GiftTypes.Daily)
                        {
                            await mUserQueryProcessor.UpdateLastSeenDateTimeToNow();
                        }

                        if (sGift.GiftType != GiftTypes.Message)
                        {
                            var coin = await mUserQueryProcessor.IncreaseCoin(sGift.Prize);
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