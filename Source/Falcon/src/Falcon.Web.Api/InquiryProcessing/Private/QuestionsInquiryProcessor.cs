using Falcon.Common.Security;
using Falcon.Data.QueryProcessors;
using Falcon.Web.Api.InquiryProcessing.Public;
using Falcon.Web.Models.Api;
using Falcon.Web.Models.Api.Config;
using System.Collections.Generic;
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


            var IdsToBeIgnored = await mAnswerInquiry.GetUserAnswerQuestions(mUserSession.ID);

            var funQuestions = await mQuestionSelector.GetFunQuestions(config.FunQuestionsPercent , IdsToBeIgnored);

            MergeList(ref IdsToBeIgnored, ref funQuestions);

            var peopleCreatedQuestions = await mQuestionSelector.GetPeopleCreatedQuestions(config.NewCreatedQuestionsPercent , IdsToBeIgnored);

            MergeList(ref IdsToBeIgnored, ref peopleCreatedQuestions);

            var highQualityQuestions = await mQuestionSelector.GetPeopleHighQualityQuestions(config.HighQualityQuestionsPercent, IdsToBeIgnored);


            var items = new List<SQuestion>();

            items.AddRange(funQuestions);
            items.AddRange(peopleCreatedQuestions);
            items.AddRange(highQualityQuestions);

            return items;                
        }

        private void MergeList(ref List<int> MainList , ref List<SQuestion> newItems)
        {
            for(int i = 0; i < newItems.Count; ++i)
            {
                MainList.Add(newItems[i].ID);
            }
        }

        private SGameConfig CalculateConfigAmounts(SGameConfig Config)
        {
            SGameConfig config = new SGameConfig();

            config.NewCreatedQuestionsPercent = (int)(((float)Config.NewCreatedQuestionsPercent / 100) * Config.TotalNumberOfQuestions);
            config.FunQuestionsPercent = (int)(((float)Config.FunQuestionsPercent / 100) * Config.TotalNumberOfQuestions);
            config.HighQualityQuestionsPercent = (int)(((float)Config.HighQualityQuestionsPercent / 100) * Config.TotalNumberOfQuestions);

            return config;
        }
    }
}