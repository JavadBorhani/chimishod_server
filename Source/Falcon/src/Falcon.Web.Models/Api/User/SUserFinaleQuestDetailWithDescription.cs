using Falcon.Web.Models.Api.Barrett;
using Falcon.Web.Models.Api.Quest;
using System.Collections.Generic;

namespace Falcon.Web.Models.Api.User
{
    public class SUserFinaleQuestDetailWithDescription
    {
        public SFinaleQuest FinaleQuestDescription { get; set; }
        public List<SBarrettUserScore> UserBarrettScore { get; set; }
    }
}
