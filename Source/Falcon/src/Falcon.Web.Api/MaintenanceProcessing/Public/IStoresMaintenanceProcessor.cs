﻿// Flapp Copyright 2017-2018
using Falcon.Web.Models.Api;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Falcon.Web.Api.MaintenanceProcessing.Public
{
    public interface IStoresMaintenanceProcessor
    {
        Task<SHardCurrencyPurchasedVerification> VerifyPurchase(SHardCurrency HardCurrency);
    }
}
