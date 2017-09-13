

namespace Falcon.Web.Models.Api
{
    public class SUserAvatar
    {
        public int ID { get; set; }
        public string PicUrl { get; set; }
        public int Price { get; set; }
        public string Name { get; set; }
        public bool IsPurchased { get; set; }
        public bool IsActive { get; set; }
        public int TagState { get; set; }
        public int DiscountAmount { get; set; }
    }
}
