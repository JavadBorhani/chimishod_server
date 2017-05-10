// Flapp Copyright 2017-2018

namespace Falcon.Web.Models.Api
{
    public class SQuestion
    {
        public int ID { get; set; }
        public string UserName { get; set; }
        public string What_if { get; set; }
        public string But { get; set; }
        public int Catgory_ID { get; set; }
        public int Yes_Count { get; set; }
        public int No_Count { get; set; }
        public int Like_Count { get; set; }
        public int Dislike_Count { get; set; }
        public double Weight { get; set; }
        public bool Banned { get; set; }
        public int ActionCoin { get; set; }
        public int? ActionId { get; set; }
    }
}
