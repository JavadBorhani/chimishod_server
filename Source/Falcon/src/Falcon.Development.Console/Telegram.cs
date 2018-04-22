using System;
using System.Linq;
using Telegram.Bot;
using Telegram.Bot.Args;
using Telegram.Bot.Types;
using Telegram.Bot.Types.Enums;
using Telegram.Bot.Types.InlineKeyboardButtons;
using Telegram.Bot.Types.ReplyMarkups;

namespace Falcon.Development.Console
{
    public class Telegram
    {
        private static readonly TelegramBotClient Bot = new TelegramBotClient("532891770:AAFQIFjeQotd5CamnOY5DS77CZelLhmplpc");

        public static void Main(string[] args)
        {
            var me = Bot.GetMeAsync().Result;
            System.Console.Title = me.Username;

            Bot.OnMessage += BotOnMessageReceived;
            Bot.OnMessageEdited += BotOnMessageReceived;
            Bot.OnCallbackQuery += BotOnCallbackQueryReceived;
            //Bot.OnInlineQuery += BotOnInlineQueryReceived;
            Bot.OnInlineResultChosen += BotOnChosenInlineResultReceived;
            Bot.OnReceiveError += BotOnReceiveError;

            Bot.StartReceiving(Array.Empty<UpdateType>());
            System.Console.WriteLine($"Start listening for @{me.Username}");
            System.Console.ReadLine();
            Bot.StopReceiving();
        }

        private static async void BotOnMessageReceived(object sender, MessageEventArgs messageEventArgs)
        {
            var message = messageEventArgs.Message;

            if (message == null || message.Type != MessageType.TextMessage) return;

            switch (message.Text.Split(' ').First())
            {
                // send inline keyboard
                case "/inline":
                    await Bot.SendChatActionAsync(message.Chat.Id, ChatAction.Typing);

                    var inlineKeyboard = new InlineKeyboardMarkup(new[]
                    {
                        new [] // first row
                        {
                            InlineKeyboardButton.WithUrl("1.1" , "http://Chimishod.ir/mine/1/"),
                            InlineKeyboardButton.WithCallbackData("1.2"),
                        }
                    });

                    await Bot.SendTextMessageAsync(
                        message.Chat.Id,
                        "Choose",
                        replyMarkup: inlineKeyboard);
                    break;

                // send custom keyboard
                case "/keyboard":

                    ReplyKeyboardMarkup ReplyKeyboard = new ReplyKeyboardMarkup(new KeyboardButton[][]
                    {
                        new KeyboardButton[] { "1.1", "1.2"},
                        new KeyboardButton[] { "1.3" , "1.4"},
                    });

                    await Bot.SendTextMessageAsync(
                        message.Chat.Id,
                        "Choose",
                        replyMarkup: ReplyKeyboard);
                    break;

                // send a photo
                case "/photo":
                    //await Bot.SendChatActionAsync(message.Chat.Id, ChatAction.UploadPhoto);

                    //const string file = @"Files/tux.png";

                    //var fileName = file.Split(Path.DirectorySeparatorChar).Last();

                    //using (var fileStream = new FileStream(file, FileMode.Open, FileAccess.Read, System.IO.FileShare.Read))
                    //{
                    //    await Bot.SendPhotoAsync(
                    //        message.Chat.Id,
                    //        fileStream,
                    //        "Nice Picture");
                    //}
                    break;

                // request location or contact
                case "/request":
                //var RequestReplyKeyboard = new ReplyKeyboardMarkup(new[]
                //{
                //    KeyboardButton.WithRequestLocation("Location"),
                //    KeyboardButton.WithRequestContact("Contact"),
                //});

                //await Bot.SendTextMessageAsync(
                //    message.Chat.Id,
                //    "Who or Where are you?",
                //    replyMarkup: RequestReplyKeyboard);
                //break;

                default:
                    const string usage = @"
Usage:
/inline   - send inline keyboard
/keyboard - send custom keyboard
/photo    - send a photo
/request  - request location or contact";

                    await Bot.SendTextMessageAsync(
                        message.Chat.Id,
                        usage,
                        replyMarkup: new ReplyKeyboardRemove());
                    break;
            }
        }
        private static async void BotOnCallbackQueryReceived(object sender, CallbackQueryEventArgs callbackQueryEventArgs)
        {
            var callbackQuery = callbackQueryEventArgs.CallbackQuery;

            await Bot.AnswerCallbackQueryAsync(
                callbackQuery.Id,
                $"Received {callbackQuery.Data}");

            await Bot.SendTextMessageAsync(
                callbackQuery.Message.Chat.Id,
                $"Received {callbackQuery.Data}");
        }

        //private static async void BotOnInlineQueryReceived(object sender, InlineQueryEventArgs inlineQueryEventArgs)
        //{
        //    System.Console.WriteLine($"Received inline query from: {inlineQueryEventArgs.InlineQuery.From.Id}");

        //    InlineQueryResultBase[] results = {
        //        new InlineQueryResultLocation(
        //            id: "1",
        //            latitude: 40.7058316f,
        //            longitude: -74.2581888f,
        //            title: "New York")   // displayed result
        //            {
        //                InputMessageContent = new InputLocationMessageContent(
        //                    latitude: 40.7058316f,
        //                    longitude: -74.2581888f)    // message if result is selected
        //            },

        //        new InlineQueryResultLocation(
        //            id: "2",
        //            latitude: 13.1449577f,
        //            longitude: 52.507629f,
        //            title: "Berlin") // displayed result
        //            {

        //                InputMessageContent = new InputLocationMessageContent(
        //                    latitude: 13.1449577f,
        //                    longitude: 52.507629f)   // message if result is selected
        //            }
        //    };

        //    await Bot.AnswerInlineQueryAsync(
        //        inlineQueryEventArgs.InlineQuery.Id,
        //        results,
        //        isPersonal: true,
        //        cacheTime: 0);
        //}

        private static void BotOnChosenInlineResultReceived(object sender, ChosenInlineResultEventArgs chosenInlineResultEventArgs)
        {
            System.Console.WriteLine($"Received inline result: {chosenInlineResultEventArgs.ChosenInlineResult.ResultId}");
        }

        private static void BotOnReceiveError(object sender, ReceiveErrorEventArgs receiveErrorEventArgs)
        {
            System.Console.WriteLine("Received error: {0} — {1}",
                receiveErrorEventArgs.ApiRequestException.ErrorCode,
                receiveErrorEventArgs.ApiRequestException.Message);
        }
    }
}
