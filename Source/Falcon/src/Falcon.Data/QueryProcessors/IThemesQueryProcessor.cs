using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Falcon.Data.QueryProcessors
{
    public interface IThemesQueryProcessor
    {
        Task<bool> PurchaseItem(int ID);
        Task<bool> IsPurchased(int ID);
    }
}
