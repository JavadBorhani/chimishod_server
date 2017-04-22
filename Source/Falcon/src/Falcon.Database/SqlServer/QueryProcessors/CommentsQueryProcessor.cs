﻿using Falcon.Data.QueryProcessors;
using System.Linq;
using Falcon.Data;
using Falcon.EFCommonContext.DbModel;
using Falcon.EFCommonContext;
using System.Threading.Tasks;
using System.Data.Entity;
using Falcon.Web.Models.Api;

namespace Falcon.Database.SqlServer.QueryProcessors
{
    public class CommentsQueryProcessor : ICommentsQueryProcessor
    {
        private readonly IDbContext mDb;

        public CommentsQueryProcessor(IDbContext Database)
        {
            mDb = Database;
        }
        public async Task<QueryResult<SComment>> GetComments(PagedDataRequest requestInfo , int QuestionID)
        {
            var userAvatar = mDb.Set<SelectedAvatar>();

            var query = mDb.Set<Comment>().AsNoTracking()
                .Where(comment => comment.QuestionID == QuestionID && comment.IsVerified == true)
                .Include(comment => comment.User)
                .Join(userAvatar, m => m.UserID, ua => ua.UserID, (m, ua) => new SComment
                {
                    UserID = m.UserID,
                    UserName = m.User.UserName,
                    Content = m.CommentContent,
                    Response = m.Response,
                    InsertDate = m.InsertDate,
                    QuestionID = m.QuestionID,
                    Avatar = ua.UserAvatar.PicUrl,
                })
                .OrderByDescending(x => x.InsertDate); 

            var totalItemCount = await query.CountAsync();

            var startIndex = ResultPagingUtility.CalculateStartIndex(requestInfo.PageNumber, requestInfo.PageSize);

            var comments = await query.Skip(startIndex).Take(requestInfo.PageSize).ToListAsync();

            var queryResult = new QueryResult<SComment>(comments, totalItemCount, requestInfo.PageSize);

            return queryResult;
        }
    }
}
