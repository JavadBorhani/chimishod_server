// Flapp Copyright 2017-2018
using Falcon.Common;
using Falcon.Common.Logging;
using Falcon.Web.Api.Security.Public;
using log4net;
using System;
using System.Net;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Web;

namespace Falcon.Web.Api.Security.Private
{
    public class BasicAuthenticationMessageHandler : DelegatingHandler
    {
        private const char AuthorizationHeaderSeparator = ':';
        private const int ExpectedCredentialCount = 1;
        private const int UUIDIndex = 0; 

        private readonly ILog mLogger;
        private readonly IBasicPrincipalSecurityService mBasicPrincipalSecurityService;

        public BasicAuthenticationMessageHandler(ILogManager LogManager , IBasicPrincipalSecurityService BasicPrincipalSecurityService)
        {
            mLogger = LogManager.GetLog(typeof(BasicAuthenticationMessageHandler));
            mBasicPrincipalSecurityService = BasicPrincipalSecurityService;
        }

       protected override async Task<HttpResponseMessage> SendAsync(HttpRequestMessage request, CancellationToken cancellationToken)
        {
            bool isGranted = IsGranted(request);            

            if(HttpContext.Current.User.Identity.IsAuthenticated)
            {
                return await base.SendAsync(request, cancellationToken);
            }

            if(!CanHandleAuthentication(request) && !isGranted)
            {
                mLogger.Debug("authentication type does not supported");
                //return await base.SendAsync(request, cancellationToken); // let other handlers control the flow 
                return CreateUnauthorizedResponse(); //TODO : Checkout the logic 
            }

            bool isAuthenticated;
            try
            {
                isAuthenticated = Authenticate(request , isGranted);
            }
            catch(Exception e)
            {
                mLogger.Error("Access to Database " + e.Message + "\n Issues : "+ e.ToString());
                return CreateUnauthorizedResponse();
            }
            if(isAuthenticated)
            {
                var response = await base.SendAsync(request, cancellationToken);
                return response;
            }
            return CreateUnauthorizedResponse();
        }

        private bool CanHandleAuthentication(HttpRequestMessage request )
        {
            return (request.Headers != null && 
                request.Headers.Authorization != null && 
                request.Headers.Authorization.Scheme.ToLowerInvariant() == Constants.SchemeTypes.Basic);
        }
        private bool Authenticate(HttpRequestMessage request , bool IsGranted)
        {
            var authHeader = request.Headers.Authorization;
            if(authHeader == null)
            {
                return false;   
            }


            if (!IsGranted)
            {
                var credentialParts = GetCredentialParts(authHeader);

                if (credentialParts.Length != ExpectedCredentialCount)
                {
                    return false;
                }
                return mBasicPrincipalSecurityService.SetPrincipal(credentialParts[UUIDIndex]);
            }
            else
            {
                if(authHeader.Parameter == null)
                {
                    return true;
                }

                var credentialParts = GetCredentialParts(authHeader);

                if (credentialParts.Length != ExpectedCredentialCount)
                {
                    return false;
                }

                return mBasicPrincipalSecurityService.SetRawPrincipal(credentialParts[UUIDIndex]);
            }
        }
        private string[] GetCredentialParts(AuthenticationHeaderValue authValue)
        {
            var encodedCredentials = authValue.Parameter;
            var credentatialBytes = Convert.FromBase64String(encodedCredentials);
            var credentials = Encoding.ASCII.GetString(credentatialBytes);
            var credentialParts = credentials.Split(AuthorizationHeaderSeparator);
            return credentialParts; 
        }

        public HttpResponseMessage CreateUnauthorizedResponse()
        {
            var response = new HttpResponseMessage(HttpStatusCode.Unauthorized);
            response.Headers.WwwAuthenticate.Add(new AuthenticationHeaderValue(Constants.SchemeTypes.Basic));
            return response;
        }

        private bool IsGranted(HttpRequestMessage request)
        {
            //TODO : Implement a better approach 
            var controllerBaseRoute = request.RequestUri.AbsolutePath.Split('/')[2];

            if (controllerBaseRoute == Constants.RoutesToIgnoreAuthentication.UserAuthenticator ||
                controllerBaseRoute == Constants.RoutesToIgnoreAuthentication.UserInfo || 
                controllerBaseRoute == Constants.RoutesToIgnoreAuthentication.AppStates)
                return true;

            return false;   
        }

    }
}