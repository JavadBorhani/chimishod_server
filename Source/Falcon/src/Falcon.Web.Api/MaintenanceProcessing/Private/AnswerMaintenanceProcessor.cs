using Falcon.Common;
using Falcon.Common.Security;
using Falcon.Data.QueryProcessors;
using Falcon.EFCommonContext;
using Falcon.Web.Api.InquiryProcessing.Public;
using Falcon.Web.Api.MaintenanceProcessing.Public;
using Falcon.Web.Models.Api;

namespace Falcon.Web.Api.MaintenanceProcessing.Private
{
    public class AnswerMaintenanceProcessor /*: IAnswerMaintenanceProcessor*/
    {
        private readonly IDbContext mDb;
        private readonly IDateTime mDateTime;
        private readonly SApplicationState mAppState;
        private readonly ICharacteristicsMaintenanceProcessor mCharacteristicsMaintenanceProcessor;
        private readonly ICharacteristicsInquiryProcessor mCharacteristicsInquiryProcessor;
        private readonly IScoringQueryProcessor mScoringQueryProcessor;
        private readonly IUsersMaintenanceProcessor mUsersMaintenance;
        private readonly IUserSession mUserSession;
        private readonly IUserQueryProcessor mUserQuery;

        public AnswerMaintenanceProcessor
            (
            IDbContext Database , 
            IDateTime DateTime , 
            IGlobalApplicationState AppState,
            ICharacteristicsMaintenanceProcessor CharacteristicsMaintenanceProcessor,
            ICharacteristicsInquiryProcessor CharacteristicsInquiryProcessor ,
            IScoringQueryProcessor ScoringQueryProcessor,
            IUsersMaintenanceProcessor UsersMaintenance,
            IUserSession UserSession,
            IUserQueryProcessor UserQuery
            )
        {
            mDb = Database;
            mDateTime = DateTime;
            mAppState = AppState.GetState();
            mCharacteristicsMaintenanceProcessor = CharacteristicsMaintenanceProcessor; 
            mCharacteristicsInquiryProcessor = CharacteristicsInquiryProcessor;
            mScoringQueryProcessor = ScoringQueryProcessor;
            mUsersMaintenance = UsersMaintenance;
            mUserSession = UserSession;
            mUserQuery = UserQuery;
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