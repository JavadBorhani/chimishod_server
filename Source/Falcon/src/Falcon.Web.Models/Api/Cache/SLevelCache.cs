
namespace Falcon.Web.Models.Api.Cache
{
    //todo : optimize level up to use cache model level up checking : 
    //idea : all level information should be in the memory and be updated based on level changes in database
    public class SLevelCache
    {
        public int LevelNumber { get; set; }
        public int Star { get; set; }
        public int ScoreCeil { get; set; }
    }
}
