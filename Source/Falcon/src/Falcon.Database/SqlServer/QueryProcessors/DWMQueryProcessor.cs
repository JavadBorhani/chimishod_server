using Falcon.Data.QueryProcessors;
using Falcon.Database.SqlServer.QueryProcessors;
using Falcon.EFCommonContext;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Falcon.Database.SqlServer.QueryProcessors
{
    public class DWMQueryProcessor : IDWMQueryProcessor
    {

        private readonly IDbContext mDb;
        public DWMQueryProcessor(IDbContext Database)
        {
            mDb = Database;
        }        
    }
}
