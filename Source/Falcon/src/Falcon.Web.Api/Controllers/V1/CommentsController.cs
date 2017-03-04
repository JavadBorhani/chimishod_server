﻿// Flapp Copyright 2017-2018

using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Description;
using Falcon.Common;
using Falcon.EFCommonContext.DbModel;
using Falcon.Web.Api.Utilities.Extentions;
using Falcon.Web.Common;
using Falcon.EFCommonContext;
using Falcon.Web.Api.InquiryProcessing;
using System.Net.Http;
using Falcon.Web.Models;
using Falcon.Web.Models.Api;

namespace Falcon.Web.Api.Controllers.V1
{
    [UnitOfWorkActionFilter]
    public class CommentsController : FalconApiController
    {
        private readonly IDbContext mDb;
        private readonly IDateTime mDateTime;
        private readonly ICommentsInquiryProcessor mCommentInquiryProcessor;
        private readonly IPagedDataRequestFactory mPagedDataRequestFactory;

        public CommentsController(IDateTime dateTime,
                                    IDbContext Database,
                                    ICommentsInquiryProcessor CommentsInquiryProcessor,
                                    IPagedDataRequestFactory PagedDataRequestFactory)
        {
            mDateTime = dateTime;
            mDb = Database;
            mCommentInquiryProcessor = CommentsInquiryProcessor;
            mPagedDataRequestFactory = PagedDataRequestFactory;
        }

        [Route("Comments/{UUID}/{QuestionID}/{PageNumber}")]
        [HttpPost]
        public async Task<PagedDataInquiryResponse<SComment>> GettingComments(string UUID , int QuestionID , int PageNumber)
        {
            var user = await mDb.Set<User>().SingleOrDefaultAsync(u => u.UUID == UUID);
            if(user != null)
            {
                var page = mPagedDataRequestFactory.Create(PageNumber , Constants.Paging.DefaultPageSize);
                var comments = await mCommentInquiryProcessor.GetComments(page , QuestionID);
                return comments;
            }
            return new PagedDataInquiryResponse<SComment>(); //TODO : remove this and find a solution to return global result
        }

        [ResponseType(typeof(SComment))]
        [Route("Comments/{UUID}/{QuestionID}")]
        [HttpPost]
        public async Task<IHttpActionResult> PostingComment(string UUID , int QuestionID , [FromBody] SComment NewComment)
        {
           
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            var user = await mDb.Set<User>().SingleOrDefaultAsync(u => u.UUID == UUID);
            var question = await mDb.Set<Question>().FindAsync(QuestionID);

            if(user != null && question != null)
            {
                var comment = new Comment
                {
                   UserID = user.ID,
                   QuestionID = question.ID,
                   CommentContent = NewComment.Content,
                   Response = Constants.DefaultValues.CommentDefaultReponseMessage,
                   IsVerified = Constants.DefaultValues.CommentDefaultVerify,
                   InsertDate = mDateTime.Now
                };

                mDb.Set<Comment>().Add(comment);
                await mDb.SaveChangesAsync();
                return Ok();
            }
            else
            {
                return NotFound();
            }
        }
    }
}