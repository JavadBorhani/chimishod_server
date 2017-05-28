using Falcon.EFCommonContext.DbModel;
using Falcon.Web.Models.Api;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Falcon.Data.QueryProcessors
{
    public interface ISpinWheelQueryProcessor
    {
        Task<bool> IsExists(int ID);
        Task<List<SpinWheel>> GetAllSpinWheelsWithoutAchieved();
        Task<List<SpinWheel>> GetAllSpinWheels();
        Task<SpinWheel> GetByID(int ID);
    }
}
