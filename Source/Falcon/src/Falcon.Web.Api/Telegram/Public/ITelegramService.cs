using System;
using System.Threading.Tasks;

namespace Falcon.Web.Api.Telegram.Public
{
    public interface ITelegramService : IDisposable
    {
        Task<bool> SendMessage(long[] ChatIds , string Message , string RequestCallback);
    }
}