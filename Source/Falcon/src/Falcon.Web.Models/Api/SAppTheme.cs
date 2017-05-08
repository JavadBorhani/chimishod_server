// Flapp Copyright 2017-2018

namespace Falcon.Web.Models.Api
{
    public class SAppTheme
    {
        public int ID { get; set; }
        public string Name { get; set; }
        public string ShortDescription { get; set; }
        public string LongDescription { get; set; }
        public string SquareColor { get; set; }
        public string CircleColor { get; set; }
        public int Price { get; set; }
        public string BackImage { get; set; }
        public string DialogImage { get; set; }
        public bool IsActive { get; set; }
        public bool IsPurchased { get; set; }
        public int DiscountAmount { get; set; }
        public bool IsNew { get; set;  }
    }
}
