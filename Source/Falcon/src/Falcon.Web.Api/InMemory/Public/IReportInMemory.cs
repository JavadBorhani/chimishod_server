using Falcon.Web.Api.Utilities;
using Falcon.Web.Models.Api;
using System.Collections.Concurrent;

namespace Falcon.Web.Api.InMemory.Public
{
    public interface IReportInMemory : IInMemory<ConcurrentDictionary<int, SReportType>>
    {
        SReportType GetReportByID(int ID);
    }
}
