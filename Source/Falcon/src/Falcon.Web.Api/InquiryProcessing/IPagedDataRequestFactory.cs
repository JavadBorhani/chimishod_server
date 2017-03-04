
using Falcon.Data;
using System;

namespace Falcon.Web.Api.InquiryProcessing
{
    public interface IPagedDataRequestFactory
    {
        PagedDataRequest Create(Uri requestUri);
        PagedDataRequest Create(int PageNumber, int PageSize);
    }
}
