using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Falcon.Web.Models.Api
{
    public class User
    {
        public int ID { get; set; }
        public string UUID { get; set; }
        public string UserName { get; set; }
        public Nullable<int> UserTypeID { get; set; }
        public int TotalStars { get; set; }
        public System.DateTime LastSceneDateTime { get; set; }
        public int LevelAnsweredNumber { get; set; }
        public int CurrentLevelID { get; set; }
        public bool IsAbleToWriteComment { get; set; }
    }
}
