using Falcon.Common;
using Falcon.Common.Security;
using Falcon.EFCommonContext;
using Falcon.EFCommonContext.DbModel;
using Falcon.Web.Api.MaintenanceProcessing.Public;
using Falcon.Web.Models.Api;
using System;
using System.Threading.Tasks;

namespace Falcon.Web.Api.MaintenanceProcessing.Private
{
    public class AnswerMaintenanceProcessor : IAnswerMaintenanceProcessor
    {
        private readonly IDbContext mDb;
        private readonly IDateTime mDateTime;
        private readonly IUserSession mUserSession;

        public AnswerMaintenanceProcessor
            (
            IDbContext Database , 
            IDateTime DateTime ,
            IUserSession UserSession
            )
        {
            mDb = Database;
            mDateTime = DateTime;
            mUserSession = UserSession;
        }

        public async Task<bool> Answer(SAnswer Answer)
        {
            throw new NotImplementedException();
        }

        public async Task<bool> SaveAnswer(int QuestionID)
        {

            var answer = new Answer
            {
                IsReported = true,
                QuestionID = QuestionID,
                UserID = mUserSession.ID,
                CreatedDate = mDateTime.Now,
            };

            mDb.Set<Answer>().Add(answer);

            await mDb.SaveChangesAsync();

            return true;
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