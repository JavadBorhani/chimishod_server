using AutoMapper;
using Falcon.Data.QueryProcessors;
using Falcon.Web.Api.InquiryProcessing.Public;
using Falcon.Web.Models.Api.Level;
using System.Threading.Tasks;

namespace Falcon.Web.Api.InquiryProcessing.Private
{
    public class LevelInquiryProcessor : ILevelInquiryProcessor
    {
        private readonly ILevelQueryProcessor mLevelQuery;
        private readonly IMapper mMapper;
        public LevelInquiryProcessor(ILevelQueryProcessor LevelQuery , IMapper Mapper)
        {
            mLevelQuery = LevelQuery;
            mMapper = Mapper;
        }

        public async Task<SLevel[]> GetLevelList()
        {
            var levels = await mLevelQuery.GetAll();
            return levels;  
        }
    }
}