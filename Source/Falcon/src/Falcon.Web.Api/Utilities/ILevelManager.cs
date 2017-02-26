using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Falcon.Web.Api.Controllers.Utility
{
    public interface ILevelManager
    {
        int CurrentLevel { get; set; }
        int LevelMax { get; set; }
    }
}