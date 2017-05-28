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

        public async Task<bool> AchievedUnRepeatableSpinWheel(int ID)
        {
            return await mDb.Set<UnRepeatableAchievedSpinWheel>()
                .AsNoTracking()
                .CountAsync(uas => uas.SpinWheelID == ID) > 0;
        }

        public async Task<List<SpinWheel>> GetAllSpinWheels()
        {
            var result = await mDb.Set<SpinWheel>().AsNoTracking().ToListAsync();
            return result;  
        }

        public async Task<List<SpinWheel>> GetAllSpinWheelsWithoutAchieved()
        {
            var unRepeatableAchieved = mDb.Set<UnRepeatableAchievedSpinWheel>().AsNoTracking();
            var notAchieved = await mDb.Set<SpinWheel>()
                .Include(sw => sw.SpinWheelType)
                .AsNoTracking()
                .Where(sw => !unRepeatableAchieved
                        .Where(ra => ra.SpinWheelID == sw.ID && ra.UserID == mUserSession.ID).Any())
                .OrderBy(sw => sw.Priority)
                .ToListAsync();

            return notAchieved;
        }

        public async Task<SpinWheel> GetByID(int ID)
        {
            return await mDb.Set<SpinWheel>().AsNoTracking().Where(sw => sw.ID == ID).SingleOrDefaultAsync();
        }

        public async Task<bool> IsExists(int ID)
        {
            var exists = await mDb.Set<SpinWheel>().AsNoTracking().CountAsync(sw => sw.ID == ID) > 0;
            return exists;
        }
    }
}
