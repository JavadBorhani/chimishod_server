using AutoMapper;
using Falcon.EFCommonContext;
using Falcon.Web.Api.InquiryProcessing.Public;
using Falcon.Web.Common;
using Falcon.Web.Models.Api.Cache;
using System;
using System.Threading.Tasks;

namespace Falcon.Web.Api.InquiryProcessing.Private
{
    public class LevelInquiryProcessor : ILevelInquiryProcessor
    {

        //private SLevelCache[] mLevels;

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

        public Task<SLevelCache[]> GetLevelInfos()
        {
            throw new NotImplementedException();
        }

        public Task<bool> ReadStateFromDB()
        {
            throw new NotImplementedException();
        }
    }
}
