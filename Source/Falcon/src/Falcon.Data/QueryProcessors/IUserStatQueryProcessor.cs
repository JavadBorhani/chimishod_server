using Falcon.Web.Models.Api;
using System.Threading.Tasks;

namespace Falcon.Data.QueryProcessors
{
    public interface IUserStatQueryProcessor
    {
        Task<bool> AddFortune(int Amount);
        //Task<UserStat> GetById(int ID);
        Task<int> GetRemainedFortune();
        Task<QueryResult<SLeaderBoard>> GetLeaderBoard(PagedDataRequest RequestInfo);
        Task<SLeaderBoard> GetUserLeaderBoard();   
    }
}
