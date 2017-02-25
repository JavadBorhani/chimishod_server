// Flapp Copyright 2017-2018

using System;
using System.Collections.Generic;

namespace Falcon.Database.SqlServer.QueryProcessors
{
    using Common;
    using Common.Security;
    using Data.QueryProcessors;
    using EFCommonContext;

    public class AchievementQueryProcessor : IAchievementQueryProcessor
    {
        private readonly IDbContext mContext;
        private readonly IUserSession mUserSession;
        private readonly IDateTime mDateTime;

        public AchievementQueryProcessor(IDbContext Context, IUserSession UserSession, IDateTime DateTime)
        {
            if (Context != null && UserSession != null && DateTime != null)
            {
                mContext        = Context;
                mUserSession    = UserSession;
                mDateTime       = DateTime;
            }
        }

        public List<int> GetAchievableList()
        {
            throw new NotImplementedException();
        }

        public List<int> GetNotAchievedList()
        {
            throw new NotImplementedException();
        }

        public List<int> GetAchievedList()
        {
            throw new NotImplementedException();
        }
    }
}
