// Flapp Copyright 2017-2018
using Falcon.Data;
using System;

namespace Falcon.Web.Api.InquiryProcessing.Public
{
    public interface IPagedDataRequestFactory
    {
        PagedDataRequest Create(Uri requestUri);
        PagedDataRequest Create(int PageNumber, int PageSize);
    }
}
