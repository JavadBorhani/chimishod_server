using System.Collections.Generic;

namespace Falcon.Web.Api.Notification.Private
{
    public class RequestToken
    {
        public string app_id { get; set; }
        public string[] include_player_ids { get; set; }
        public string[] included_segments { get; set; }
        public string small_icon { get; set; }
        public Dictionary<string, string> contents { get; set; }
        public Dictionary<string, string> headings { get; set; }
        public Dictionary<string, object> data { get; set; }

    }
}