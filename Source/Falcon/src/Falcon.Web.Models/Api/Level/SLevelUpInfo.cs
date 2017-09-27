using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Falcon.Web.Models.Api.Level
{
    public enum LevelUpMode
    {
        NotLeveledUp,
        LeveledUp,
        LeveledUpAndNeedAnother
    }
    public class SLevelUpInfo
    {
        public LevelUpMode LevelUpMode { get; set; }
        public int LevelUpNumber { get; set; }
    }
}
