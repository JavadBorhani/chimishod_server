// Flapp Copyright 2017-2018
using Falcon.Web.Models.Api;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;

namespace Falcon.Web.Api.InquiryProcessing.Public
{
    public interface IAppAdvertsInquiryProcessor
    {
        Task<List<SAppAdvert>> GetAdvertList(); 
    }
}