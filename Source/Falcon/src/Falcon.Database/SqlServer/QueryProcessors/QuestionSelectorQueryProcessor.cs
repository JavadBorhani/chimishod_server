using AutoMapper;
using Falcon.Common;
using Falcon.Data.QueryProcessors;
using Falcon.EFCommonContext;
using Falcon.Web.Models.Api;
using System.Collections.Generic;
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

        public async Task<List<SQuestion>> GetFunQuestions(int Amount, List<int> Answered)
        {
            var questions = await mQuestionQuery.GetQuestionList(true , (int)HashTagID.Fun ,Amount ,OrderBy.WeightDESC ,  Answered);

            return mMapper.Map<List<SQuestion>>(questions);
        }

        public async Task<List<SQuestion>> GetPeopleCreatedQuestions(int Amount, List<int> Answered)
        {
            var questions = await mQuestionQuery.GetQuestionList(true , (int)HashTagID.People , Amount, OrderBy.AnswerCountASCCreatedDateDESC, Answered);

            return mMapper.Map<List<SQuestion>>(questions);
        }

        public async Task<List<SQuestion>> GetPeopleHighQualityQuestions(int Amount , List<int> Answered)
        {
            var questions = await mQuestionQuery.GetQuestionList(true, (int)HashTagID.People, Amount, OrderBy.LikeDESC, Answered);

            return mMapper.Map<List<SQuestion>>(questions);
        }
    }
}
