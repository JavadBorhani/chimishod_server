using Falcon.Data.QueryProcessors;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Falcon.EFCommonContext.DbModel;
using Falcon.Common.Security;
using Falcon.EFCommonContext;
using Falcon.Web.Models.Api;
using System.Data.Entity;

namespace Falcon.Database.SqlServer.QueryProcessors
{
    public class CharacteristicsQueryProcessor : ICharacteristicsQueryProcessor
    {
        private readonly IDbContext mDb;
        private readonly IUserSession mUserSession;
        
        private class CharacteristicWithAlias
        {
            public int Id{ get; set; }
            public string Icon{ get; set; }
            public string Title{ get; set; }
            public List<CharacterAlia> Alias { get; set; }
        }

        public CharacteristicsQueryProcessor(IDbContext Database , IUserSession UserSession)
        {
            mDb = Database;
            mUserSession = UserSession;
        }
        public async Task<List<SCharacteristic>> FetchAllCharacteristicsWithAliases()
        {
            var query = await mDb.Set<Character>().AsNoTracking().Select(u => new CharacteristicWithAlias
            {
                Id = u.ID,
                Icon = u.Icon,
                Title = u.Title,
                Alias = u.CharacterAlias.ToList()
            }).ToArrayAsync();

            var characters = new List<SCharacteristic>();

            for(int i = 0;  i < query.Length; ++i)
            {
                var alias = new List<SCharacteristic.CharacterAlias>();
                for(int j = 0; j < query[i].Alias.Count; ++j)
                {
                    alias.Add(new SCharacteristic.CharacterAlias
                    {
                        Title = query[i].Alias[j].Title,
                        Icon = query[i].Alias[j].Icon,
                    });
                }
                characters.Add(new SCharacteristic
                {
                    ID = query[i].Id,
                    Icon = query[i].Icon,
                    Title = query[i].Title,
                    Alias = alias
                });
            }

            return characters;  
        }
    }
}
