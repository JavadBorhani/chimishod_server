using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Falcon.Data.QueryProcessors
{
    public interface IMarketInfoQueryProcessor
    {
        Task<bool> IsExpired(int MarketId);
        Task AddExpireTimeByMiliseconds(int MarketId , int Miliseconds);
        Task SaveNewVerificationData(int MarketId , string AccessToken , string RefreshToken , long expiresIn);
        Task<int> GetMarketIdByMarketKey(int Key);
    }
}
