// Flapp Copyright 2017-2018


namespace Falcon.Web.Models.Api
{
    public enum HashTagID : int
    {
        Quest = 1 ,
        Fun = 2 ,
        People = 3 ,
    }
    public class SActionQuestion
    {
        public int? ActionCoin { get; set; }
        public int? ActionId { get; set; }
        public int? ActionNavigationPageNumber { get; set; }
        public string MarketPackageName { get; set; }
        public string MarketIntentString { get; set; }
        public string AppStoreUri { get; set; }
    }
    public class SQuestion
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
        public string HashtagTitle { get; set; }
        public HashTagID HashtagID { get; set; }
        public SActionQuestion ActionInfo { get; set; }
    }
    //public int ID { get; set; }
    //public string Name { get; set; }
    //public int ActionNumber { get; set; }
    //public int Coin { get; set; }
    //public int Priority { get; set; }
    //public Nullable<int> ActionNavigationNumber { get; set; }
    //public string MarketPackageName { get; set; }
    //public string MarketIntentString { get; set; }
    //public string AppStoreUri { get; set; }
}
