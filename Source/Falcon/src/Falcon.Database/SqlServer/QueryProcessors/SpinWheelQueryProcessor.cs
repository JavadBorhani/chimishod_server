using Falcon.Data.QueryProcessors;
using Falcon.EFCommonContext;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Falcon.Database.SqlServer.QueryProcessors
{
    public class SpinWheelQueryProcessor : ISpinWheelQueryProcessor
    {
        private readonly IDbContext mDb;
        public SpinWheelQueryProcessor(IDbContext Database)
        {
            mDb = Database;
        }
    }
}
