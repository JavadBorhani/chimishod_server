using System.Collections.Generic;

namespace Falcon.Web.Api.Notification.Private
{
    public class Errors
    {
        public List<string> invalid_player_ids { get; set; }
    }
    public class ErrorToken
    {
        public Errors errors { get; set; }
    }
}