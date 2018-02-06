using AutoMapper;
using Falcon.Common.Security;
using Falcon.Data;
using Falcon.Data.QueryProcessors;
using Falcon.Web.Api.InquiryProcessing.Public;
using Falcon.Web.Models.Api;
using Falcon.Web.Models.Api.Config;
using Falcon.Web.Models.Api.Friend;
using System;
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
        private readonly ILevelInquiryProcessor mLevelInquiry;
        private readonly IQuestsInquiryProcessor mQuestInquiry;
        private SGameConfig mGameConfig;
        
        public QuestionsInquiryProcessor(
            IQuestionsQueryProcessor QuestionQueryProcessor ,
            IGameConfig GameConfig , 
            IAnswerInquiryProcessor AnswerInquiry, 
            IQuestionSelectorQueryProcessor QuestionSelector,
            IUserSession UserSession,
            ILevelInquiryProcessor LevelInquiry,
            IQuestsInquiryProcessor QuestInquiry
            )
        {
            mQuestionQuery = QuestionQueryProcessor;
            mGameConfig = GameConfig.GetQuestionSelectorConfig();
            mAnswerInquiry = AnswerInquiry;
            mQuestionSelector = QuestionSelector;
            mUserSession = UserSession;
            mLevelInquiry = LevelInquiry;
            mQuestInquiry = QuestInquiry;
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

        public async Task<SQuestion[]> FetchLevelQuestions(int LevelNumber)
        {
            var questNumber = await mLevelInquiry.GetLevelQuestNumber(LevelNumber);

            if(questNumber != 0 )
            {
                //has quest
                var questions =  await mQuestInquiry.GetQuestQuestions(questNumber);
                return questions;

            }

            return null;

        }

        public Task<QueryResult<SPublicQuestionWithAnswerState>> GetUserPublicQuestions(PagedDataRequest RequestInfo, int UserID)
        {
            throw new NotImplementedException();
        }
    }
}