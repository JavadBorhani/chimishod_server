using AutoMapper;
using Falcon.Common;
using Falcon.Data.QueryProcessors;
using Falcon.EFCommonContext;
using Falcon.Web.Models.Api;
using System.Threading.Tasks;

namespace Falcon.Database.SqlServer.QueryProcessors
{
    public class QuestionSelectorQueryProcessor : IQuestionSelectorQueryProcessor
    {

        private readonly IDateTime mDateTime;
        private readonly IQuestionsQueryProcessor mQuestionQuery;
        private readonly IMapper mMapper;

        public QuestionSelectorQueryProcessor(IDateTime DateTime , IDbContext Database , IQuestionsQueryProcessor QuestionQuery , IMapper Mapper)
        {
            mDateTime = DateTime;
            mQuestionQuery = QuestionQuery;
            mMapper = Mapper;
        }

        public async Task<SQuestion[]> GetFunQuestions(int Amount, int[] Answered)
        {
            var questions = await mQuestionQuery.GetQuestionList(true , (int)HashTagID.Fun ,Amount ,OrderBy.CountDateTimeAscending ,  Answered);

            return mMapper.Map<SQuestion[]>(questions);
        }

        public async Task<SQuestion[]> GetPeopleQuestions(int Amount, int[] Answered)
        {
            var questions = await mQuestionQuery.GetQuestionList(true , (int)HashTagID.People , Amount, OrderBy.CountDateTimeAscending, Answered);

            return mMapper.Map<SQuestion[]>(questions);
        }
    }
}
