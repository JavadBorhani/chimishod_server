namespace Falcon.Web.Models.Api.Notification.Client
{
    public class SInboxQuestion
    {
        public int ID { get; set; }
        public int AuthorID { get; set; }
        public string AuthorUserName { get; set; }
        public string What_if { get; set; }
        public string But { get; set; }
        public int Yes_Count { get; set; }
        public int No_Count { get; set; }
        public int Like_Count { get; set; }
        public int Dislike_Count { get; set; }
    }
}
