using System.Collections.Generic;

namespace Falcon.Web.Api.Notification.Private
{

    public class ResponseToken
    {
        public string id { get; set; }
        public int recipients { get; set; }
        public List<string> errors { get; set; }
    }
}