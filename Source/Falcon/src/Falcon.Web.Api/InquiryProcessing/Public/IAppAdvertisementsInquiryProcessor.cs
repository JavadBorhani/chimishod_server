using Falcon.Web.Models.Api;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;

namespace Falcon.Web.Api.InquiryProcessing.Public
{
    public interface IAppAdvertisementsInquiryProcessor
    {
        Task<List<SAppAdvert>> GetAdvertList(); 
    }
}