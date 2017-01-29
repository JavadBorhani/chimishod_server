﻿// BMS-Studio Copyright 2017-2018

using System.Collections.Generic;
using System.Net.Http;
using System.Web.Http.Routing;

namespace Falcon.Web.Common.Routing
{
    public class ApiVersionConstraint : IHttpRouteConstraint
    {
        public string AllowedVersion { get; private set; }

        public ApiVersionConstraint(string allowedVersion)
        {
            AllowedVersion = allowedVersion.ToLowerInvariant();
        }

        public bool Match(HttpRequestMessage request, IHttpRoute route, string parameterName, IDictionary<string, object> values, HttpRouteDirection routeDirection)
        {
            object value;
            if(values.TryGetValue(parameterName , out value) && value != null)
            {
                return AllowedVersion.Equals(value.ToString().ToLowerInvariant());
            }
            return false; 
        }
    }
}
