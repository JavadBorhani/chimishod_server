using Falcon.Web.Api.MaintenanceProcessing.Public;
using System;
using Falcon.Web.Models.Api;
using System.Threading.Tasks;
using Falcon.Data.QueryProcessors;
using Falcon.Common;

namespace Falcon.Web.Api.MaintenanceProcessing.Private
{
    public class SpinWheelMaintenanceProcessor : ISpinWheelMaintenanceProcessor
    {
        private readonly ISpinWheelQueryProcessor mSpinWheelQueryProcessor;
        private readonly IUserQueryProcessor mUserQueryProcessor;
        private readonly IDateTime mDateTime;
        private readonly IItemPurchaseManager mItemPurchaseManager;
        private readonly IUserStatQueryProcessor mUserStatQueryProcessor;
        private readonly SApplicationState mAppState;

        public SpinWheelMaintenanceProcessor(
            IDateTime DateTime, 
            ISpinWheelQueryProcessor SpinWheelQueryProcessor , 
            IUserQueryProcessor UserQueryProcessor , 
            IItemPurchaseManager ItemPurchaseManager,
            IUserStatQueryProcessor UserStatQueryProcessor,
            IGlobalApplicationState ApplicationState)
        {
            mSpinWheelQueryProcessor = SpinWheelQueryProcessor;
            mDateTime = DateTime;
            mUserQueryProcessor = UserQueryProcessor;
            mItemPurchaseManager = ItemPurchaseManager;
            mUserStatQueryProcessor = UserStatQueryProcessor;
            mAppState = ApplicationState.GetState();
        }

        public async Task<SAchieveSpinWheelValidation> AchieveSpinWheel(int ID)
        {
            var spinItem = await mSpinWheelQueryProcessor.GetByID(ID);
            SSpinWheelType type;
            SAchieveSpinWheelValidation response = new SAchieveSpinWheelValidation();
            response.RequestId = ID;    

            if(spinItem != null)
            {
                var fortuneCount = await mUserStatQueryProcessor.GetRemainedFortune();
                if (fortuneCount <= 0)
                {
                    response.IsValid = false;
                    response.TotalCoin = await mUserQueryProcessor.GetTotalCoin();

                    if(response.TotalCoin >= mAppState.SpinWheelLoopPrice)
                    {
                        await mUserQueryProcessor.DecreaseCoin(mAppState.SpinWheelLoopPrice);
                        await mUserStatQueryProcessor.AddFortune(Constants.DefaultUser.SpinWheelAnotherFortune);
                    }
                    else
                    {
                        return response;
                    }
                }
                var isPossible = Enum.IsDefined(typeof(SSpinWheelType), spinItem.SpinWheelType.Title);
                if (!isPossible)
                {
                    return null;
                }

                type = (SSpinWheelType)Enum.Parse(typeof(SSpinWheelType), spinItem.SpinWheelType.Title);

                await mSpinWheelQueryProcessor.AddRepeatableAchievement(spinItem.ID);

                if (type == SSpinWheelType.Theme || type == SSpinWheelType.Category || type == SSpinWheelType.Avatar)
                {
                    var achieved = await mSpinWheelQueryProcessor.AchievedUnRepeatableSpinWheel(spinItem.ID);
                    if (achieved)
                    {
                        response.IsValid = false;
                        response.TotalCoin = await mUserQueryProcessor.GetTotalCoin();
                        return response;
                    }
                }

                bool added;
                bool purchased;
                switch (type)
                {
                    case SSpinWheelType.Avatar:

                        added = await mSpinWheelQueryProcessor.AddUnRepeatableAchievement(spinItem.ID);
                        purchased = await mItemPurchaseManager.PurchaseFreeAvatar(spinItem.Prize);

                        response.IsValid = purchased;
                        response.TotalCoin = await mUserQueryProcessor.GetTotalCoin();

                        break;

                    case SSpinWheelType.Blank:

                        response.IsValid = true;
                        response.TotalCoin = await mUserQueryProcessor.GetTotalCoin();

                        break;

                    case SSpinWheelType.Category:

                        added = await mSpinWheelQueryProcessor.AddUnRepeatableAchievement(spinItem.ID);
                        purchased = await mItemPurchaseManager.PurchaseFreeCategory(spinItem.Prize);

                        response.IsValid = purchased;
                        response.TotalCoin = await mUserQueryProcessor.GetTotalCoin();

                        break;

                    case SSpinWheelType.Coin:

                        response.IsValid = true;
                        response.TotalCoin = await mUserQueryProcessor.IncreaseCoin(spinItem.Prize);


                        break;

                    case SSpinWheelType.Fortune:

                        await mUserStatQueryProcessor.AddFortune(spinItem.Prize);

                        response.IsValid = true;
                        response.TotalCoin = await mUserQueryProcessor.GetTotalCoin();

                        break;

                    case SSpinWheelType.Theme:

                        added = await mSpinWheelQueryProcessor.AddUnRepeatableAchievement(spinItem.ID);
                        purchased = await mItemPurchaseManager.PurchaseFreeTheme(spinItem.Prize);

                        response.IsValid = purchased;
                        response.TotalCoin = await mUserQueryProcessor.GetTotalCoin();

                        break;
                }
                return response;
            }
            return null;
        }
    }
}