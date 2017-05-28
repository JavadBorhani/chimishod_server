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
        public SpinWheelMaintenanceProcessor(IDateTime DateTime, ISpinWheelQueryProcessor SpinWheelQueryProcessor , IUserQueryProcessor UserQueryProcessor)
        {
            mSpinWheelQueryProcessor = SpinWheelQueryProcessor;
            mDateTime = DateTime;
            mUserQueryProcessor = UserQueryProcessor;
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

                        break;

                    case SSpinWheelType.Blank:

                        break;

                    case SSpinWheelType.Category:

                        break;

                    case SSpinWheelType.Coin:

                        break;

                    case SSpinWheelType.Fortune:

                        break;

                    case SSpinWheelType.Theme:

                        break;
                }
            }
            return null;
        }
    }
}