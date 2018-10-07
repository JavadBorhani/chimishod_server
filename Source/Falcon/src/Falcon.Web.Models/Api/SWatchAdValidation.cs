using System.ComponentModel.DataAnnotations;

namespace Falcon.Web.Models.Api
{
    public enum WatchAdProvider
    {
        TapSell  = 1,
        Tapligh  = 2,
        UnityAds = 3,
    };

    public class SWatchAdValidation
    {
        [Required]
        public WatchAdProvider ProviderID { get; set;}

        [Required(AllowEmptyStrings =true)]
        public string WatchAdId { get; set; }
        public bool IsLevel { get; set; }
        public int LevelNumber { get; set; }
    }
}
