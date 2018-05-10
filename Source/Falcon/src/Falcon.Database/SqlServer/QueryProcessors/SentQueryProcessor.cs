using Falcon.Common;
using Falcon.Common.Security;
using Falcon.Data;
using Falcon.Data.QueryProcessors;
using Falcon.EFCommonContext;
using Falcon.EFCommonContext.DbModel;
using Falcon.Web.Models.Api.Friend;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;

namespace Falcon.Database.SqlServer.QueryProcessors
{
    public class SentQueryProcessor : ISentQueryProcessor
    {
        private readonly IDbContext mDb;
        private readonly IDateTime mDateTime;
        private readonly IUserSession mUserSession;

        public SentQueryProcessor(IDbContext Database , IDateTime DateTime , IUserSession UserSession)
        {
            mDateTime = DateTime;
            mDb = Database;
            mUserSession = UserSession;
        }

        public async Task<int> SaveMessage(int UserID, int QuestionID)
        {
            var item = mDb.Set<Sent>().Add(new Sent
            {
                UserID = UserID,
                QuestionID = QuestionID,
                CreatedDate = mDateTime.Now,
                UpdatedDate = mDateTime.Now,
            });

            await mDb.SaveChangesAsync();

            return item.GroupID;
        }

        public async Task<bool> SaveMessageGroup(int GroupID ,int SenderID, int QuestionID, int[] ReceiverID)
        {
            var sentGroups = new SentGroup[ReceiverID.Length];
            for (int i = 0; i < sentGroups.Length; ++i)
            {
                sentGroups[i] = new SentGroup
                {
                    GroupID = GroupID,
                    SenderID = SenderID , 
                    QuestionID = QuestionID,
                    RecieverID = ReceiverID[i],
                    CreatedDate = mDateTime.Now,
                    UpdatedDate = mDateTime.Now
                };
            }

            mDb.Set<SentGroup>().AddRange(sentGroups);

            await mDb.SaveChangesAsync();

            return true;
        }

        public async Task<QueryResult<SQuestionWithAnswerState>> GetUserInboxMessages(PagedDataRequest RequestInfo)
        {
            var answers = mDb.Set<Answer>().AsNoTracking().Where(u => u.UserID == mUserSession.ID);

            var questionQuery = mDb.Set<Question>().AsNoTracking();

            var sentGroupQuery = mDb.Set<SentGroup>()
                .AsNoTracking()
                .Where(m => m.RecieverID == mUserSession.ID)
                .OrderByDescending( m => m.CreatedDate);                


            var totalItemCount = await sentGroupQuery.CountAsync();

            var startIndex = ResultPagingUtility.CalculateStartIndex(RequestInfo.PageNumber, RequestInfo.PageSize);


            var joinResult = await sentGroupQuery
                .Skip(startIndex)
                .Take(RequestInfo.PageSize)
                .GroupJoin(answers, m => m.QuestionID, s => s.QuestionID, (x, y) => new
                {
                    SentGroup = x,
                    Answer = y
                })
                .SelectMany(temp => temp.Answer.DefaultIfEmpty(), (joinData, Answer) => new
                {
                    NoState = Answer.NoState,
                    YesState = Answer.YesState,
                    Disliked = Answer.Dislike,
                    Liked = Answer.Liked,
                    SenderID = joinData.SentGroup.SenderID,
                    RecieverID = joinData.SentGroup.RecieverID,
                    QuestionID = joinData.SentGroup.QuestionID,
                    UpdatedDate = joinData.SentGroup.UpdatedDate,

                })
                .Join(questionQuery, q => q.QuestionID, u => u.ID, (data, question) => new SQuestionWithAnswerState
                {
                    ID = data.QuestionID,
                    SenderUserID = data.SenderID,
                    What_if = question.What_if,
                    But = question.But,
                    Yes_Count = question.Yes_Count,
                    No_Count = question.No_Count,
                    Like_Count = question.Like_Count,
                    Dislike_Count = question.Dislike_Count,
                    CreatedDate = question.CreatedDate,
                    AnsweredLiked = data.Liked ?? false,
                    AnsweredDisliked = data.Disliked ?? false,
                    AnsweredNo = data.NoState ?? false,
                    AnsweredYes = data.YesState ?? false
                })
                .ToArrayAsync();

            var queryResult = new QueryResult<SQuestionWithAnswerState>(joinResult, totalItemCount, RequestInfo.PageSize);

            return queryResult;

        }

        public async Task<QueryResult<SQuestionWithAnswerState>> GetUserSentMessages(PagedDataRequest RequestInfo)
        {
            var answers = mDb.Set<Answer>().AsNoTracking().Where(u => u.UserID == mUserSession.ID);

            var questionQuery = mDb.Set<Question>().AsNoTracking();

            var sentGroupQuery = mDb.Set<Sent>()
                .AsNoTracking()
                .Where(m => m.UserID == mUserSession.ID)
                .GroupBy(s => s.QuestionID)
                .Select(s => s.FirstOrDefault())
                .OrderByDescending(m => m.CreatedDate);


            var totalItemCount = await sentGroupQuery.CountAsync();

            var startIndex = ResultPagingUtility.CalculateStartIndex(RequestInfo.PageNumber, RequestInfo.PageSize);


            var joinResult = await sentGroupQuery
                .Skip(startIndex)
                .Take(RequestInfo.PageSize)
                .GroupJoin(answers, m => m.QuestionID, s => s.QuestionID, (x, y) => new
                {
                    SentGroup = x,
                    Answer = y
                })
                .SelectMany(temp => temp.Answer.DefaultIfEmpty(), (joinData, Answer) => new
                {
                    NoState = Answer.NoState,
                    YesState = Answer.YesState,
                    Disliked = Answer.Dislike,
                    Liked = Answer.Liked,
                    QuestionID = joinData.SentGroup.QuestionID,
                    UpdatedDate = joinData.SentGroup.UpdatedDate,

                })
                .Join(questionQuery, q => q.QuestionID, u => u.ID, (data, question) => new SQuestionWithAnswerState
                {
                    ID = data.QuestionID,
                    What_if = question.What_if,
                    But = question.But,
                    Yes_Count = question.Yes_Count,
                    No_Count = question.No_Count,
                    Like_Count = question.Like_Count,
                    Dislike_Count = question.Dislike_Count,
                    CreatedDate = data.UpdatedDate,
                    AnsweredLiked = data.Liked ?? false,
                    AnsweredDisliked = data.Disliked ?? false,
                    AnsweredNo = data.NoState ?? false,
                    AnsweredYes = data.YesState ?? false
                })
                .ToArrayAsync();

            var queryResult = new QueryResult<SQuestionWithAnswerState>(joinResult, totalItemCount, RequestInfo.PageSize);

            return queryResult;
        }

        public async Task<List<SQuestionWithAnswerState>> GetUserInboxMessageFromDateUpToNow(DateTime DateTime)
        {
            var answers = mDb.Set<Answer>().AsNoTracking().Where(u => u.UserID == mUserSession.ID);

            var questionQuery = mDb.Set<Question>().AsNoTracking();

            var sentGroupQuery = mDb.Set<SentGroup>()
                .AsNoTracking()
                .Where(m => m.RecieverID == mUserSession.ID && m.CreatedDate >= DateTime)
                .OrderByDescending(m => m.CreatedDate);


            var joinResult = await sentGroupQuery
                .GroupJoin(answers, m => m.QuestionID, s => s.QuestionID, (x, y) => new
                {
                    SentGroup = x,
                    Answer = y
                })
                .SelectMany(temp => temp.Answer.DefaultIfEmpty(), (joinData, Answer) => new
                {
                    NoState = Answer.NoState,
                    YesState = Answer.YesState,
                    Disliked = Answer.Dislike,
                    Liked = Answer.Liked,
                    SenderID = joinData.SentGroup.SenderID,
                    RecieverID = joinData.SentGroup.RecieverID,
                    QuestionID = joinData.SentGroup.QuestionID,
                    UpdatedDate = joinData.SentGroup.UpdatedDate,

                })
                .Join(questionQuery, q => q.QuestionID, u => u.ID, (data, question) => new SQuestionWithAnswerState
                {
                    ID = data.QuestionID,
                    SenderUserID = data.SenderID,
                    What_if = question.What_if,
                    But = question.But,
                    Yes_Count = question.Yes_Count,
                    No_Count = question.No_Count,
                    Like_Count = question.Like_Count,
                    Dislike_Count = question.Dislike_Count,
                    CreatedDate = data.UpdatedDate,
                    AnsweredLiked = data.Liked ?? false,
                    AnsweredDisliked = data.Disliked ?? false,
                    AnsweredNo = data.NoState ?? false,
                    AnsweredYes = data.YesState ?? false
                })
                .ToListAsync();

            return joinResult;
        }

    }
}
