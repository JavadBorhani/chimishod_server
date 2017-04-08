using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;

namespace Falcon.Web.Api.Security.Public
{
    public interface IMarketVerificationProcessor
    {
        Task<TokenResponse> GetFirstHandShaking(TokenRequest TokenRequest);
        Task<TokenResponse> GetTokenWithRefreshToken(RefreshTokenRequest RefreshTokenRequest);
        Task<PurchaseVerificationResponse> VerifyPurchase(PurchaseVerificationRequest PurchaseVerificationRequest);
    }
}