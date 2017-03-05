// Flapp Copyright 2017-2018

using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Description;
using Falcon.EFCommonContext.DbModel;
using AutoMapper;
using Falcon.Web.Models.Api;
using Falcon.Web.Common;
using Falcon.EFCommonContext;
using Falcon.Web.Api.Utilities.Base;

namespace Falcon.Web.Api.Controllers.V1
{
    [UnitOfWorkActionFilter]
    public class QuestionBoostsController : FalconApiController
    {
        private readonly IDbContext mDb;
        private readonly IMapper mMapper;

        public QuestionBoostsController(IMapper Mapper, IDbContext Database)
        {
            mMapper = Mapper;
            mDb = Database; 
        }
       
        [ResponseType(typeof(SQuestionBoost))]
        [Route("QuestionBoosts/{UUID}")]
        [HttpPost]
        public async Task<IHttpActionResult> GetQuestionBoostList(string UUID)
        {
            var user = await mDb.Set<User>().Where(u => u.UUID == UUID).Select( u => u.ID).SingleOrDefaultAsync();

            if(user != 0)
            {
                var dbBoostList = await mDb.Set<QuestionBoost>().ToListAsync();

                if(dbBoostList.Count > 0 )
                {
                    var clientBoostLists = mMapper.Map<List<QuestionBoost>, List<SQuestionBoost>>(dbBoostList);
                    return Ok(clientBoostLists);
                }
                return Response(HttpStatusCode.NoContent);
            }
            else
            {
                return Response(HttpStatusCode.Unauthorized);
            }
        }


    }
}