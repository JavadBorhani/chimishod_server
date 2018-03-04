using Falcon.Web.Api.InquiryProcessing.Public;
using Falcon.Web.Api.MaintenanceProcessing.Public;
using Falcon.Web.Api.Utilities.Base;
using Falcon.Web.Common;
using Falcon.Web.Models.Api.Quest;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Description;

namespace Falcon.Web.Api.Controllers.V2
{
    [UnitOfWorkActionFilter]
    public class QuestsController : FalconApiController
    {

        private readonly IQuestsInquiryProcessor mQuestInqiury;
        private readonly IQuestsMaintenanceProcessor mQuestMaintenace;

        public QuestsController( IQuestsInquiryProcessor QuestsInquirProcessor , IQuestsMaintenanceProcessor QuestsMaintenanceProcessor )
        {
            mQuestInqiury = QuestsInquirProcessor;
            mQuestMaintenace = QuestsMaintenanceProcessor;
        }


        [ResponseType(typeof(SQuest))]
        [Route("v2/Quests/All")]
        
        public async Task<SQuest[]> GetQuestList()
        {
            var data = await mQuestInqiury.GetQuestList();

            return data;    
        }

        [ResponseType(typeof(SQuest))]
        [Route("v2/Quests/Detail")]
        [HttpPost]
        public async Task<SQuestDetail[]> GetQuestDetail([FromBody] SQuestInquiry Inquiry)
        {
            if (!ModelState.IsValid)
                return null;

            var data = await mQuestInqiury.GetQuestDetail(Inquiry);

            return data;
        }

        [ResponseType(typeof(SQuest))]
        [Route("v2/Quests/Friend")]
        [HttpPost]
        public async Task<SFriendQuestDetail[]> GetFriendQuestDetail([FromBody] SQuestInquiry Inquiry)
        {
            if (!ModelState.IsValid)
                return null;

            var data = await mQuestInqiury.GetFriendQuestDetail(Inquiry);

            return data;
        }

    }
}
