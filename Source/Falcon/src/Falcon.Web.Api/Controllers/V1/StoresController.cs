// Flapp Copyright 2017-2018

using System.Collections.Generic;
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
using Falcon.Web.Common;
using Falcon.EFCommonContext;
using Falcon.Web.Api.Utilities.Base;
using Falcon.Web.Api.MaintenanceProcessing.Public;
using System.Net.Http;

namespace Falcon.Web.Api.Controllers.V1
{
    [UnitOfWorkActionFilter]
    public class StoresController : FalconApiController
    {
        private readonly IDbContext mDb;
        private readonly IMapper mMapper;
        private readonly IDateTime mDateTime;
        private readonly IGlobalApplicationState mAppState;
        private readonly IStoresMaintenanceProcessor mStoreMaintenanceProcessor;

        public StoresController(IMapper Mapper , 
            IDateTime DateTime, 
            IDbContext Database , 
            IGlobalApplicationState AppState, 
            IStoresMaintenanceProcessor StoresMaintenanceProcessor)
        {
            mMapper = Mapper;
            mDateTime = DateTime;
            mDb = Database;
            mAppState = AppState;
            mStoreMaintenanceProcessor = StoresMaintenanceProcessor;
        }

        [ResponseType(typeof(SStore))]
        [Route("Stores/{StoreID}")]
        [HttpPost]
        public async Task<IHttpActionResult> GetStoreList(int StoreID)
        {
            int storeDefaultReturnAmount = mAppState.State().Store_DefaultReturnAmount;

            var storeList = await mDb.Set<Store>().Take(storeDefaultReturnAmount).ToListAsync();

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
        
        [ResponseType(typeof(SHardCurrencyPurchasedVerification))]
        [HttpPost]
        [Route("Stores/ValidatePurchase")]
        public async Task<SHardCurrencyPurchasedVerification> PurchaseHardCurrency(SHardCurrency HardCurrency)
        {

            if (!ModelState.IsValid || HardCurrency.StoreItemID <= 0)
                return null;
             var result = await mStoreMaintenanceProcessor.VerifyPurchase(HardCurrency);

            return result;
        }

    }
}