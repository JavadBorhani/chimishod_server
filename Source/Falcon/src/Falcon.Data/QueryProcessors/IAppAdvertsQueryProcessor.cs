using System.Threading.Tasks;

namespace Falcon.Data.QueryProcessors
{
    public interface IAppAdvertsQueryProcessor
    {
        Task<bool> IsExists(int ID);
        //Task<List<AppAdvertisement>> GetUnexpiredList();
        Task<bool> AddPresentedAdvert(int ID);
    }
}
