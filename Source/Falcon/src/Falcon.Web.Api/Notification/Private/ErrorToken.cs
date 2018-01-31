using System.Collections.Generic;

namespace Falcon.Web.Api.Notification.Private
{
    public class Errors
    {
        public List<string> invalid_player_ids { get; set; }
    }
    public class ErrorToken
    {
        public string id { get; set; }
        public int recipients { get; set; }
        public Errors errors { get; set; }
    }
}