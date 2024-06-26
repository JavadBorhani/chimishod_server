﻿using Falcon.Data.QueryProcessors;
using Falcon.Web.Api.MaintenanceProcessing.Public;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Threading.Tasks;

namespace Falcon.Web.Api.MaintenanceProcessing.Private
{
    public class ThemesMaintenanceProcessor : IThemesMaintenanceProcessor
    {
        private readonly IThemesQueryProcessor mThemesQueryProcessor;
        public ThemesMaintenanceProcessor(IThemesQueryProcessor ThemesQueryProcessor)
        {
            mThemesQueryProcessor = ThemesQueryProcessor;
        }

        public async Task<bool> PurchaseFreeItem(int ID)
        {
            var exists = await mThemesQueryProcessor.IsExists(ID);
            if (exists)
            {
                var purchased = await mThemesQueryProcessor.IsPurchased(ID);
                if (!purchased)
                {
                    await mThemesQueryProcessor.PurchaseItem(ID);
                    return true;
                }
                return purchased;
            }
            return false;
        }
    }
}