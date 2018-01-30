using System.Collections.Generic;

namespace Falcon.Web.Api.Notification.Private
{
    public class RequestToken
    {
        public string app_id { get; set; }
        public Dictionary<string, string> contents { get; set; }
        public string[] include_player_ids { get; set; }

    }
}