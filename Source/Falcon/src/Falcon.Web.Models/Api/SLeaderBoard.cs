using System.Runtime.Serialization;


namespace Falcon.Web.Models.Api
{
    public class SLeaderBoard
    {
        public int UserID { get; set; }
        public int Rank { get; set; }
        public string UserName { get; set; }
        public int Score { get; set; }
        public int LevelNumber { get; set; }
        public string UserAvatarUrl { get; set; }
    }
}
