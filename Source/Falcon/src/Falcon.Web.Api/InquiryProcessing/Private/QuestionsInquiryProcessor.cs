using Falcon.Common.Security;
using Falcon.Data.QueryProcessors;
using Falcon.Web.Api.InquiryProcessing.Public;
using Falcon.Web.Models.Api;
using Falcon.Web.Models.Api.Config;
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
            var config = mGameConfig.GetQuestionSelectorConfig(); // refactor to read from cache 

            CalculateConfigAmounts(ref config);

            var userAnsweredIds = await mAnswerInquiry.GetUserAnswerQuestions(mUserSession.ID);

            // 1- get user created questions
            // 2- get usual questions based on weeks 
            
            // in the end joining with Manufacture and action based questions 

            


            return null;                
        }
        private void CalculateConfigAmounts(ref SGameConfig Config)
        {
            Config.PeopleQuestionsPercent = (int)(((float)Config.PeopleQuestionsPercent / 100) * Config.TotalNumberOfQuestions);
            Config.FunQuestionsPercent= (int)(((float)Config.FunQuestionsPercent / 100) * Config.TotalNumberOfQuestions);
        }


        

    }
}