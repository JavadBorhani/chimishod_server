using AutoMapper;
using Falcon.EFCommonContext;
using Falcon.Web.Api.MaintenanceProcessing.Public;
using Falcon.Web.Common;
using Falcon.Web.Models.Api.Config;
using System.Linq;

namespace Falcon.Web.Api.MaintenanceProcessing.Private
{
    public class ClientApplicationState : IClientApplicationState
    {

        private SClientAppState mClientAppState;

        public virtual IDbContext mDB
        {
            get
            {
                return WebContainerManager.Get<IDbContext>();
            }
        }

        public virtual IMapper mMapper
        {
            get
            {
                return WebContainerManager.Get<IMapper>();
            }
        }

        public void ReadStateFromDatabase()
        {
            var data = mDB.Set<ClientApplicationState>().AsNoTracking().SingleOrDefault();
            mClientAppState = mMapper.Map<SClientAppState>(data);
        }

        public SClientAppState State()
        {
            if(mClientAppState == null)
            {
                ReadStateFromDatabase();
            }
            return mClientAppState;
        }


    }
}