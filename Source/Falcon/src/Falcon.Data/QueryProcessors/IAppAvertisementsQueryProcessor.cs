using Falcon.EFCommonContext.DbModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Falcon.Data.QueryProcessors
{
    public interface IAppAvertisementsQueryProcessor
    {
        Task<bool> IsExists(int ID);
        Task<List<AppAdvertisement>> GetUnexpiredList(); 
    }
}
