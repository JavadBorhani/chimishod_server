using Falcon.Web.Api.Utilities;
using Falcon.Web.Api.Utilities.Base;
using Falcon.Web.Common;
using System.Threading.Tasks;
using System.Web.Http;

namespace Falcon.Web.Api.Controllers.V1
{
    [UnitOfWorkActionFilter]
    public class TestController : FalconApiController
    {

        private readonly INetworkUtils mNetworkUtils;


        public TestController(INetworkUtils NetworkUtils)
        {
            mNetworkUtils = NetworkUtils;
        }

        [Route("v2/TestController/")]
        [HttpGet]
        public async Task<string> GetInfo()
        {
            mNetworkUtils.Response = System.Net.HttpStatusCode.Forbidden;
            return "hello";
        }
        //[Route("TestController/")]
        //[HttpPost]
        //public async Task<IHttpActionResult> CreateJob()
        //{
        //    //var data = await mAchievementProcessor.PrepareAchievementList();
        //    //return Ok(data);

        //    int start = 181;
        //    int end = 857;
        //    var manufactureList = new Manufacture[end - start];

        //    for(int i = 0 , k = start ; i < manufactureList.Length; ++i , k++)
        //    {
        //        manufactureList[i] = new Manufacture
        //        {
        //            UserID = 2177,
        //            QuestionID = k,
        //            InsertedDate = mDateTime.Now,
        //        };
        //    }

        //    var manu = mContext.Set<Manufacture>().AddRange(manufactureList);
        //    await mContext.SaveChangesAsync();
        //    return Ok(0);
        //}
    }
}