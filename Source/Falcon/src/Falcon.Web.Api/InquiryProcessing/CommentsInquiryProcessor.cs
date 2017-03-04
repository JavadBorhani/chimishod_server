using System.Collections.Generic;
using System.Linq;
using Falcon.Data;
using Falcon.Web.Models;
using Falcon.Data.QueryProcessors;

using AutoMapper;
using Falcon.Web.Models.Api;

namespace Falcon.Web.Api.InquiryProcessing
{
    using System.Threading.Tasks;
    using PagedTaskDataInquiryResponse = PagedDataInquiryResponse<SComment>;

    public class CommentsInquiryProcessor : ICommentsInquiryProcessor
    {
        
        private readonly ICommentsQueryProcessor mQueryProcessor;
        private readonly IMapper mMapper;

        public CommentsInquiryProcessor(ICommentsQueryProcessor queryProcessor , IMapper Mapper)
        {
            mQueryProcessor = queryProcessor;
            mMapper = Mapper;
        }
        public async Task<PagedDataInquiryResponse<SComment>> GetComments(PagedDataRequest requestInfo)
        {
            //if (user != null)
            //{
            //    
            //    var result = await mDb.Set<Comment>().AsNoTracking()
            //                            .Where(comment => comment.QuestionID == QuestionID && comment.IsVerified == true)
            //                            .Take(Constants.DefaultReturnAmounts.Comment).ToArrayAsync();

            //    if (result.Length > 0)
            //    {
            //        Models.Api.SComment[] commentList = new Models.Api.SComment[result.Length];

            //        for (int i = 0; i < commentList.Length; ++i)
            //        {
            //            commentList[i] = new Models.Api.SComment
            //            {
            //                UserName = result[i].User.UserName,
            //                Content = result[i].CommentContent,
            //                Response = result[i].Response,
            //                InsertDate = result[i].InsertDate
            //            };
            //        }
            //        return Ok(commentList);
            //    }
            //    return Ok();
            //}
            //return NotFound();



            //TODO : change logic of this 
            var queryResult = mQueryProcessor.GetComments(requestInfo);

            var comments = queryResult.QueriedItems.ToList();

            var outputComments = mMapper.Map<List<SComment>>(comments);

            var inquiryResponse = new PagedTaskDataInquiryResponse
            {
                Items = outputComments,
                PageCount = queryResult.TotalPageCount,
                PageNumber = requestInfo.PageNumber,
                PageSize = requestInfo.PageSize
            };

            return inquiryResponse;

        }
    }
}