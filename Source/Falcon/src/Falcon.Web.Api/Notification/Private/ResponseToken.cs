using System.Collections.Generic;

namespace Falcon.Web.Api.Notification.Private
{
    public enum NotificationResponseState
    {
        BadRequest,
        Ok,
        InvalidPlayerIds,
        NoSubsribedPlayers
    }
    public class ResponseToken
    {

        public List<string> InvalidPlayerIds { get; set; }
        public NotificationResponseState NotificationResponose { get; set; }
        public string id { get; set; }
        public int recipients { get; set; }
        public List<string> errors { get; set; }
    }
}