﻿// Flapp Copyright 2017-2018

using Falcon.Common;
using Falcon.Common.Security;
using Falcon.EFCommonContext;
using Falcon.Web.Api.InquiryProcessing.Public;
using Falcon.Web.Api.MaintenanceProcessing.Public;
using Falcon.Web.Api.Utilities.Base;
using Falcon.Web.Common;

namespace Falcon.Web.Api.Controllers.V1
{
    [UnitOfWorkActionFilter]
    public class CommentsController : FalconApiController
    {
        private readonly IDbContext mDb;
        private readonly IDateTime mDateTime;
        private readonly ICommentsInquiryProcessor mCommentInquiryProcessor;
        private readonly IPagedDataRequestFactory mPagedDataRequestFactory;
        private readonly IWebUserSession mUserSession;
        private readonly IGlobalApplicationState mAppState;



        public CommentsController(IDateTime dateTime,
                                    IDbContext Database,
                                    ICommentsInquiryProcessor CommentsInquiryProcessor,
                                    IPagedDataRequestFactory PagedDataRequestFactory , 
                                    IWebUserSession UserSession , 
                                    IGlobalApplicationState AppState)
        {
            mDateTime = dateTime;
            mDb = Database;
            mCommentInquiryProcessor = CommentsInquiryProcessor;
            mPagedDataRequestFactory = PagedDataRequestFactory;
            mUserSession             = UserSession;
            mAppState = AppState;
        }

        //[Route("Comments/{QuestionID}/{PageNumber}")]
        //[HttpPost]
        //public async Task<PagedDataInquiryResponse<SComment>> GettingComments( int QuestionID , int PageNumber)
        //{
        //    var page = mPagedDataRequestFactory.Create(PageNumber , mAppState.GetState().Paging_DefaultPageSize);
        //    var comments = await mCommentInquiryProcessor.GetComments(page , QuestionID);
        //    return comments;
        //}

        //[ResponseType(typeof(SComment))]
        //[Route("Comments/{QuestionID}")]
        //[HttpPost]
        //public async Task<IHttpActionResult> PostingComment(int QuestionID , [FromBody] SComment NewComment)
        //{
           
        //    if (!ModelState.IsValid)
        //    {
        //        return BadRequest(ModelState);
        //    }

        //    var question = await mDb.Set<Question>().FindAsync(QuestionID);

        //    if(question != null)
        //    {
        //        var comment = new Comment
        //        {
        //           UserID = mUserSession.ID,
        //           QuestionID = question.ID,
        //           CommentContent = NewComment.Content,
        //           Response = Constants.DefaultValues.CommentDefaultReponseMessage,
        //           IsVerified = mAppState.GetState().Comment_DefaultVerifyState,
        //           InsertDate = mDateTime.Now
        //        };

        //        mDb.Set<Comment>().Add(comment);
        //        await mDb.SaveChangesAsync();
        //        return Ok();
        //    }
        //    else
        //    {
        //        return NotFound();
        //    }
        //}
    }
}