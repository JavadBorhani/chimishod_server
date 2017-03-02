﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Falcon.Common.Extentions
{
    public static class UriExtensions
    {
        public static Uri GetBaseUri(this Uri originalUri)
        {
            var queryDelimiterIndex = originalUri.AbsoluteUri.IndexOf("?", StringComparison.Ordinal);
            return queryDelimiterIndex < 0
                ? originalUri
                : new Uri(originalUri.AbsoluteUri.Substring(0, queryDelimiterIndex));
        }

        public static string QueryWithoutLeadingQuestionMark(this Uri uri)
        {
            const int indexToSkipQueryDelimiter = 1;
            return uri.Query.Length > 1 ? uri.Query.Substring(indexToSkipQueryDelimiter) : string.Empty;
        }
    }
}
