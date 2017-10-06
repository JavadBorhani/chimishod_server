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
        private readonly IGameConfigInquiryProcessor mGameConfig;
        private readonly IQuestionSelectorQueryProcessor mQuestionSelector;
        private readonly IAnswerInquiryProcessor mAnswerInquiry;
        private readonly IUserSession mUserSession;
        
        public QuestionsInquiryProcessor(
            IQuestionsQueryProcessor QuestionQueryProcessor ,
            IGameConfigInquiryProcessor GameConfig , 
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


        public async Task<SQuestion[]> PrepareQuestionList(int CategoryID)
        {
            var config = (await mGameConfig.GetQuestionSelectorConfig()).Clone() as SQuestionSelectorConfig; // refactor to read from cache 

            CalculateConfigAmounts(ref config);

            var userAnsweredIds = await mAnswerInquiry.GetUserAnswerQuestions(mUserSession.ID);

            // 1- get user created questions
            // 2- get 


            return null;                
        }
        private void CalculateConfigAmounts(ref SQuestionSelectorConfig Config)
        {
            Config.CreatedQuestionsPercent = (int)(((float)Config.CreatedQuestionsPercent / 100) * Config.TotalNumberOfQuestions);
            Config.VerifiedQuestionsPercent = (int)(((float)Config.VerifiedQuestionsPercent / 100) * Config.TotalNumberOfQuestions);
            Config.BoostedQuestionsPercent = (int)(((float)Config.BoostedQuestionsPercent / 100) * Config.TotalNumberOfQuestions);
            Config.ActionBasedQuestionsPercent = (int)(((float)Config.ActionBasedQuestionsPercent / 100) * Config.TotalNumberOfQuestions);
        }


        

    }
}