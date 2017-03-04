using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Falcon.Data;
using System.Net;
using Falcon.Common;
using Falcon.Common.Extentions;
using System.Net.Http;
using Falcon.Common.Logging;
using log4net;

namespace Falcon.Web.Api.InquiryProcessing
{
    public class PagedDataRequestFactory : IPagedDataRequestFactory
    {
        public const int DefaultPageSize = 25;

        public const int MaxPageSize = 50;

        private readonly ILog mLogger;

        public PagedDataRequestFactory(ILogManager logManager)
        {
            mLogger = logManager.GetLog(typeof(PagedDataRequestFactory));
        }

        public PagedDataRequest Create(Uri requestUri)
        {
            int? pageNumber;
            int? pageSize;

            try
            {
                var valueCollection = requestUri.ParseQueryString();

                pageNumber = PrimitiveTypeParser.Parse<int?>(valueCollection[Constants.CommonParameterNames.PageNumber]);
                pageSize = PrimitiveTypeParser.Parse<int?>(valueCollection[Constants.CommonParameterNames.PageSize]);
            }
            catch (Exception e)
            {
                mLogger.Error("Error parsing input", e);
                    throw new HttpException((int)HttpStatusCode.BadRequest, e.Message);
            }

            pageNumber = pageNumber.GetBoundedValue(Constants.Paging.DefaultPageNumber, Constants.Paging.MinPageNumber);
            pageSize = pageSize.GetBoundedValue(DefaultPageSize, Constants.Paging.MinPageSize, MaxPageSize);

            return new PagedDataRequest(pageNumber.Value, pageSize.Value);
        }
        public PagedDataRequest Create(int PageNumber , int PageSize)
        {
            int? pageNumber;
            int? pageSize;

            pageNumber = PageNumber;
            pageSize = PageSize;

            pageNumber = pageNumber.GetBoundedValue(Constants.Paging.DefaultPageNumber, Constants.Paging.MinPageNumber);
            pageSize = pageSize.GetBoundedValue(DefaultPageSize, Constants.Paging.MinPageSize, MaxPageSize);

            return new PagedDataRequest(pageNumber.Value, pageSize.Value);
        }
    }
}