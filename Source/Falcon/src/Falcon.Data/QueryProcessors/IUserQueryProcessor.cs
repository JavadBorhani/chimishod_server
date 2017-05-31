﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Falcon.Data.QueryProcessors
{
    public interface IUserQueryProcessor
    {
        Task<int> IncreaseCoin(int Coin);
        Task<int> DecreaseCoin(int Coin);
        Task<int> GetTotalCoin();
        Task<int> GetDWMCount();
        Task<bool> UpdateLastSeenDateTime();
        Task<bool> UpdateLastSeenDateTimeToNow();
    }
}
