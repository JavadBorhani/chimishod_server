﻿using Falcon.Web.Api.MaintenanceProcessing.Public;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Falcon.Web.Models.Api;
using System.Threading.Tasks;
using Falcon.Data.QueryProcessors;
using Falcon.Common;

namespace Falcon.Web.Api.MaintenanceProcessing.Private
{
    public class SpinWheelMaintenanceProcessor : ISpinWheelMaintenanceProcessor
    {
        private readonly ISpinWheelQueryProcessor mSpinWheelQueryProcessor;
        private readonly IDateTime mDateTime;
        public SpinWheelMaintenanceProcessor(IDateTime DateTime,ISpinWheelQueryProcessor SpinWheelQueryProcessor)
        {
            mSpinWheelQueryProcessor = SpinWheelQueryProcessor;
            mDateTime = DateTime;
        }

        public async Task<SAchieveSpinWheelValidation> AchieveSpinWheel(int ID)
        {
            throw new NotImplementedException();
        }
    }
}