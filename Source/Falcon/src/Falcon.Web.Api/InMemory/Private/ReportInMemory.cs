using Falcon.EFCommonContext;
using Falcon.EFCommonContext.DbModel;
using Falcon.Web.Api.InMemory.Public;
using Falcon.Web.Common;
using Falcon.Web.Models.Api;
using System.Collections.Generic;
using System.Linq;

namespace Falcon.Web.Api.InMemory.Private
{
    public class ReportInMemory : IReportInMemory
    {
        private IDbContext mDb
        {
            get
            {
                return WebContainerManager.Get<IDbContext>();
            }
        }

        private Dictionary<int, SReportType> mReportTypes = new Dictionary<int, SReportType>();

        public Dictionary<int, SReportType> GetState()
        {
            return mReportTypes;
        }

        public void ReadStateFromDatabase()
        {
            mReportTypes.Clear();

            var items = mDb.Set<ReportType>().AsNoTracking().ToList();

            for(int i = 0; i < items.Count(); ++i)
            {
                   
            }

        }

        public bool SetState(Dictionary<int, SReportType> NewState)
        {
            if(NewState != null)
            {

            }
            return false;
        }
    }
}
