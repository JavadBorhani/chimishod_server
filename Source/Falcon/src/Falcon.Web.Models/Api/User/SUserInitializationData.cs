using Falcon.Web.Models.Api.Config;
using Falcon.Web.Models.Api.Level;
using Falcon.Web.Models.Api.Quest;

namespace Falcon.Web.Models.Api.User
{
    public class SUserInitializationData
    {
        public SClientAppState ClientAppState { get; set; }
        public SUser User { get; set; }
        public SLevel[] Levels { get; set; }
        public SQuest[] Quests { get; set; }
    }
}
