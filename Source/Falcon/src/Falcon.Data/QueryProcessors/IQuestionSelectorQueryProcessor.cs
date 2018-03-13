using Falcon.Web.Models.Api;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Falcon.Data.QueryProcessors
{
    public interface IQuestionSelectorQueryProcessor
    {
        //Task<SQuestion[]> GetVerifiedQuestions(int Amount);

        //Task<SQuestion[]> GetBoostedQuestions(int Amount);
        //Task<SQuestion[]> GetActionBaseQuestions(int Amount);

        Task<List<SQuestion>> GetFunQuestions(int Amount , List<int> answered);
        Task<List<SQuestion>> GetPeopleCreatedQuestions(int Amount , List<int> answerd);
        Task<List<SQuestion>> GetPeopleHighQualityQuestions(int Amount, List<int> answered);
    }
}
