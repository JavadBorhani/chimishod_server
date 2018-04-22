namespace Falcon.Web.Models.Api.Telegram
{
    public class STelegramConfiguration
    {
        public string Token { get; set; }
        public long[] TelegramIDs { get; set; }
        public string ServerCallbackPath { get; set; }
        public string AuthorizationKey { get; set; }
    }
}
