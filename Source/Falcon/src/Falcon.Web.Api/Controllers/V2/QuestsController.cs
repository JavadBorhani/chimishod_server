using Falcon.Web.Api.InquiryProcessing.Public;
using Falcon.Web.Api.MaintenanceProcessing.Public;
using Falcon.Web.Api.Utilities.Base;
using Falcon.Web.Common;
using Falcon.Web.Models.Api.Purchase;
using Falcon.Web.Models.Api.Quest;
using Falcon.Web.Models.Api.User;
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
        private readonly IQuestionsInquiryProcessor mQuestionInquiry;

        public QuestsController(
            IQuestsInquiryProcessor QuestsInquirProcessor ,
            IQuestsMaintenanceProcessor QuestsMaintenanceProcessor , 
            IQuestionsInquiryProcessor QuestionInquiry)
        {
            mQuestInqiury = QuestsInquirProcessor;
            mQuestMaintenace = QuestsMaintenanceProcessor;
            mQuestionInquiry = QuestionInquiry;
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

        [ResponseType(typeof(SQuestPurchase))]
        [Route("v2/Quests/Purchase/{QuestNumber}")]
        [HttpPost]
        public async Task<SQuestPurchase> PurchaseQuest(int QuestNumber)
        {
            var purchased = await mQuestMaintenace.PurchaseQuest(QuestNumber);

            if(purchased)
            {
                var questions = await mQuestInqiury.GetQuestQuestions(QuestNumber);

                var response = new SQuestPurchase()
                {
                    Contents = questions,
                    Purchased = purchased
                };

                return response;
            }
            return null;
        }

        [ResponseType(typeof(IHttpActionResult))]
        [Route("v2/Quests/Answer/")]
        [HttpPost]
        public async Task<IHttpActionResult> SendQuestAnswer(SQuestAnswer Answer) 
        {
            if (!ModelState.IsValid)
                return BadRequest();
            
            var response = await mQuestMaintenace.SaveQuestQuestionAnswer(Answer); 

            return Ok(response);
        }

        [ResponseType(typeof(SFinaleQuest))]
        [Route("v2/Quests/Final/")]
        [HttpPost]
        public async Task<SUserFinaleQuestDetailWithDescription> GetFinalQuestScoreWithDescription()
        {

            var response = await mQuestInqiury.GetFinaleQuestDetailWithDescription();

            if(response != null)
            {
                return response;
            }

            return null;    
        }

    }
}
