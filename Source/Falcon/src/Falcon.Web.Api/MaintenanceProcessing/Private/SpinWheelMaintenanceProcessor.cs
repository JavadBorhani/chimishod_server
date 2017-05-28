﻿using Falcon.Web.Api.MaintenanceProcessing.Public;
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
        public SpinWheelMaintenanceProcessor(
            IDateTime DateTime, 
            ISpinWheelQueryProcessor SpinWheelQueryProcessor , 
            IUserQueryProcessor UserQueryProcessor , 
            IItemPurchaseManager ItemPurchaseManager)
        {
            mSpinWheelQueryProcessor = SpinWheelQueryProcessor;
            mDateTime = DateTime;
            mUserQueryProcessor = UserQueryProcessor;
            mItemPurchaseManager = ItemPurchaseManager;
        }

        public async Task<SAchieveSpinWheelValidation> AchieveSpinWheel(int ID)
        {
            var spinItem = await mSpinWheelQueryProcessor.GetByID(ID);
            SSpinWheelType type;
            SAchieveSpinWheelValidation response = new SAchieveSpinWheelValidation();

            if(spinItem != null)
            {
                var isPossible = Enum.IsDefined(typeof(SSpinWheelType), spinItem.SpinWheelType.Title);
                if(!isPossible)
                {
                    return null;
                }

                type = (SSpinWheelType)Enum.Parse(typeof(SSpinWheelType), spinItem.SpinWheelType.Title);

                if(type == SSpinWheelType.Theme || type == SSpinWheelType.Category || type == SSpinWheelType.Avatar)
                {
                    var achieved = await mSpinWheelQueryProcessor.AchievedUnRepeatableSpinWheel(spinItem.ID);
                    if(achieved)
                    {
                        response.IsValid = false;
                        response.TotalCoin = await mUserQueryProcessor.GetTotalCoin();
                        response.RequestId = ID;
                    }
                    return response;
                }

                switch(type)
                {
                    case SSpinWheelType.Avatar:

                        await mItemPurchaseManager.PurchaseFreeAvatar(spinItem.Prize);

                        break;

                    case SSpinWheelType.Blank:

                        break;

                    case SSpinWheelType.Category:

                        await mItemPurchaseManager.PurchaseFreeCategory(spinItem.Prize);

                        break;

                    case SSpinWheelType.Coin:

                        break;

                    case SSpinWheelType.Fortune:

                        break;

                    case SSpinWheelType.Theme:

                        await mItemPurchaseManager.PurchaseFreeTheme(spinItem.Prize);

                        break;
                }
            }
            return null;
        }
    }
}