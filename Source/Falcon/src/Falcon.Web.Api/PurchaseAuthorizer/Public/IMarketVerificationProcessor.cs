using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using Falcon.Web.Api.PurchaseAuthorizer.Private;

namespace Falcon.Web.Api.PurchaseAuthorizer.Public
{
    public interface IMarketVerificationProcessor
    {
        Task<TokenResponse> AuthorizeWithHandshaking(string MarketTokenVerifierUri, TokenRequest TokenRequest);
        Task<TokenResponse> GetTokenWithRefreshToken(string MarketTokenVerifierUri , RefreshTokenRequest RefreshTokenRequest);
        Task<PurchaseVerificationResponse> VerifyPurchase(PurchaseVerificationRequest PurchaseVerificationRequest , bool IgnoreAccessToken = false);
    }
}