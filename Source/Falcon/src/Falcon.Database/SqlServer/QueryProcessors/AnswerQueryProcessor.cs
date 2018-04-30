using Falcon.Common;
using Falcon.Common.Security;
using Falcon.Data.QueryProcessors;
using Falcon.EFCommonContext;
using Falcon.EFCommonContext.DbModel;
using Falcon.Web.Models.Api;
using Falcon.Web.Models.Api.Answer;
using Falcon.Web.Models.Api.Friend;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;

namespace Falcon.Database.SqlServer.QueryProcessors
{
    public class AnswerQueryProcessor : IAnswerQueryProcessor
    {
        private readonly IDbContext mDb;
        private readonly IUserSession mUserSession;
        private readonly IDateTime mDateTime;
        public AnswerQueryProcessor(IDbContext Database , IUserSession UserSession , IDateTime DateTime)
        {
            mDb = Database;
            mUserSession = UserSession;
            mDateTime = DateTime;
        }
        public async Task<List<int>> GetUserAnsweredQuestionIds(int UserID)
        {
            var data = await mDb.Set<Answer>()
                .AsNoTracking()
                .Where(a => a.UserID == UserID)
                .Select(a => a.QuestionID)
                .ToListAsync();

            return data;
        }

        public async Task<Answer[]> GetUserAnswers(int[] QuestionIds)
        {
            var answers = await mDb.Set<Answer>()
                .AsNoTracking().Where(a => a.UserID == mUserSession.ID && QuestionIds.Contains(a.QuestionID))
                .ToArrayAsync();

            return answers;
        }

        public async Task<bool> SaveYesNoAnswer(SYesNoAnswer Response)
        {
            var answer = mDb.Set<Answer>().Add(new Answer
            {
                UserID = mUserSession.ID,
                QuestionID = Response.QuestionID,
                YesState = Response.IsYes,
                NoState = !Response.IsYes,
                CreatedDate = mDateTime.Now
            });

            await mDb.SaveChangesAsync();

            return true;
           
        }

        public async Task<bool> SaveLikeDislikeAnswer(SLikeDislikeAnswer Response)
        {
            var answer = await mDb.Set<Answer>()
                .Where(a => a.UserID == mUserSession.ID && a.QuestionID == Response.QuestionID)
                .SingleOrDefaultAsync();

            if(answer != null)
            {
                answer.Liked = Response.IsLiked;
                answer.Dislike = !Response.IsLiked;

                await mDb.SaveChangesAsync();
                return true;
            }

            return false;   
        }

        public async Task<SFriendAnswer[]> GetAnswerOfUsers(int QuestionID, int[] UserIDs , int NumberToTake)
        {
            var answer = await mDb.Set<Answer>()
                .Where(a => UserIDs.Contains(a.UserID) && a.QuestionID == QuestionID)
                .Include(a => a.User)
                .Select(a => new SFriendAnswer
                {
                    UserID = a.UserID,
                    UserName = a.User.UserName,
                    QuestionID = a.QuestionID,
                    AnsweredDisliked = a.Dislike ?? false,
                    AnsweredLiked = a.Liked ?? false,
                    AnsweredYes = a.YesState ?? false,
                    AnsweredNo = a.NoState ?? false,
                    PictureUrl = a.User.AvatarImagePath
                })
                .Take(NumberToTake)
                .ToArrayAsync();

            return answer;
        }

        public async Task<Answer> SaveRawAnswer(SAnswer Response)
        {

            var item = new Answer
            {
                QuestionID = Response.QuestionID,
                UserID = mUserSession.ID,
                YesState = Response.YesNoState,
                NoState = !Response.YesNoState,
                Liked = Response.Liked,
                Dislike = Response.Dislike,
                CreatedDate = mDateTime.Now,
            };

            mDb.Set<Answer>().Add(item);

            await mDb.SaveChangesAsync();
            return item;
        }

        public async Task<bool> SaveReportedAnswer(int QuestionID)
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

        public async Task<bool> Exists(int QuestionID)
        {
            var exists = await mDb.Set<Answer>()
                .AsNoTracking()
                .Where(a => a.UserID == mUserSession.ID && a.QuestionID == QuestionID)
                .AnyAsync();

            return exists;   
        }
    }
}
