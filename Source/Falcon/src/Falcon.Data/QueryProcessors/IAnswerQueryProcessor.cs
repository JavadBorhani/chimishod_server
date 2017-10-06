using System.Threading.Tasks;

namespace Falcon.Data.QueryProcessors
{
    public interface IAnswerQueryProcessor
    {
        Task<int[]> GetUserAnsweredIds(int UserID);
    }
}
