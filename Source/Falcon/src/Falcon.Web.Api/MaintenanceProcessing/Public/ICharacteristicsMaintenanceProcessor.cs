using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;

namespace Falcon.Web.Api.MaintenanceProcessing.Public
{
    public interface ICharacteristicsMaintenanceProcessor
    {
        Task<int> VoteForUser(int QuestionDesignerID, int QuestionID , int[] CharacterIDs);
        Task<int> AddUserCharacteristicToLeaderBoard(int[] CharacterIDs);
        Task<int> AssignCharactersToCategory(int[] CharacterIDs, int CategoryID);
        Task<int[]> GetCategoryAssignedCharacters(int CategoryID);
        Task<int> AddCharacterToBunchOfUsers(int[] UserIds, int CharacterID);
    }
}