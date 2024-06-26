﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Falcon.Data.QueryProcessors
{
    public interface IAvatarsQueryProcessor
    {
        Task<bool> PurchaseItem(int ID);
        Task<bool> IsPurchased(int ID);
        Task<bool> IsExists(int ID);
    }
}
