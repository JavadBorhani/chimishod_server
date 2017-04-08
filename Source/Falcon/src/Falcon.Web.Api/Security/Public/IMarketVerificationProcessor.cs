using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;

namespace Falcon.Web.Api.Security.Public
{
    public interface IMarketVerificationProcessor
    {
        Task<TokenResponse> GetFirstHandShaking(string MarketTokenVerifierUri, TokenRequest TokenRequest);
        Task<TokenResponse> GetTokenWithRefreshToken(string MarketTokenVerifierUri , RefreshTokenRequest RefreshTokenRequest);
        Task<PurchaseVerificationResponse> VerifyPurchase(PurchaseVerificationRequest PurchaseVerificationRequest);
    }
}