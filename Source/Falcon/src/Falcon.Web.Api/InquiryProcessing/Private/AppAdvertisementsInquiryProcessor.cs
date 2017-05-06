using Falcon.Web.Api.InquiryProcessing.Public;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Falcon.Web.Models.Api;
using System.Threading.Tasks;
using Falcon.Data.QueryProcessors;
using AutoMapper;

namespace Falcon.Web.Api.InquiryProcessing.Private
{
    public class AppAdvertisementsInquiryProcessor : IAppAdvertisementsInquiryProcessor
    {
        private readonly IAppAvertisementsQueryProcessor mAppAdvertQueryProcessor;
        private readonly IMapper mMapper;

        public AppAdvertisementsInquiryProcessor(IAppAvertisementsQueryProcessor AppAdvertQueryProcessor , IMapper Mapper)
        {
            mAppAdvertQueryProcessor = AppAdvertQueryProcessor;
            mMapper = Mapper;
        }
        public async Task<List<SAppAdvert>> GetAdvertList()
        {
            var list = await mAppAdvertQueryProcessor.GetUnexpiredList();
            var mapped = mMapper.Map<List<SAppAdvert>>(list);
            return mapped;
        }
    }
}