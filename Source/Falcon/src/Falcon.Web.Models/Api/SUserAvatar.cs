

namespace Falcon.Web.Models.Api
{
    public class SUserAvatar
    {
        public int ID { get; set; }
        public string PicUrl { get; set; }
        public int Price { get; set; }
        public bool IsPurchased { get; set; }
        public bool IsActive { get; set; }
        public bool IsNew { get; set; }
        public int DiscountAmount { get; set; }
    }
}
