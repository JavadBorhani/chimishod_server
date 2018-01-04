using Falcon.Web.Models.Api.Config;
using Falcon.Web.Models.Api.Quest;

namespace Falcon.Web.Models.Api.User
{
    public class SUserData
    {
        public SClientAppState ClientAppState { get; set; }
        public SUser User { get; set; }
        public SQuest[] Quest { get; set; }

    }
}
