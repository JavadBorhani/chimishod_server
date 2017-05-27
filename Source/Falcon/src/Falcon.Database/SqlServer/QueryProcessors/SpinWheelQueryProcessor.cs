using Falcon.Data.QueryProcessors;
using Falcon.EFCommonContext;
using Falcon.EFCommonContext.DbModel;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Falcon.Web.Models.Api;
using Falcon.Common.Security;

namespace Falcon.Database.SqlServer.QueryProcessors
{
    public class SpinWheelQueryProcessor : ISpinWheelQueryProcessor
    {
        private readonly IDbContext mDb;
        private readonly IUserSession mUserSession;
        public SpinWheelQueryProcessor(IDbContext Database , IUserSession UserSession)
        {
            mDb = Database;
            mUserSession = UserSession;
        }

        public Task<List<SSpinWheel>> GetAllSpinWheels()
        {
            throw new NotImplementedException();
        }

        public Task<List<SpinWheel>> GetAllSpinWheelsWithoutAchieved()
        {
            var unRepeatableAchieved = mDb.Set<UnRepeatableAchievedSpinWheel>();
            var notAchieved = mDb.Set<SpinWheel>().AsNoTracking()
                .Where(
                sw => !unRepeatableAchieved
                .AsNoTracking()
                .Where(ra => ra.SpinWheelID == sw.ID).Any()).ToListAsync();

            return notAchieved;
        }

        public async Task<bool> IsExists(int ID)
        {
            var exists = await mDb.Set<SpinWheel>().AsNoTracking().CountAsync(sw => sw.ID == ID) > 0;
            return exists;
        }
    }
}
