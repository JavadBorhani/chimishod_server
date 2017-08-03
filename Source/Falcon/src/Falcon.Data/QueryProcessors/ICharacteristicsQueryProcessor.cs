using Falcon.EFCommonContext.DbModel;
using Falcon.Web.Models.Api;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Falcon.Data.QueryProcessors
{
    public interface ICharacteristicsQueryProcessor
    {
        Task<List<SCharacteristic>> FetchAllCharacteristicsWithAliases();
        Task<int> VoteDesignerCharacter(int QuestionCreatorID, int QuestionID, int[] CharacterIDs);
        Task<int> AddUserToLeaderBoard(int[] CharacterIDs ,int UserID);
        Task<bool> CharacterIdsExists(int[] CharacterIDs);
        Task<bool> CharacterIdExist(int CharacterID);
        Task<int> AssignCharacterToCategory(int CharacterID, int CategoryID);
        Task<int> AssignCharactersToCategory(int[] CharacterIDs, int CategoryID);
        Task<int> AssignCharactersToCategories(int[] CharacterIDs, int[] CategoryIDs);
        Task<int[]> GetCategoryAssignedCharacters(int CategoryID);
        Task<bool> CategoryHasCharacters(int CategoryID , int[] Characters);
        Task<bool> CreatorHasLeaderboradIds(int CreatorID, int[] characters);
        Task<int> AddCharacterToUsers(int CharacterID, int[] UserIDs);
        Task<QueryResult<SLeaderBoard>> GetLeaderBoard(PagedDataRequest RequestInfo, int CharacterID);
        Task<SLeaderBoard> GetUserLeaderBoard(int CharacterID);
        Task<SUserCharacter[]> GetUserCharacter();
    }
}
