﻿using Falcon.EFCommonContext.DbModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Falcon.Data.QueryProcessors
{
    public interface IAchievementQueryProcessor
    {
        Task<bool> IsExists(int ID);
        Task<List<Achievement>> GetUserAchievementList(int UserID);
        Task<List<Achievement>> GetAllAchievementList();
    }
}
