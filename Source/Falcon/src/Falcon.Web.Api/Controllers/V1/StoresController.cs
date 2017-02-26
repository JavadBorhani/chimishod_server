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
using Falcon.Common;
using AutoMapper;
using Falcon.Web.Models.Api;
using Falcon.Web.Api.Utilities.Extentions;
using Falcon.Web.Common;
using Falcon.EFCommonContext;

namespace Falcon.Web.Api.Controllers.V1
{
    [UnitOfWorkActionFilter]
    public class StoresController : FalconApiController
    {
        private readonly IDbContext mDb;
        private readonly IMapper mMapper;
        private readonly IDateTime mDateTime;

        public StoresController(IMapper Mapper , IDateTime DateTime, IDbContext Database)
        {
            mMapper = Mapper;
            mDateTime = DateTime;
            mDb = Database; 
        }

        [ResponseType(typeof(SStore))]
        [Route("Stores/{UUID}")]
        [HttpPost]
        public async Task<IHttpActionResult> GetStoreList(string UUID)
        {
            var user = await mDb.Set<User>().AsNoTracking().Where(u => u.UUID == UUID).Select( u => u.ID).SingleOrDefaultAsync();
            if(user != 0)
            {
                var storeList = await mDb.Set<Store>().Take(Constants.DefaultValues.StoreNumberToSend).ToListAsync();

                if (storeList.Count > 0)
                {
                    var clientList = mMapper.Map<List<Store>, List<SStore>>(storeList);
                    return Ok(clientList);
                }
                else
                {
                    return Response(HttpStatusCode.NoContent);
                }
            }
            else
            {
                return Response(HttpStatusCode.Unauthorized);
            }
        }


        private bool StoreExists(int id)
        {
            return mDb.Set<Store>().Count(e => e.ID == id) > 0;
        }

    }
}