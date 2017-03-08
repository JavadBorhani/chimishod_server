using Falcon.Database.SqlServer.QueryProcessors;
using Falcon.Web.Api.MaintenanceProcessing.Public;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Falcon.Web.Api.MaintenanceProcessing.Private
{
    public class CodeGiftsMaintenanceProcessor : ICodeGiftsMaintenanceProcessor
    {

        private readonly ICodeGiftsQueryProcessor mCodeGiftsQueryProcessor;
        public CodeGiftsMaintenanceProcessor(ICodeGiftsQueryProcessor CodeGiftsQueryProcessor)
        {

        }
        public async Task<bool> GetCodeGiftPrize()
        {
            throw new NotImplementedException();
        }
    }
}
