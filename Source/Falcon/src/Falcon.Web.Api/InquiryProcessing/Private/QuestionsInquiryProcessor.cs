using AutoMapper;
using Falcon.Common.Security;
using Falcon.Data.QueryProcessors;
using Falcon.Web.Api.InquiryProcessing.Public;
using Falcon.Web.Models.Api;
using Falcon.Web.Models.Api.Config;
using System.Linq;
using System.Threading.Tasks;

namespace Falcon.Web.Api.InquiryProcessing.Private
{
    public class QuestionsInquiryProcessor : IQuestionsInquiryProcessor
    {
        private readonly IQuestionsQueryProcessor mQuestionQuery;
        private readonly IGameConfig mGameConfig;
        private readonly IQuestionSelectorQueryProcessor mQuestionSelector;
        private readonly IAnswerInquiryProcessor mAnswerInquiry;
        private readonly IUserSession mUserSession;
        
        public QuestionsInquiryProcessor(
            IQuestionsQueryProcessor QuestionQueryProcessor ,
            IGameConfig GameConfig , 
            IAnswerInquiryProcessor AnswerInquiry, 
            IQuestionSelectorQueryProcessor QuestionSelector,
            IUserSession UserSession
            )
        {
            mQuestionQuery = QuestionQueryProcessor;
            mGameConfig = GameConfig;
            mAnswerInquiry = AnswerInquiry;
            mQuestionSelector = QuestionSelector;
            mUserSession = UserSession;
        }


        public async Task<SQuestion[]> PrepareQuestionList()
        {
            var config = mGameConfig.GetQuestionSelectorConfig(); 

            CalculateConfigAmounts(ref config);

            var userAnsweredIds = await mAnswerInquiry.GetUserAnswerQuestions(mUserSession.ID);

            var funQuestions = await mQuestionSelector.GetFunQuestions(config.FunQuestionsPercent , userAnsweredIds);
            var peopleQuestions = await mQuestionSelector.GetPeopleQuestions(config.PeopleQuestionsPercent , userAnsweredIds);

            var items = funQuestions.Concat(peopleQuestions);
            return null;                
        }
        private void CalculateConfigAmounts(ref SGameConfig Config)
        {
            Config.PeopleQuestionsPercent = (int)(((float)Config.PeopleQuestionsPercent / 100) * Config.TotalNumberOfQuestions);
            Config.FunQuestionsPercent= (int)(((float)Config.FunQuestionsPercent / 100) * Config.TotalNumberOfQuestions);
        }


        

    }
}