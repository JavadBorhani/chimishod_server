using Falcon.Common.Security;
using Falcon.Data.QueryProcessors;
using Falcon.Web.Api.MaintenanceProcessing.Public;
using Falcon.Web.Models.Api;
using Falcon.Web.Models.Api.Answer;
using Falcon.Web.Models.Api.Config;
using System.Threading.Tasks;

namespace Falcon.Web.Api.MaintenanceProcessing.Private
{
    public class AnswerMaintenanceProcessor : IAnswerMaintenanceProcessor
    {
        private readonly IUserSession mUserSession;
        private readonly IAnswerQueryProcessor mAnswerQuery;
        private readonly IQuestionsQueryProcessor mQuestionQuery;
        private readonly IUsersMaintenanceProcessor mUserMaintenance;
        private readonly IUserQueryProcessor mUserQuery;
        private readonly SClientAppState mClientAppState;
        private readonly IUserQuestAnswerQueryProcessor mUserQuestAnswer;
        private readonly IQuestsMaintenanceProcessor mQuestsMaintenance;

        public AnswerMaintenanceProcessor
            (
            IUserSession UserSession,
            IAnswerQueryProcessor AnswerQuery ,
            IQuestionsQueryProcessor QuestionQuery,
            IUsersMaintenanceProcessor UserMaintenance,
            IUserQueryProcessor UserQuery,
            IClientApplicationState ClientAppState,
            IUserQuestAnswerQueryProcessor UserQuestAnswer,
            IQuestsMaintenanceProcessor QuestsMaintenance
            )
        {
            mUserSession = UserSession;
            mAnswerQuery = AnswerQuery;
            mQuestionQuery = QuestionQuery;
            mUserMaintenance = UserMaintenance;
            mUserQuery = UserQuery;
            mClientAppState = ClientAppState.State();
            mUserQuestAnswer = UserQuestAnswer;
            mQuestsMaintenance = QuestsMaintenance;
        }

        public async Task<bool> SaveReportedAnswer(int QuestionID)
        {
            var response = await mAnswerQuery.SaveReportedAnswer(QuestionID);
            return response;
            
        }

        public async Task<bool> SaveYesNoAnswer(SYesNoAnswer Response)
        {
            var result = await mAnswerQuery.SaveYesNoAnswer(Response);
            return result;

        }

        public async Task<bool> SaveLikeDislikeAnswer(SLikeDislikeAnswer Response)
        {
            var result = await mAnswerQuery.SaveLikeDislikeAnswer(Response);
            return result;
        }

        public async Task<bool> SaveAnswer(SAnswer Answer)
        {

            var question = await mQuestionQuery.GetQuestionByID(Answer.QuestionID);

            if(question.IsPublic)
            {
                var stored = await mAnswerQuery.SaveRawAnswer(Answer);

                if (stored != null)
                {

                    if (question.ActionID != null)
                    {
                        var actionCoin = question.QuestionAction?.Coin ?? 0;

                        await mUserQuery.IncreaseCoin(actionCoin);
                    }

                    await mUserMaintenance.LevelUp(mClientAppState.XPLevelFactor);

                    switch ((HashTagID)question.HashTagID)
                    {
                        case HashTagID.Fun:
                        case HashTagID.People:

                            //implement special logic for hashTags 
                        

                            break;

                        case HashTagID.Quest:

                            await mQuestsMaintenance.AddScore(question.ID, Answer.YesNoState);

                            break;
                    }

                    return true;
                }
                
                return false;
            }

            return false;
        }


        //public async Task<bool> Answer(SAnswer Answer) // refactor this to queries
        //{

        //    var questionToUpdate = await mDb.Set<Question>().Where(q => q.ID == Answer.QuestionID).Include(q => q.Category).SingleOrDefaultAsync();

        //    var newAnswer = new Answer
        //    {
        //        QuestionID = Answer.QuestionID,
        //        CategoryID = questionToUpdate.Catgory_ID,
        //        UserID = mUserSession.ID,
        //        YesNoState = Answer.YesNoState,
        //        Liked = Answer.Liked,
        //        Dislike = Answer.Dislike,
        //        CreatedDate = mDateTime.Now
        //    };

        //    mDb.Set<Answer>().Add(newAnswer);
        //    await mDb.SaveChangesAsync();


        //    if (Answer.IsFavorited == true) // means user favourited the current question
        //    {
        //        var coinAmount = await mUserQuery.DecreaseCoin(mAppState.Favorite_FavoritePrice);

        //        if (coinAmount < 0)
        //            throw new BusinessRuleViolationException("not enough coin");  

        //        var newFavorite = new Favorite
        //        {
        //            UserID = mUserSession.ID,
        //            QuestionID = Answer.QuestionID,
        //            SelectedDate = mDateTime.Now
        //        };

        //        mDb.Set<Favorite>().Add(newFavorite);
        //        await mDb.SaveChangesAsync();

        //    }


        //    if (questionToUpdate != null)
        //    {

        //        if (Answer.ChosenCharacters.Length > 0)
        //        {
        //            bool validation = await mCharacteristicsInquiryProcessor.CategoryHasCharacters(questionToUpdate.Catgory_ID, Answer.ChosenCharacters);
        //            if (validation)
        //            {
        //                var designerID = await mDb.Set<Manufacture>()
        //                    .AsNoTracking()
        //                    .Where(m => m.QuestionID == Answer.QuestionID)
        //                    .Select(u => u.UserID)
        //                    .SingleOrDefaultAsync();

        //                await mCharacteristicsMaintenanceProcessor.VoteForUser(designerID, questionToUpdate.ID, Answer.ChosenCharacters);
        //            }
        //        }

        //        if (Answer.YesNoState)
        //        {
        //            if (questionToUpdate.ActionID != null)
        //            {
        //                await mUserQuery.IncreaseCoin(questionToUpdate.QuestionAction.Coin);
        //            }
        //        }

        //        if (Answer.Liked != null)
        //        {
        //            var otherUserID = await mDb.Set<Manufacture>().Where(m => m.QuestionID == Answer.QuestionID)
        //                                                    .Include(m => m.User)
        //                                                    .Select(m => m.User.ID)
        //                                                    .SingleOrDefaultAsync();
        //            if (otherUserID != 0)
        //            {
        //                await mScoringQueryProcessor.AddScore(otherUserID, mAppState.Prize_LikeScoreAmount, AchievedScoreType.Answer);
        //            }
        //        }

        //        await mDb.SaveChangesAsync();
        //    }

        //    int scoreCoefficient = questionToUpdate.Category.ScoreCoefficient;
        //    int xp = mAppState.Prize_AnswerXP;

        //    await mScoringQueryProcessor.AddScore(mUserSession.ID, mAppState.Prize_AnswerScoreAmount * scoreCoefficient, AchievedScoreType.Answer);
        //    await mUsersMaintenance.LevelUp(xp); // will return new total coin or Constants.DefaultValues.NoNewCoin

        //    return true;
        //}
    }
}