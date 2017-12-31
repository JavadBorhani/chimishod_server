using System.Collections.Generic;
using System.Threading.Tasks;

namespace Falcon.Data.QueryProcessors
{
    public interface ISpinWheelQueryProcessor
    {
        Task<bool> IsExists(int ID);
        //Task<List<SpinWheel>> GetAllSpinWheelsWithoutAchieved();
        //Task<List<SpinWheel>> GetAllSpinWheels();
        Task<List<int>> GetAllAchievedUnrepeatableItemIds();
        //Task<SpinWheel> GetByID(int ID);
        Task<bool> AchievedUnRepeatableSpinWheel(int ID);
        Task<bool> AddRepeatableAchievement(int ID);
        Task<bool> AddUnRepeatableAchievement(int ID);

    }
}
