using Falcon.Common;
using Falcon.Common.Security;
using Falcon.EFCommonContext;

namespace Falcon.Database.SqlServer.QueryProcessors
{
    public class CreatedQuestionsQueryProcessor /*: ICreatedQuestionsQueryProcessor*/
    {
        private readonly IDbContext mDb;
        private readonly IDateTime mDateTime;
        private readonly IUserSession mUserSession;

        public CreatedQuestionsQueryProcessor(IDbContext Database , IDateTime DateTime , IUserSession UserSession)
        {
            mDb = Database;
            mDateTime = DateTime;
            mUserSession = UserSession;
        }
        //public async Task<QueryResult<SNewCreatedQuestions>> GetCreatedQuestions(PagedDataRequest requestInfo, int UserID)
        //{

        //    var manu = mDb.Set<Manufacture>();
        //    var createdQuestion = mDb.Set<CreatedQuestion>();
        //    var now = mDateTime.Now;
        //    //TODO : refactor this 
        //    var query = manu.AsNoTracking()
        //        .Where(u => u.UserID == UserID)
        //        .Include(c => c.Question)
        //        .Select(u => u.Question)
        //        .Where(u => u.Banned == false && u.RemovedByCreator == false)
        //        .Include(u => u.Category.Name)
        //        .Select(u => new SNewCreatedQuestions
        //        {
        //            ID = u.ID,
        //            What_if = u.What_if,
        //            But = u.But,
        //            Category_ID = u.Catgory_ID,
        //            Category_Name = u.Category.Name,
        //            Yes_Count = u.Yes_Count,
        //            No_Count = u.No_Count,
        //            Dislike_Count = u.Dislike_Count,
        //            VerifyState = (int)CreatedQuestionState.CreatedQuestionsVerified,
        //            RegisterDateTime = u.CreatedDate,
        //            ServerTime = now,
        //            CommentCount = u.CommentCount,
        //            Locked = true,
        //            RejectMessage = string.Empty
        //        })
        //        .Union(createdQuestion.AsNoTracking().Where(cq => cq.UserID == UserID && (
        //                cq.VerifyStateID == (int)CreatedQuestionState.CreatedQuestionIsInChecking ||
        //                cq.VerifyStateID == (int)CreatedQuestionState.CreatedQuestionRejected
        //            )).Include(cq => cq.Category.Name)
        //            .Include(cq => cq.CreatedQuestionsRejectType)
        //            .Select(cq => new SNewCreatedQuestions
        //            {
        //                ID = cq.ID,
        //                What_if = cq.What_if,
        //                But = cq.But,
        //                Category_ID = cq.CategoryID ?? -1 ,
        //                Category_Name = cq.Category.Name,
        //                Yes_Count = 0 ,
        //                No_Count = 0 ,
        //                Dislike_Count = 0 ,
        //                VerifyState = cq.VerifyStateID,
        //                RegisterDateTime = cq.RegisterDateTime,
        //                ServerTime = now,
        //                CommentCount = 0,
        //                Locked = cq.Lock,
        //                RejectMessage = cq.CreatedQuestionsRejectType.Message
        //            }));



        //    var totalItemCount = await query.CountAsync();

        //    var startIndex = ResultPagingUtility.CalculateStartIndex(requestInfo.PageNumber, requestInfo.PageSize);

        //    var createdQuestions = await query.OrderBy(x => x.RegisterDateTime).Skip(startIndex).Take(requestInfo.PageSize).ToListAsync();

        //    var queryResult = new QueryResult<SNewCreatedQuestions>(createdQuestions, totalItemCount, requestInfo.PageSize);

        //    return queryResult;
        //}

        //public async Task<bool> Delete(int QuestionID)
        //{

        //    var item = await mDb.Set<CreatedQuestion>().Where(sq => sq.ID ==  QuestionID).SingleOrDefaultAsync();

        //    if(item != null)
        //    {
        //        mDb.Set<CreatedQuestion>().Remove(item);
        //        await mDb.SaveChangesAsync();

        //        return true;
        //    }

        //    return false;
        //}

        //public async Task<bool> Edit(EditInfo Info)
        //{
        //    var item = await mDb.Set<CreatedQuestion>().FindAsync(Info.ID);
        //    if (item != null)
        //    {
        //        item.What_if = Info.What;
        //        item.But = Info.But;

        //        await mDb.SaveChangesAsync();
        //        return true;
        //    }
        //    return false;
        //}

        //public async Task<bool> IsDeletable(int QuestionID)
        //{
        //    var question = await mDb.Set<CreatedQuestion>()
        //        .AsNoTracking()
        //        .Where(cq => cq.UserID == mUserSession.ID && cq.ID == QuestionID)
        //        .SingleOrDefaultAsync();

        //    if(question != null)
        //    {
        //        if(question.Lock == false && 
        //            (question.VerifyStateID == (int)CreatedQuestionState.CreatedQuestionIsInChecking 
        //            || question.VerifyStateID == (int)CreatedQuestionState.CreatedQuestionRejected ))

        //        return true;
        //    }

        //    return false;
        //}
        //public async Task<bool> IsEditable(int QuestionID)
        //{
        //    var question = await mDb.Set<CreatedQuestion>()
        //        .AsNoTracking()
        //        .Where(cq => cq.UserID == mUserSession.ID && cq.ID == QuestionID)
        //        .SingleOrDefaultAsync();
        //    if(question != null)
        //    {
        //        if (question.Lock == false && (question.VerifyStateID == (int)CreatedQuestionState.CreatedQuestionIsInChecking))
        //            return true;
        //    }
        //    return false;
        //}
    }
}
