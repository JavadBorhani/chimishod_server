using System;

namespace Falcon.Web.Models.Api
{
    public class SWatchedAd
    {
        public int ID { get; set; }
        public int UserID { get; set; }
        public int? WatchAdProviderId { get; set; }
        public string WatchAdId { get; set; }
        public DateTime InsertDate { get; set; }
    }
}
