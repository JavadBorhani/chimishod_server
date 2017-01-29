// BMS-Studio Copyright 2017-2018

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Falcon.Data.QueryProcessors
{
    public interface IAchievementQueryProcessor
    {
        List<int> GetAchievableList();
        List<int> GetNotAchievedList();
        List<int> GetAchievedList();
    }
}
