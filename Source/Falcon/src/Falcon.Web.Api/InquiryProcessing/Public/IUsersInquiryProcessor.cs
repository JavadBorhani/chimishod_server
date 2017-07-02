// Flapp Copyright 2017-2018
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;

namespace Falcon.Web.Api.InquiryProcessing.Public
{
    public interface IUsersInquiryProcessor
    {
        Task<int> GetTotalCoin();
        Task<bool> LevelExist(int LevelNumber);
    }
}