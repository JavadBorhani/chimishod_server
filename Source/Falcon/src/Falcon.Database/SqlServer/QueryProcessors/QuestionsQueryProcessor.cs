﻿using Falcon.Common;
using Falcon.Common.Security;
using Falcon.Data;
using Falcon.Data.QueryProcessors;
using Falcon.EFCommonContext;
using Falcon.EFCommonContext.DbModel;
using Falcon.Web.Models.Api;
using Falcon.Web.Models.Api.Friend;
using System;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;

namespace Falcon.Database.SqlServer.QueryProcessors
{

    public class QuestionsQueryProcessor : IQuestionsQueryProcessor
    {
        private IDbContext mDb;
        private IUserSession mUserSession;
        private IDateTime mDateTime;

        public QuestionsQueryProcessor(IDbContext DBContext , IUserSession UserSession , IDateTime DateTime)
        {
            mDb = DBContext;
            mUserSession = UserSession;
            mDateTime = DateTime;
        }

        public async Task<bool> LogicallyRemoveByCreator(int QuestionID)
        {
            var item = await mDb.Set<Question>().FindAsync(QuestionID);
            if (item != null)
            {
                item.RemovedByCreator = true;
                await mDb.SaveChangesAsync();

                return true;
            }

            return false;
        }

        public async Task<bool> IsDeletable(int QuestionID)
        {
            //    var item = await mDb.Set<Manufacture>().AsNoTracking()
            //        .Where(u => u.UserID == mUserSession.ID)
            //        .Include(c => c.Question)
            //        .Select(u => u.Question)
            //        .Where(u => u.ID == QuestionID && u.RemovedByCreator == false)
            //        .SingleOrDefaultAsync();

            //    if(item != null)
            //    {
            //        return true;
            //    }
            //    return false;  
            return false;
        }

        public async Task<Question[]> GetQuestionList()
        {
            throw new NotImplementedException();
        }

        public async Task<Question[]> GetQuestionList(bool IsPublic, int HashtagID, int Amount ,OrderBy OrderBy = OrderBy.None, int[] Excepts = null)
        {
            IQueryable<Question> query = null;

            switch(OrderBy)
            {
                case OrderBy.CountDateTimeAscending:

                    query = mDb.Set<Question>()
                   .AsNoTracking()
                   .Include(q => q.QuestionAction)
                   .Include(q => q.User)
                   .Where(q => q.IsPublic == true && q.HashTagID == HashtagID && !Excepts.Contains(q.ID))
                   .OrderBy(q => q.CreatedDate)
                   .ThenBy(q => q.AnswerCount)
                   .Take(Amount);

                    break;
                case OrderBy.CountDateTimeWeight:
                    break;  
            }


            var data = await query?.ToArrayAsync();
            return data;    
        }

        public async Task<int> GetQuestionReportCount(int QuestionID)
        {
            var reportCount = await mDb.Set<Question>()
                .AsNoTracking()
                .Where(q => q.ID == QuestionID)
                .Select(q => q.ReportCount)
                .SingleOrDefaultAsync();

            return reportCount;
        }

        public async Task<bool> BanQuestion(int QuestionID)
        {
            var question = await mDb.Set<Question>().FindAsync(QuestionID);

            if(question != null)
            {
                question.Banned = true;

                await mDb.SaveChangesAsync();

                return true;
            }

            return false;
        }

        public async Task<Question> CreateQuestion(SCreatedQuestion NewQuestion)
        {
            var newQuestion = mDb.Set<Question>().Add(new Question
            {
                What_if = NewQuestion.What,
                But = NewQuestion.But,
                IsPublic = NewQuestion.IsPublic,
                UserID = mUserSession.ID,
                CreatedDate = mDateTime.Now,
                UpdateDate = mDateTime.Now,
                HashTagID = (int)HashTagID.People
            });

            await mDb.SaveChangesAsync();  

            return newQuestion;
        }

        public async Task<QueryResult<SPublicQuestionWithAnswerState>> GetUserPublicQuestions(PagedDataRequest RequestInfo, int UserID)
        {

            var answerQuery = mDb.Set<Answer>().AsNoTracking().Where(ap => ap.UserID == mUserSession.ID);

            var questionQuery = mDb.Set<Question>()
                .AsNoTracking()
                .Where(q => q.UserID == UserID && q.IsPublic == true && q.Banned == false)
                .OrderBy(q => q.ID);


            var totalItemCount = await questionQuery.CountAsync();

            var startIndex = ResultPagingUtility.CalculateStartIndex(RequestInfo.PageNumber, RequestInfo.PageSize);

            var jointResult = questionQuery
                .Skip(startIndex)
                .Take(RequestInfo.PageSize)
                .GroupJoin(answerQuery, question => question.ID, answer => answer.QuestionID, (Questions, Answers) => new
                {
                    Questions = Questions,
                    Answers = Answers
                }).SelectMany(temp => temp.Answers.DefaultIfEmpty(), (joinData, Answers) => new SPublicQuestionWithAnswerState
                {
                    What_if = joinData.Questions.What_if,
                    But = joinData.Questions.But,
                    Dislike_Count = joinData.Questions.Dislike_Count,
                    ID = joinData.Questions.ID,
                    Like_Count = joinData.Questions.Like_Count,
                    No_Count = joinData.Questions.No_Count,
                    Yes_Count = joinData.Questions.Yes_Count,
                    CreatedDate = joinData.Questions.CreatedDate,
                    AnsweredLiked = Answers.Liked ?? false,
                    AnsweredDisliked = Answers.Dislike ?? false,
                    AnsweredNo = Answers.NoState ?? false,
                    AnsweredYes = Answers.YesState ?? false,
                })
                .OrderBy(s => s.ID);

            var queryResult = new QueryResult<SPublicQuestionWithAnswerState>(jointResult, totalItemCount, RequestInfo.PageSize);

            return queryResult;
        }

        public async Task<QueryResult<SPublicQuestionWithAnswerState>> GetUserMutualQuestions(PagedDataRequest RequestInfo, int UserID)
        {

            var answers = mDb.Set<Answer>().AsNoTracking().Where(u => u.UserID == mUserSession.ID);

            var questionQuery = mDb.Set<Question>().AsNoTracking().Where( s => s.Banned == false);

            var sentGroupQuery = mDb.Set<SentGroup>()
                .AsNoTracking()
                .Where(m =>
               (m.SenderID == mUserSession.ID || m.RecieverID == mUserSession.ID) &&
               (m.SenderID == UserID || m.RecieverID == UserID))
               .GroupBy(m => new { m.SenderID, m.QuestionID })
               .Select(m => m.OrderByDescending( s => s.UpdatedDate).FirstOrDefault());


            var sample = await sentGroupQuery.ToArrayAsync();

            var totalItemCount = await sentGroupQuery.CountAsync();

            var startIndex = ResultPagingUtility.CalculateStartIndex(RequestInfo.PageNumber, RequestInfo.PageSize);


            var joinResult = sentGroupQuery
                .Skip(startIndex)
                .Take(RequestInfo.PageSize)
                .GroupJoin(answers, m => new { UserID = m.RecieverID , QuestionID = m.QuestionID}, s => new { UserID = UserID, QuestionID = s.QuestionID }, (x, y) => new
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
                .Join(questionQuery, q => q.QuestionID, u => u.ID, (data, question) => new SPublicQuestionWithAnswerState
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
                });

            var queryResult = new QueryResult<SPublicQuestionWithAnswerState>(joinResult, totalItemCount, RequestInfo.PageSize);

            return queryResult;

        }
    }
}
