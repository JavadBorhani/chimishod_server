﻿using Falcon.Web.Models.Api.Initialize;
using Falcon.Web.Models.Api.User;
using System.Threading.Tasks;

namespace Falcon.Web.Api.InquiryProcessing.Public
{
    public interface IInitializationInquiryProcessor
    {
        Task<SUserInitializationData> LoadUserData(SInitializeInquiry Inquiry);
        bool ReloadServerConfig();
    }
}
