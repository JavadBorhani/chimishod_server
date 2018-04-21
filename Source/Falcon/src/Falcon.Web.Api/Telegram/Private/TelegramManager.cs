using Falcon.Web.Api.InMemory.Public;
using Falcon.Web.Api.Telegram.Public;
using System.Threading.Tasks;

namespace Falcon.Web.Api.Telegram.Private
{
    public class TelegramManager : ITelegramManager
    {
        private readonly ITelegramService mTelgramService;
        private readonly ITelegramConfigurationInMemory mConfiguration;

        public TelegramManager(ITelegramService Service , ITelegramConfigurationInMemory Configuration)
        {
            mTelgramService = Service;
            mConfiguration = Configuration;
        }
        public Task<bool> SendQuestionVerifier(string QuestionID , string Question)
        {

            return Task.FromResult(false);
        }
    }
}