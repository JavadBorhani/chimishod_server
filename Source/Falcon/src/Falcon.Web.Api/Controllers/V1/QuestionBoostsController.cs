// Flapp Copyright 2017-2018

using AutoMapper;
using Falcon.Common.Security;
using Falcon.EFCommonContext;
using Falcon.Web.Api.Utilities.Base;
using Falcon.Web.Common;

namespace Falcon.Web.Api.Controllers.V1
{
    [UnitOfWorkActionFilter]
    public class QuestionBoostsController : FalconApiController
    {
        private readonly IDbContext mDb;
        private readonly IMapper mMapper;
        private readonly IWebUserSession mUserSession;

        public QuestionBoostsController(IMapper Mapper, IDbContext Database , IWebUserSession UserSession)
        {
            mMapper = Mapper;
            mDb = Database;
            mUserSession = UserSession;
        }
       
        //[ResponseType(typeof(SQuestionBoost))]
        //[Route("QuestionBoosts/")]
        //[HttpPost]
        //public async Task<IHttpActionResult> GetQuestionBoostList()
        //{
        //    var dbBoostList = await mDb.Set<QuestionBoost>().ToListAsync();

        //    if(dbBoostList.Count > 0 )
        //    {
        //        var clientBoostLists = mMapper.Map<List<QuestionBoost>, List<SQuestionBoost>>(dbBoostList);
        //        return Ok(clientBoostLists);
        //    }
        //    return Response(HttpStatusCode.NoContent);
        //}
    }
}