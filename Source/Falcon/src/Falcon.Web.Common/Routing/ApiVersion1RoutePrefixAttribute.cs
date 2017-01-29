// BMS-Studio Copyright 2017-2018

using System;
using System.Web.Http;

namespace Falcon.Web.Common.Routing
{
    public class ApiVersion1RoutePrefixAttribute : RoutePrefixAttribute
    {
        private const string RouteBase = "api/{apiVersion:ApiVersionConstraint(V1)}";
        private const string PrefixRouteBase = RouteBase + "/";

        public ApiVersion1RoutePrefixAttribute(string routePrefix) 
            : base(String.IsNullOrWhiteSpace(routePrefix) ? RouteBase : PrefixRouteBase + routePrefix) 
        {
            
        }
    }
}
