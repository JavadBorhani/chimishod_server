// Flapp Copyright 2017-2018
using Falcon.Web.Api.MaintenanceProcessing.Public;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Threading.Tasks;
using Falcon.Data.QueryProcessors;
using System.Web.Http;
using System.Web.Http.Description;

namespace Falcon.Web.Api.MaintenanceProcessing.Private
{
    public class AppAdvertsMaintenanceProcessor : IAppAdvertsMaintenanceProcessor
    {
        private readonly IAppAdvertsQueryProcessor mAppAdvertsQueryProcessor;
        public AppAdvertsMaintenanceProcessor(IAppAdvertsQueryProcessor AppAdvertsQueryProcessor)
        {
            mAppAdvertsQueryProcessor = AppAdvertsQueryProcessor;

        }
        public async Task<bool> AddPresentedAdvert(int ID)
        {
            var exists = await mAppAdvertsQueryProcessor.IsExists(ID);
            if(exists)
            {
                var result = await mAppAdvertsQueryProcessor.AddPresentedAdvert(ID);
                return true;
            }
            return false;   
        }
    }
}