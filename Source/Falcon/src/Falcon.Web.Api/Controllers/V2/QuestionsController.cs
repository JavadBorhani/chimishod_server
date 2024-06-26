﻿using Falcon.Web.Api.InquiryProcessing.Public;
using Falcon.Web.Api.MaintenanceProcessing.Public;
using Falcon.Web.Api.Utilities.Base;
using Falcon.Web.Common;
using Falcon.Web.Models.Api;
using Falcon.Web.Models.Api.Question;
using System.Collections.Generic;
using System.Net;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Description;

namespace Falcon.Web.Api.Controllers.V2
{
    [UnitOfWorkActionFilter]
    public class QuestionsController : FalconApiController
    {

        private readonly IQuestionsInquiryProcessor mQuestionInquiry;
        private readonly IQuestionsMaintenanceProcessor mQuestionMaintenance;
        private readonly ISentMaintenanceProcessor mSentMaintenance;

        public QuestionsController(
            IQuestionsInquiryProcessor QuestionInquiry, 
            IQuestionsMaintenanceProcessor QuestionMaintenance , 
            ISentMaintenanceProcessor SentMaintenance)
        {
            mQuestionInquiry = QuestionInquiry;
            mQuestionMaintenance = QuestionMaintenance;
            mSentMaintenance = SentMaintenance;
        }

        [Route("v2/Questions")]
        [ResponseType(typeof(List<SQuestion>))]
        [HttpPost]
        public async Task<List<SQuestion>> GetNormalQuestionList()
        {
            var questions = await mQuestionInquiry.PrepareQuestionList();

            return questions;
        }

        [Route("v2/Questions/Create")]
        [ResponseType(typeof(IHttpActionResult))]
        [HttpPost]
        public async Task<IHttpActionResult> CreateQuestion(SCreatedQuestion CreateQuestion)
        {
            if (!ModelState.IsValid)
                return Response(HttpStatusCode.BadRequest, -1);
                
            var totalCoin = await mQuestionMaintenance.CreateQuestion(CreateQuestion);

            return Response(HttpStatusCode.OK , totalCoin);
        }


        [Route("v2/Questions/Forward")]
        [ResponseType(typeof(IHttpActionResult))]
        [HttpPost]
        public async Task<IHttpActionResult> ForwardQuestion(SForwardQuestion CreateQuestion)
        {
            if (!ModelState.IsValid)
                return Response(HttpStatusCode.BadRequest, -1);

            var totalCoin = await mQuestionMaintenance.ForwardQuestionToFriends(CreateQuestion);
        
            return Response(HttpStatusCode.OK, totalCoin);
        }

    }
}
