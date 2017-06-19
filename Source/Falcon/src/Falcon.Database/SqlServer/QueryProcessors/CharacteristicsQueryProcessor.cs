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
using Falcon.Data;

namespace Falcon.Database.SqlServer.QueryProcessors
{
    public class CharacteristicsQueryProcessor : ICharacteristicsQueryProcessor
    {
        private readonly IDbContext mDb;
        private readonly IUserSession mUserSession;
        
        private class CharacteristicWithAlias
        {
            public int Id { get; set; }
            public string Icon{ get; set; }
            public string Title{ get; set; }
            public int UserCount { get; set; }
            public int Priority { get; set; }
            public List<CharacterAlia> Alias { get; set; }
        }

        public CharacteristicsQueryProcessor(IDbContext Database , IUserSession UserSession)
        {
            mDb = Database;
            mUserSession = UserSession;
        }

        public async Task<List<SCharacteristic>> FetchAllCharacteristicsWithAliases()
        {
            var query = await mDb.Set<Character>()
                .AsNoTracking()
                .Include(c => c.CharacterAlias)
                .Select(u => new CharacteristicWithAlias
                        {
                            Id = u.ID,
                            Icon = u.Icon,
                            Title = u.Title,
                            UserCount = u.UserCount,
                            Priority = u.Priority,
                            Alias = u.CharacterAlias.ToList()
                        })
                .OrderBy( u => u.Priority)
                .ToArrayAsync();

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
                    UserCount = query[i].UserCount,
                    Alias = alias
                });
            }

            return characters;  
        }

        public async Task<int> VoteDesignerCharacter(int QuestionCreatorID, int QuestionID, int[] CharacterIDs)
        {
            var characterPoints = new CharacterPoint[CharacterIDs.Length];
            for(int i = 0; i < characterPoints.Length; ++i)
            {
                characterPoints[i] = new CharacterPoint();

                characterPoints[i].UserID = mUserSession.ID;
                characterPoints[i].CreatorID = QuestionCreatorID;
                characterPoints[i].QuestionID = QuestionID;
                characterPoints[i].CharacterID = CharacterIDs[i];
            }

            mDb.Set<CharacterPoint>().AddRange(characterPoints);

            var result = await mDb.SaveChangesAsync();
            return result;  
        }

        public async Task<int> AddUserToLeaderBoard(int[] CharacterIDs , int UserID)
        {
            var items = await mDb.Set<PersonalizedCharacter>()
                .AsNoTracking()
                .Where(pc => pc.UserID == UserID)
                .Select(pc => pc.CharacterID)
                .ToListAsync();


            var newItems = CharacterIDs.Except(items).ToArray();

            var personalizedCharacters = new PersonalizedCharacter[newItems.Length];
            for(int i = 0; i < newItems.Length; ++i)
            {
                personalizedCharacters[i] = new PersonalizedCharacter();

                personalizedCharacters[i].OldPointCount = 0;
                personalizedCharacters[i].NewPointCount = 0;
                personalizedCharacters[i].Rank = 0;
                personalizedCharacters[i].UserID = UserID;
                personalizedCharacters[i].CharacterID = newItems[i];
            }

            mDb.Set<PersonalizedCharacter>().AddRange(personalizedCharacters);

            var result = await mDb.SaveChangesAsync();
            return result;
        }

        public async Task<bool> IsExists(int CharacterID)
        {
            var query = await mDb.Set<Character>().AsNoTracking().CountAsync(c => c.ID == CharacterID) > 0;
            return query; 
        }

        public async Task<int> AssignCharacterToCategory(int CharacterID, int CategoryID)
        {
            mDb.Set<AssignedCharacter>().Add(new AssignedCharacter
            {
                CategoryID = CategoryID,
                CharacterID = CharacterID
            });

            var result = await mDb.SaveChangesAsync();
            return result;
        }

        public async Task<int> AssignCharactersToCategory(int[] CharacterIDs, int CategoryID)
        {
            var newAssignee = new AssignedCharacter[CharacterIDs.Length];
            for(int i = 0; i < newAssignee.Length; ++i)
            {
                newAssignee[i].CharacterID = CharacterIDs[i];
                newAssignee[i].CategoryID = CategoryID;
            }

            mDb.Set<AssignedCharacter>().AddRange(newAssignee);
            
            var result = await mDb.SaveChangesAsync();
            return result;  
        }

        public async Task<int> AssignCharactersToCategories(int[] CharacterIDs, int[] CategoryIDs)
        {
            var newAssignes = new AssignedCharacter[CharacterIDs.Length * CategoryIDs.Length];
            for(int i = 0; i < CategoryIDs.Length; ++i)
            {
                for(int j = 0; j < CharacterIDs.Length; ++j)
                {
                    int index = (i * CategoryIDs.Length) + j;

                    newAssignes[index].CategoryID = CategoryIDs[i];
                    newAssignes[index].CharacterID = CharacterIDs[j];
                }
            }

            mDb.Set<AssignedCharacter>().AddRange(newAssignes);

            var result = await mDb.SaveChangesAsync();
            return result;  
        }

        public async Task<bool> CharacterIdsExists(int[] CharacterIDs)
        {
            var query = await mDb.Set<Character>().CountAsync(c => CharacterIDs.Contains(c.ID)) == CharacterIDs.Length;
            return query;
        }

        public async Task<int[]> GetCategoryAssignedCharacters(int CategoryID)
        {
            var ids = await mDb.Set<AssignedCharacter>()
                .AsNoTracking()
                .Where(ac => ac.CategoryID == CategoryID)
                .Select(ac => ac.CharacterID)
                .ToArrayAsync();

            return ids;
        }

        public async Task<bool> CreatorHasLeaderboradIds(int CreatorID, int[] characters)
        {
            var result = await mDb.Set<PersonalizedCharacter>()
                .AsNoTracking()
                .CountAsync(pc => pc.UserID == CreatorID && characters.Contains(pc.CharacterID)) == characters.Length;

            return result;
        }

        public async Task<bool> CharacterIdExist(int CharacterID)
        {
            var data = await mDb.Set<Character>().AsNoTracking().Where(c => c.ID == CharacterID).AnyAsync();
            return data;
        }

        public async Task<int> AddCharacterToUsers(int CharacterID, int[] UserIDs)
        {

            var users = new PersonalizedCharacter[UserIDs.Length];
            for(int i = 0; i < UserIDs.Length; ++i)
            {
                users[i] = new PersonalizedCharacter();

                users[i].OldPointCount = 0;
                users[i].NewPointCount = 0;
                users[i].Rank = 0;
                users[i].UserID = UserIDs[i];
                users[i].CharacterID = CharacterID;
            }
            mDb.Set<PersonalizedCharacter>().AddRange(users);

            var result = await mDb.SaveChangesAsync();
            return result;
        }

        public async Task<QueryResult<SLeaderBoard>> GetLeaderBoard(PagedDataRequest RequestInfo, int CharacterID)
        {
            var userAvatar = mDb.Set<SelectedAvatar>()
                .AsNoTracking()
                .Include(sa => sa.UserAvatar);

            var query = mDb.Set<PersonalizedCharacter>()
                .AsNoTracking()
                .Where(pc => pc.CharacterID == CharacterID)
                .OrderBy(pc => pc.Rank)
                .Include(pc => pc.User)
                .Include(pc => pc.User.Level)
                .Join(userAvatar , pc => pc.UserID , sa => sa.UserID, (pc, sa ) => new SLeaderBoard
                {
                    UserID = pc.User.ID,
                    LevelNumber = pc.User.Level.LevelNumber,
                    UserName = pc.User.UserName,
                    Rank = pc.Rank,
                    Score = pc.OldPointCount,
                    UserAvatarUrl = sa.UserAvatar.PicUrl
                })
                .OrderBy(pc => pc.Rank);

            var totalItemCount = await query.CountAsync();

            var startIndex = ResultPagingUtility.CalculateStartIndex(RequestInfo.PageNumber, RequestInfo.PageSize);

            var players = await query.Skip(startIndex).Take(RequestInfo.PageSize).ToListAsync();

            var queryResult = new QueryResult<SLeaderBoard>(players, totalItemCount, RequestInfo.PageSize);

            return queryResult;
        }

        public async Task<SLeaderBoard> GetUserLeaderBoard(int CharacterID)
        {
            var userAvatar = mDb.Set<SelectedAvatar>()
                .AsNoTracking()
                .Include(sa => sa.UserAvatar);

            var query = mDb.Set<PersonalizedCharacter>()
                .AsNoTracking()
                .Where(pc => pc.CharacterID == CharacterID && pc.UserID == mUserSession.ID)
                .OrderBy(pc => pc.Rank)
                .Include(pc => pc.User)
                .Include(pc => pc.User.Level)
                .Join(userAvatar, pc => pc.UserID, sa => sa.UserID, (pc, sa) => new SLeaderBoard
                {
                    UserID = pc.User.ID,
                    LevelNumber = pc.User.Level.LevelNumber,
                    UserName = pc.User.UserName,
                    Rank = pc.Rank,
                    Score = pc.OldPointCount,
                    UserAvatarUrl = sa.UserAvatar.PicUrl
                })
                .OrderBy(pc => pc.Rank);

            var result = await query.SingleOrDefaultAsync();
            return result;
        }

        public async Task<bool> CategoryHasCharacters(int CategoryID, int[] Characters)
        {
            var result = await mDb.Set<AssignedCharacter>()
                .AsNoTracking()
                .Where( ac => ac.CategoryID == CategoryID && Characters.Contains(ac.CharacterID))
                .CountAsync() == Characters.Length;

            return result;
        }

        public async Task<List<SUserCharacter>> GetUserCharacter(int UserID)
        {
            var data = await mDb.Set<PersonalizedCharacter>()
                .AsNoTracking()
                .Where(pc => pc.UserID == UserID).Select(pc => new SUserCharacter
                {
                    UserID = pc.UserID,
                    CharacterID = pc.CharacterID,
                    Rank = pc.Rank,
                    Score = pc.OldPointCount
                })
                .ToListAsync();

            return data;    
        }
    }
}
