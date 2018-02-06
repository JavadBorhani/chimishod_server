﻿using Falcon.Data.QueryProcessors;
using Falcon.Web.Api.Utilities.Base;
using Falcon.Web.Common;
using System.Threading.Tasks;
using System.Web.Http;

namespace Falcon.Web.Api.Controllers.V1
{
    [UnitOfWorkActionFilter]
    public class TestController : FalconApiController
    {
        private readonly IQuestionsQueryProcessor mQuestionsQuery;
        public TestController(IQuestionsQueryProcessor QuestionsQuery)
        {
            mQuestionsQuery = QuestionsQuery;
        }

        [Route("v2/TestController/")]
        [HttpGet]
        public async Task<string> GetInfo()
        {

            

            return null;
        }

    }
}