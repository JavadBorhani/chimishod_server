﻿using Falcon.Data.QueryProcessors;
using System.Threading.Tasks;
using Falcon.Data;
using Falcon.EFCommonContext;
using Falcon.EFCommonContext.DbModel;
using System.Linq;
using System.Data.Entity;
using Falcon.Common;
using Falcon.Web.Models.Api;

namespace Falcon.Database.SqlServer.QueryProcessors
{
    public class CreatedQuestionsQueryProcessor : ICreatedQuestionsQueryProcessor
    {
        private readonly IDbContext mDb; 
        public CreatedQuestionsQueryProcessor(IDbContext Database)
        {
            mDb = Database;
        }
        public async Task<QueryResult<SNewCreatedQuestions>> GetCreatedQuestions(PagedDataRequest requestInfo, int UserID)
        {

            var manu = mDb.Set<Manufacture>();
            var createdQuestion = mDb.Set<CreatedQuestion>();

            var query = manu.AsNoTracking()
                .Where(u => u.UserID == UserID)
                .Include( c => c.Question)
                .Select(u => u.Question)
                .Where(u => u.Banned == false)
                .Include( u => u.Category)
                .Select( u => new SNewCreatedQuestions
                {
                    ID = u.ID,
                    What_if = u.What_if,
                    But = u.But,
                    Category_ID = u.Catgory_ID,
                    Category_Name = u.Category.Name,
                    Yes_Count = u.Yes_Count,
                    No_Count = u.No_Count,
                    Dislike_Count = u.Dislike_Count,
                    VerifyState = Constants.DefaultValues.CreatedQuestionsVerified,
                    RegisterDateTime = u.CreatedDate
                })
                .Union(createdQuestion.AsNoTracking().Where(cq => cq.UserID == UserID && (
                        cq.VerifyStateID == Constants.DefaultValues.CreatedQuestionIsInChecking ||
                        cq.VerifyStateID == Constants.DefaultValues.CreatedQuestionRejected
                    )).Include(cq => cq.Category).Select(cq => new SNewCreatedQuestions
                    {
                        ID = cq.ID,
                        What_if = cq.What_if,
                        But = cq.But,
                        Category_ID = cq.CategoryID ?? -1 ,
                        Category_Name = cq.Category.Name,
                        Yes_Count = 0 ,
                        No_Count = 0 ,
                        Dislike_Count = 0 ,
                        VerifyState = cq.VerifyStateID,
                        RegisterDateTime = cq.RegisterDateTime
                    }));



            var totalItemCount = await query.CountAsync();

            var startIndex = ResultPagingUtility.CalculateStartIndex(requestInfo.PageNumber, requestInfo.PageSize);

            var createdQuestions = await query.OrderBy(x => x.ID).Skip(startIndex).Take(requestInfo.PageSize).ToListAsync();

            var queryResult = new QueryResult<SNewCreatedQuestions>(createdQuestions, totalItemCount, requestInfo.PageSize);

            return queryResult;
        }
    }
}
