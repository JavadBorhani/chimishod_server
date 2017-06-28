using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Falcon.Web.Common.Memmory
{
    public enum GlobalVariables { ConcurrencyIssueResolved }
    public interface IMemoryStore
    {
        void SaveState<T>(GlobalVariables Variable , T Data);
        T LoadState<T>(GlobalVariables Variable);
    }
}
