namespace Falcon.Web.Api.Notification.Private
{
    public class ErrorToken
    {
        public long timestamp { get; set; }
        public string error { get; set; }
        public string exception { get; set; }
        public string message { get; set; }
    }
}