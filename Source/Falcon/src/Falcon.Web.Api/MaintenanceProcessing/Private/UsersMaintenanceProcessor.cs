using Falcon.Data.QueryProcessors;
using Falcon.Web.Api.MaintenanceProcessing.Public;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;

namespace Falcon.Web.Api.MaintenanceProcessing.Private
{
    public class UsersMaintenanceProcessor : IUsersMaintenanceProcessor
    {
        private readonly IUserQueryProcessor mUserQuery;

        public UsersMaintenanceProcessor(IUserQueryProcessor UserQueryProcessor)
        {
            mUserQuery = UserQueryProcessor;
        }

        public async Task<bool> LevelUp()
        {
            throw new NotImplementedException();
        }
    }
}