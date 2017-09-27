using Falcon.Web.Api.InquiryProcessing.Public;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Falcon.Web.Models.Api;
using Falcon.EFCommonContext;
using Falcon.Web.Common;
using AutoMapper;
using Falcon.Web.Models.Api.Level;
using Falcon.Web.Models.Api.Cache;

namespace Falcon.Web.Api.InquiryProcessing.Private
{
    public class LevelInquiryProcessor : ILevelInquiryProcessor
    {

        private SLevelCache[] mLevels;

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
