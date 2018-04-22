using System.Threading.Tasks;

namespace Falcon.Web.Api.Telegram.Public
{
    public interface ITelegramManager
    {
        Task<bool> SendQuestionVerifier(int QuestionID, string What , string But);
    }
}