using Falcon.EFCommonContext.DbModel;
using Falcon.Web.Models.Api;
using Falcon.Web.Models.Api.Answer;
using Falcon.Web.Models.Api.Friend;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Falcon.Data.QueryProcessors
{
    public interface IAnswerQueryProcessor
    {
        Task<List<int>> GetUserAnsweredQuestionIds(int UserID);
        Task<SFriendAnswer[]> GetAnswerOfUsers(int QuestionID , int[] UserIDs , int NumberToTake , bool QuestQuestion = false);
        Task<Answer[]> GetUserAnswers(int[] QuestionIds);
        Task<bool> SaveYesNoAnswer(SYesNoAnswer Response);
        Task<bool> SaveLikeDislikeAnswer(SLikeDislikeAnswer Response);
        Task<Answer> SaveRawAnswer(SAnswer Response); //return stored  answer 
        Task<bool> SaveReportedAnswer(int QuestionID);
        Task<bool> Exists(int QuestionID);
    }
}
