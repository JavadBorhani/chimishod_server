using System.Threading.Tasks;

namespace Falcon.Web.Api.Telegram.Public
{
    public interface ITelegramManager
    {
        Task<bool> SendQuestionVerifier(string QuestionID, string Question);
    }
}