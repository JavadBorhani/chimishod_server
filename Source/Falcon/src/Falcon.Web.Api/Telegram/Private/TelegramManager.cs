using Falcon.Web.Api.InMemory.Public;
using Falcon.Web.Api.Telegram.Public;
using Falcon.Web.Models.Api.Telegram;
using System.Threading.Tasks;

namespace Falcon.Web.Api.Telegram.Private
{
    public class TelegramManager : ITelegramManager
    {
        private readonly ITelegramService mTelgramService;
        private readonly STelegramConfiguration mConfiguration;

        public TelegramManager(ITelegramService Service , ITelegramConfigurationInMemory Configuration)
        {
            mTelgramService = Service;
            mConfiguration = Configuration.GetState();
        }

        public async Task<bool> SendQuestionVerifier(int QuestionID , string What , string But)
        {
            var question = "دوست داشتی " + What + "\n" + "اما " + But;

            var requested = await mTelgramService
                .SendMessage(mConfiguration.TelegramIDs, question, "/v2/TelegramController/" + QuestionID);

            return requested;
        }
    }
}