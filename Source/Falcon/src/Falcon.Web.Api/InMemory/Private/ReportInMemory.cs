using Falcon.EFCommonContext;
using Falcon.EFCommonContext.DbModel;
using Falcon.Web.Api.InMemory.Public;
using Falcon.Web.Common;
using Falcon.Web.Models.Api;
using System.Collections.Concurrent;
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

        private ConcurrentDictionary<int, SReportType> mReportTypes = new ConcurrentDictionary<int, SReportType>();

        public ConcurrentDictionary<int, SReportType> GetState() 
        {
            CheckAvailability();
            return mReportTypes;
        }

        public void ReadStateFromDatabase()
        {
            mReportTypes.Clear();

            var items = mDb.Set<ReportType>().AsNoTracking().ToList();

            for(int i = 0; i < items.Count(); ++i)
            {

                var reportType = new SReportType
                {
                    ID = items[i].ID,
                    Description = items[i].Description,
                    Name = items[i].Name,
                    ReportCountToFilter = items[i].ReportCountToFilter,
                    ShouldBanUser = items[i].BanUser
                };


                mReportTypes.TryAdd(items[i].ID, reportType);
            }
        }

        public SReportType GetReportByID(int ID)
        {
            CheckAvailability();
            return mReportTypes[ID];  
        }

        public bool SetState(ConcurrentDictionary<int, SReportType> NewState)
        {
            if(NewState != null)
            {
                
            }
            return false;
        }

        public void CheckAvailability()
        {
            if(mReportTypes.Count <= 0)
            {
                ReadStateFromDatabase();
            }
        }
    }
}
 