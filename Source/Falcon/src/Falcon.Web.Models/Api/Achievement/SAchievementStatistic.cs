using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Falcon.Web.Models.Api.Achievement
{
    public class SAchievementStatistic
    {
        public int UserID { get; set; }
        public int LevelNumber { get; set; }
        public int Score { get; set; }
        public int PurchasedCategoryCount { get; set; }
        public int PurchasedAvatarCount { get; set; }
        public int CreatedQuestionsCount { get; set; }

        //public int PurchasedThemeCount { get; set; } // ignored till implementing in client 
    }
}
