using System;
using System.Threading.Tasks;
using Falcon.Data;
using Falcon.Web.Models.Api;
using Falcon.EFCommonContext;
using Falcon.Common.Security;
using Falcon.EFCommonContext.DbModel;
using System.Linq;
using System.Data.Entity;

namespace Falcon.Database.SqlServer.QueryProcessors
{
    public class CodeGiftsQueryProcessor : ICodeGiftsQueryProcessor
    {
        private readonly IDbContext mDb;
        private readonly IWebUserSession mUserSession;

        public CodeGiftsQueryProcessor(IDbContext Database , IWebUserSession UserSession)
        {
            mDb = Database;
            mUserSession = UserSession;
        }
        public async Task<CodeGift> GetCodeGift(int ID)
        {
            var query = await mDb.Set<CodeGift>().AsNoTracking().Where(cg => cg.ID == ID).SingleOrDefaultAsync();
        }
    }
}
