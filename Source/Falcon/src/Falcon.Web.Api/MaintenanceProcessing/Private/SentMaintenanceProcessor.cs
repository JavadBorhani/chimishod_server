using Falcon.Common;
using Falcon.Data.QueryProcessors;
using Falcon.Web.Api.MaintenanceProcessing.Public;

namespace Falcon.Web.Api.MaintenanceProcessing.Private
{
    public class SentMaintenanceProcessor : ISentMaintenanceProcessor
    {
        private readonly ISentQueryProcessor mSentQuery;
        private readonly IDateTime mDateTime;
        public SentMaintenanceProcessor(ISentQueryProcessor SentQuery , IDateTime DateTime)
        {
            mSentQuery = SentQuery;
            mDateTime = DateTime;
        }
    }
}