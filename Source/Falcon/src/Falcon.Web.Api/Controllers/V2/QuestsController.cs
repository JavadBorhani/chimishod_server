using Falcon.Web.Api.InquiryProcessing.Public;
using Falcon.Web.Api.MaintenanceProcessing.Public;
using Falcon.Web.Api.Utilities.Base;
using Falcon.Web.Models.Api.Quest;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Description;

namespace Falcon.Web.Api.Controllers.V2
{

    public class QuestsController : FalconApiController
    {

        private readonly IQuestsInquiryProcessor mQuestInqiury;
        private readonly IQuestsMaintenanceProcessor mQuestMaintenace;

        public QuestsController(IQuestsInquiryProcessor QuestsInquirProcessor , IQuestsMaintenanceProcessor QuestsMaintenanceProcessor)
        {
            mQuestInqiury = QuestsInquirProcessor;
            mQuestMaintenace = QuestsMaintenanceProcessor;
        }


        [ResponseType(typeof(SQuest))]
        [Route("v2/Quests/Get")]
        public async Task<SQuest[]> GetQuestList()
        {
            var data = await mQuestInqiury.GetQuestList();
            return data;    
        }

    }
}
