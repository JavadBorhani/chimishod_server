using Falcon.Web.Api.JobSystem.Public;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Falcon.Web.Api.JobSystem.Private.Jobs
{
    public class QuestionQualification : JobBase
    {
        public override void ActivateMode()
        {
            //TODO: qualify created questions here
        }

        public override string StartJob()
        {
            throw new NotImplementedException();
        }
    }
}