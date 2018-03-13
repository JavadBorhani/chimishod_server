﻿using Falcon.EFCommonContext.DbModel;
using Falcon.Web.Models.Api;
using Falcon.Web.Models.Api.Friend;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Falcon.Data.QueryProcessors
{
    public enum OrderBy
    {
        None,
        DateTime,
        Weight,
        DateTimeAndWeight,
        CountDateTimeWeight,
        CountDateTimeDescending
    }
    public interface IQuestionsQueryProcessor
    {
        Task<bool> LogicallyRemoveByCreator(int QuestionID);
        Task<bool> IsDeletable(int QuestionID);
        Task<int> GetQuestionReportCount(int QuestionID);
        Task<bool> BanQuestion(int QuestionID);
        Task<Question> CreateQuestion(SCreatedQuestion NewQuestion); 
        Task<Question[]> GetQuestionList(bool IsPublic , int HashtagID, int Amount, OrderBy OrderBy = OrderBy.None,  List<int> Excepts = null);
        Task<QueryResult<SQuestionWithAnswerState>> GetUserPublicQuestions(PagedDataRequest RequestInfo, int UserID);
        Task<QueryResult<SQuestionWithAnswerState>> GetUserMutualQuestions(PagedDataRequest RequestInfo, int UserID);
        Task<Question> GetQuestionByID(int ID);
    }
}
