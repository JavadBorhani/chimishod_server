// Flapp Copyright 2017-2018

using Falcon.Common;
using Falcon.Web.Common;
using Falcon.EFCommonContext;
using Falcon.EFCommonContext.DbModel;
using System.Data.Entity;
using System.Threading.Tasks;
using Falcon.Web.Api.Utilities.Base;

namespace Falcon.Web.Api.Controllers.V1
{
    [UnitOfWorkActionFilter]
    public class UsersController : FalconApiController
    {
        private readonly IDbContext mDb;
        private readonly IDateTime mDateTime;

        public UsersController(IDateTime DateTime , IDbContext Database)
        {
            mDateTime = DateTime;
            mDb = Database;
        }

        private async Task<bool> UserExists(int id)
        {
            
            return await mDb.Set<User>().CountAsync(e => e.ID == id) > 0;
        }
    }
}