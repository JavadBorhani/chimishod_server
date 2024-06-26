﻿using Falcon.Common.Logging;
using Falcon.Web.Api.InMemory.Public;
using Falcon.Web.Api.Telegram.Public;
using Falcon.Web.Api.Utilities.RestClient.Engine;
using Falcon.Web.Common;
using log4net;
using System;
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
        public TelegramBotClient Api;

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

        public ILog Logger
        {
            get
            {
                return WebContainerManager.Get<ILogManager>().GetLog(typeof(TelegramService));
            }
        }

        private bool ServiceAvailable;

        public TelegramService()
        {
            //Initialize();
            ServiceAvailable = false;   
        }

        public void Initialize()
        {
            Api = new TelegramBotClient(mConfiguration.GetState().Token);

            Api.OnMessage += BotOnMessageReceived;
            Api.OnMessageEdited += BotOnMessageReceived;
            Api.OnCallbackQuery += BotOnCallbackQueryReceived;
            Api.OnReceiveError += BotOnReceiveError;
            Api.OnReceiveGeneralError += BotOnReceiveGeneralError;

            Api.StartReceiving();

            try
            {
                var me = Api.GetMeAsync().Result;
            }
            catch (Exception e)
            {
                var error = "Telegram Service is Unavailable on start up : " + e.StackTrace;
                Logger.Error(error);
            }
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

            HttpParam[] item = new HttpParam[]
            {
                new HttpParam { Key = "Authorization" , Value = "Basic " + mConfiguration.GetState().AuthorizationKey}
            };

            var path = mConfiguration.GetState().ServerCallbackPath + data[1];
            var request = RestClient.CreateRequest(path, RestSharp.Method.POST, null , item);
            var answer  = await RestClient.ExecuteTaskAsync(path, request);

            var items = mConfiguration.GetState().TelegramIDs;            

            for (int i = 0; i < items.Length; ++i)
            {
                try
                {
                    await Api.AnswerCallbackQueryAsync(callbackQuery.Id, $"'{data[0]}' شد داداش!!!");
                    await Api.SendTextMessageAsync( items[i], $"'{data[0]}' شد داش!!! \n Status: {answer.StatusCode}");
                }
                catch { }

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
                        new [] 
                        {
                            InlineKeyboardButton.WithCallbackData("1.1"),
                            InlineKeyboardButton.WithCallbackData("1.2"),
                        },
                        new []
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
            if (!ServiceAvailable)
                return false;
            if (ChatIds == null)
                return false;

            const string ok = "اوکی";
            const string ban = "بن";

            var serverPath = mConfiguration.GetState().ServerCallbackPath;

            var buttonOk = ok + " " + ControllerCallbackPath + "/1"; //TODO : Convert to Json Class

            var buttonBan = ban + " " + ControllerCallbackPath + "/0"; //TODO : Convert to Json Class

            var inlineKeyboard = new InlineKeyboardMarkup(new[]
            {
                new [] // first row
                {
                    InlineKeyboardButton.WithCallbackData(ok, buttonOk),
                    InlineKeyboardButton.WithCallbackData(ban, buttonBan),
                }
            });

            for (int i = 0; i < ChatIds.Length; ++i)
            {   
                try
                {
                    await Api.SendTextMessageAsync( ChatIds[i], Message, replyMarkup: inlineKeyboard);
                }
                catch
                {

                }
            }

            return true;
        }

        public void Dispose()
        {
            Api.OnMessage -= BotOnMessageReceived;
            Api.OnMessageEdited -= BotOnMessageReceived;
            Api.OnCallbackQuery -= BotOnCallbackQueryReceived;
            Api.OnReceiveError -= BotOnReceiveError;
            Api.OnReceiveGeneralError -= BotOnReceiveGeneralError;
            Api.StopReceiving();
        }
    }
}