using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Falcon.Web.Api.JobSystem.Public
{
    public interface IJob
    {
        void BeginTransaction();
        void StartJob();
        void EndTransaction();
    }
}
