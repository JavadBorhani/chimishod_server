using Falcon.Web.Api.InMemory.Public;
using Falcon.Web.Api.Telegram.Public;
using Falcon.Web.Api.Utilities.RestClient.Engine;
using Falcon.Web.Common;
using System.Linq;
using System.Threading.Tasks;
using Telegram.Bot;
using Telegram.Bot.Args;
using Telegram.Bot.Types;
using Telegram.Bot.Types.Enums;
using Telegram.Bot.Types.InlineKeyboardButtons;
using Telegram.Bot.Types.ReplyMarkups;

namespace Falcon.Web.Api.Telegram.Private
{
    public class TelegramService : ITelegramService
    {
        public readonly TelegramBotClient Api;

        
        public ITelegramConfigurationInMemory mConfiguration
        {
            get
            {
                return WebContainerManager.Get<ITelegramConfigurationInMemory>();
            }
        }
        
        public IRestClientEngine RestClient
        {
            get
            {
                return WebContainerManager.Get<IRestClientEngine>();
            }
        }

        public TelegramService()
        {
            Api = new TelegramBotClient(mConfiguration.GetState().Token);

            var me = Api.GetMeAsync().Result;            

            Api.OnMessage += BotOnMessageReceived;
            Api.OnMessageEdited += BotOnMessageReceived;
            Api.OnCallbackQuery += BotOnCallbackQueryReceived;
            Api.OnReceiveError += BotOnReceiveError;
            Api.OnReceiveGeneralError += BotOnReceiveGeneralError;

            Api.StartReceiving();

            //SendMessage(new long[] { 110186174 }, "دوست داشتی ممه بودی؟ اما غذای همه بودی؟" , "/v2/TestController/15").Wait();

        }
        private static void BotOnReceiveError(object sender, ReceiveErrorEventArgs receiveErrorEventArgs)
        {
            System.Console.WriteLine("Received error: {0} — {1}",
                receiveErrorEventArgs.ApiRequestException.ErrorCode,
                receiveErrorEventArgs.ApiRequestException.Message);
        }

        private static void BotOnReceiveGeneralError(object sender, ReceiveGeneralErrorEventArgs ReceiveGeneralErrorEventArgs)
        {
            System.Console.WriteLine("Received error: {0} — {1}",
                ReceiveGeneralErrorEventArgs.Exception.Source,
                ReceiveGeneralErrorEventArgs.Exception.Message);
        }
        private  async void BotOnCallbackQueryReceived(object sender, CallbackQueryEventArgs callbackQueryEventArgs)
        {
            var callbackQuery = callbackQueryEventArgs.CallbackQuery;
            var data = callbackQuery.Data.Split(' ');

            var path = mConfiguration.GetState().ServerCallbackPath;
            HttpParam[] item = new HttpParam[]
            {
                new HttpParam { Key = "Authorization" , Value = "Basic "}
            };
            var request = RestClient.CreateRequest(data[1], RestSharp.Method.POST, null , item);
            var answer  = await RestClient.ExecuteTaskAsync(data[1], request);

            var items = mConfiguration.GetState().TelegramIDs;            

            for (int i = 0; i < items.Length; ++i)
            {
                await Api.AnswerCallbackQueryAsync(
                callbackQuery.Id,
                $"'{data[0]}' شد داداش!!!");

                await Api.SendTextMessageAsync(
                    items[i],
                    $"'{data[0]}' شد داش!!!");
            }
        }


        private async void BotOnMessageReceived(object sender, MessageEventArgs messageEventArgs)
        {
            var message = messageEventArgs.Message;

            if (message == null || message.Type != MessageType.TextMessage) return;

            switch (message.Text.Split(' ').First())
            {
                // send inline keyboard
                case "/inline":

                    await Api.SendChatActionAsync(message.Chat.Id, ChatAction.Typing);                    

                    var inlineKeyboard = new InlineKeyboardMarkup(new[]
                    {
                        new [] // first row
                        {
                            InlineKeyboardButton.WithCallbackData("1.1"),
                            InlineKeyboardButton.WithCallbackData("1.2"),
                        },
                        new [] // second row
                        {
                            InlineKeyboardButton.WithCallbackData("2.1"),
                            InlineKeyboardButton.WithCallbackData("2.2"),
                        }
                    });

                    await Api.SendTextMessageAsync(
                        message.Chat.Id,
                        "Choose",
                        replyMarkup: inlineKeyboard);
                    break;

                // send custom keyboard
                case "/keyboard":

                    KeyboardButton one = new KeyboardButton("1.1");
                    KeyboardButton two = new KeyboardButton("1.2");
                    KeyboardButton three = new KeyboardButton("2.1");
                    KeyboardButton four = new KeyboardButton("2.2");

                    ReplyKeyboardMarkup ReplyKeyboard = new ReplyKeyboardMarkup(new KeyboardButton[][]
                    {
                        new KeyboardButton[] { "1.1", "1.2"},
                        new KeyboardButton[] { "1.3" , "1.4"},
                    });

                    await Api.SendTextMessageAsync(
                        message.Chat.Id,
                        "Choose",
                        replyMarkup: ReplyKeyboard);
                    break;


                default:
                    const string usage = @"
Usage:
/inline   - send inline keyboard
/keyboard - send custom keyboard
/photo    - send a photo
/request  - request location or contact";

                    await Api.SendTextMessageAsync(
                        message.Chat.Id,
                        usage,
                        replyMarkup: new ReplyKeyboardRemove());
                    break;
            }
        }

        public async Task<bool> SendMessage(long[] ChatIds, string Message , string ControllerCallbackPath)
        {
            if (ChatIds == null)
                return false;

            const string ok = "اوکی";
            const string ban = "بن";

            var serverPath = mConfiguration.GetState().ServerCallbackPath;

            var buttonOk = ok + " " + serverPath + ControllerCallbackPath + "/1"; //TODO : Convert to Json Class

            var buttonBan = ban + " " + serverPath + ControllerCallbackPath + "/0"; //TODO : Convert to Json Class

            var inlineKeyboard = new InlineKeyboardMarkup(new[]
            {
                        new [] // first row
                        {
                            InlineKeyboardButton.WithCallbackData(ok, buttonOk),
                            InlineKeyboardButton.WithCallbackData(ban, buttonBan),
                        },
            });

            for (int i = 0; i < ChatIds.Length; ++i)
            {
                await Api.SendTextMessageAsync(
                      ChatIds[i],
                      Message,
                      replyMarkup: inlineKeyboard);
            }

            return true;
        }

        public void Dispose()
        {
            Api.StopReceiving();
        }
    }
}