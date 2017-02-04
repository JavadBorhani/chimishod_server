﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Description;
using Falcon.EFCommonContext.DbModel;
using Falcon.Common;
using AutoMapper;
using Falcon.Web.Models.Api;
using System.Web.Http.Results;

namespace Falcon.Web.Api.Controllers.V1
{
    public class StoresController : ApiController
    {
        private DbEntity db = new DbEntity();

        private readonly IMapper mMapper;
        private readonly IDateTime mDateTime;

        public StoresController(IMapper Mapper , IDateTime DateTime)
        {
            mMapper = Mapper;
            mDateTime = DateTime;
        }

        [ResponseType(typeof(SStore))]
        [Route("Stores/{UUID}")]
        [HttpPost]
        public async Task<IHttpActionResult> GetStoreList(string UUID)
        {
            var user = await db.Users.AsNoTracking().Where(u => u.UUID == UUID).Select( u => u.ID).SingleOrDefaultAsync();
            if(user != 0)
            {
                var storeList = await db.Stores.Take(20).ToListAsync();
                if (storeList.Count > 0)
                {
                    var clientList = mMapper.Map<List<Store>, List<SStore>>(storeList);
                    return Ok(clientList);
                }
                else
                {
                    return ReturnResponse(HttpStatusCode.NoContent);
                }
            }
            else
            {
                return ReturnResponse(HttpStatusCode.Unauthorized);
            }
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool StoreExists(int id)
        {
            return db.Stores.Count(e => e.ID == id) > 0;
        }

        private ResponseMessageResult ReturnResponse(HttpStatusCode Code)
        {
            return ResponseMessage(Request.CreateResponse(Code));
        }
    }
}