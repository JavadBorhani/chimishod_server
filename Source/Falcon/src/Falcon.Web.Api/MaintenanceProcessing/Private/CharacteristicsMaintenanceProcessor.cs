using Falcon.Data.QueryProcessors;
using Falcon.Web.Api.MaintenanceProcessing.Public;
using System.Threading.Tasks;

namespace Falcon.Web.Api.MaintenanceProcessing.Private
{
    public class CharacteristicsMaintenanceProcessor : ICharacteristicsMaintenanceProcessor
    {
        private readonly ICharacteristicsQueryProcessor mCharacteristicsQueryProcessor;
        public CharacteristicsMaintenanceProcessor(ICharacteristicsQueryProcessor CharacteristicsQueryProcessor)
        {
            mCharacteristicsQueryProcessor = CharacteristicsQueryProcessor;
        }

        public async Task<int> AddCharacterToBunchOfUsers(int[] UserIds, int CharacterID)
        {
            var exists = await mCharacteristicsQueryProcessor.CharacterIdExist(CharacterID);
            if(exists)
            {
                var user = await mCharacteristicsQueryProcessor.AddCharacterToUsers(CharacterID, UserIds);
                return user;    
            }
            return -1;
        }

        public async Task<int> AddUserCharacteristicToLeaderBoard(int[] CharacterIDs , int UserID)
        {
            var exists = await mCharacteristicsQueryProcessor.CharacterIdsExists(CharacterIDs);
            if(exists)
            {
                //ADD BUSINESS LOGIC HERE
                var result = await mCharacteristicsQueryProcessor.AddUserToLeaderBoard(CharacterIDs , UserID);
                return result;
            }
            else
            {
                return -1; 
            }
        }   

        public async Task<int> AssignCharactersToCategory(int[] CharacterIDs, int CategoryID)
        {
            var result = await mCharacteristicsQueryProcessor.AssignCharactersToCategory(CharacterIDs, CategoryID);
            return result;
        }

        public async Task<int> VoteForUser(int QuestionDesignerID, int QuestionID, int[] CharacterIDs)
        {
            var exists = await mCharacteristicsQueryProcessor.CreatorHasLeaderboradIds(QuestionDesignerID, CharacterIDs);
            if(exists)
            {
                var result = await mCharacteristicsQueryProcessor.VoteDesignerCharacter(QuestionDesignerID, QuestionID, CharacterIDs);
                return result;
            }
            else
            {
                return -1;
            }
        }
    }
}