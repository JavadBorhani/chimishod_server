using AutoMapper;
using Falcon.Common.Security;
using Falcon.Data.QueryProcessors;
using Falcon.Web.Api.InquiryProcessing.Public;
using Falcon.Web.Models.Api;
using Falcon.Web.Models.Api.Config;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Falcon.Web.Api.InquiryProcessing.Private
{
    public class QuestionsInquiryProcessor : IQuestionsInquiryProcessor
    {
        private readonly IQuestionsQueryProcessor mQuestionQuery;
        private readonly IQuestionSelectorQueryProcessor mQuestionSelector;
        private readonly IAnswerInquiryProcessor mAnswerInquiry;
        private readonly IUserSession mUserSession;
        private SGameConfig mGameConfig;
        
        public QuestionsInquiryProcessor(
            IQuestionsQueryProcessor QuestionQueryProcessor ,
            IGameConfig GameConfig , 
            IAnswerInquiryProcessor AnswerInquiry, 
            IQuestionSelectorQueryProcessor QuestionSelector,
            IUserSession UserSession
            )
        {
            mQuestionQuery = QuestionQueryProcessor;
            mGameConfig = GameConfig.GetQuestionSelectorConfig();
            mAnswerInquiry = AnswerInquiry;
            mQuestionSelector = QuestionSelector;
            mUserSession = UserSession;
        }


        public async Task<List<SQuestion>> PrepareQuestionList()
        {

            var config = CalculateConfigAmounts(mGameConfig);


            var userAnsweredIds = await mAnswerInquiry.GetUserAnswerQuestions(mUserSession.ID);

            var funQuestions = await mQuestionSelector.GetFunQuestions(config.FunQuestionsPercent , userAnsweredIds);

            var peopleQuestions = await mQuestionSelector.GetPeopleQuestions(config.PeopleQuestionsPercent , userAnsweredIds);

            var items = funQuestions.Concat(peopleQuestions);

            return items.ToList();                
        }

        private SGameConfig CalculateConfigAmounts(SGameConfig Config)
        {
            SGameConfig config = new SGameConfig();

            config.PeopleQuestionsPercent = (int)(((float)Config.PeopleQuestionsPercent / 100) * Config.TotalNumberOfQuestions);
            config.FunQuestionsPercent= (int)(((float)Config.FunQuestionsPercent / 100) * Config.TotalNumberOfQuestions);

            return config;
        }


        

    }
}