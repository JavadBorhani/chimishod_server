﻿using Falcon.Web.Models.Api;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Falcon.Web.Api.MaintenanceProcessing.Public
{
    public interface ISpinWheelMaintenanceProcessor
    {
        Task<SAchieveSpinWheelValidation> AchieveSpinWheel(int ID);
    }
}
