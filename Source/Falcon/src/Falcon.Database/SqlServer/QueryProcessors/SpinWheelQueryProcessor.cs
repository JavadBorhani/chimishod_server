﻿using Falcon.Common.Security;
using Falcon.EFCommonContext;

namespace Falcon.Database.SqlServer.QueryProcessors
{
    public class SpinWheelQueryProcessor /*: ISpinWheelQueryProcessor*/
    {
        private readonly IDbContext mDb;
        private readonly IUserSession mUserSession;
        public SpinWheelQueryProcessor(IDbContext Database , IUserSession UserSession)
        {
            mDb = Database;
            mUserSession = UserSession;
        }

        /*

        public async Task<bool> AchievedUnRepeatableSpinWheel(int ID)
        {
            return await mDb.Set<UnRepeatableAchievedSpinWheel>()
                .AsNoTracking()
                .CountAsync(uas => uas.SpinWheelID == ID && uas.UserID == mUserSession.ID) > 0;
        }

        public async Task<bool> AddRepeatableAchievement(int ID)
        {
            mDb.Set<AchievedSpinWheel>().Add(new AchievedSpinWheel
            {
                SpinWheelID = ID,
                UserID = mUserSession.ID,
            });
            await mDb.SaveChangesAsync();

            return true;
        }

        public async Task<bool> AddUnRepeatableAchievement(int ID)
        {
            mDb.Set<UnRepeatableAchievedSpinWheel>().Add(new UnRepeatableAchievedSpinWheel
            {
                SpinWheelID = ID,
                UserID = mUserSession.ID,
            });
            await mDb.SaveChangesAsync();

            return true;
        }

        public async Task<List<int>> GetAllAchievedUnrepeatableItemIds()
        {
            var result = await mDb.Set<UnRepeatableAchievedSpinWheel>()
                .AsNoTracking()
                .Where(u => u.UserID == mUserSession.ID)
                .Select(u => u.SpinWheelID)
                .ToListAsync();
            return result;
        }

        public async Task<List<SpinWheel>> GetAllSpinWheels()
        {
            var result = await mDb.Set<SpinWheel>()
                .AsNoTracking()
                .OrderBy(sw => sw.Priority)
                .ToListAsync();

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
        */
    }
}
