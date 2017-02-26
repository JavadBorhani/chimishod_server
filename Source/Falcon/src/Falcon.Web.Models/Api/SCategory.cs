// Flapp Copyright 2017-2018

namespace Falcon.Web.Models.Api
{
    public class SCategory
    {
        public int ID { get; set; }
        public string Name { get; set; }
        public string ShortDescription { get; set; }
        public string LongDescription { get; set; }
        public string SquareColor { get; set; }
        public string CircleColor { get; set; }
        public string RectangleColor { get; set; }
        public int Price { get; set; }
        public bool IsActive { get; set; }
        public bool IsPurchased { get; set; }
        public int PrizeCoefficient { get; set; }
    }
}
