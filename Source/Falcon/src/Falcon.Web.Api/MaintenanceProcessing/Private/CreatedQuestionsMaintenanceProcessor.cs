using Falcon.Data.QueryProcessors;
using Falcon.Web.Api.MaintenanceProcessing.Public;
using Falcon.Web.Models.Api;
using Falcon.Web.Models.Api.Input.Questions;
using System.Threading.Tasks;

namespace Falcon.Web.Api.MaintenanceProcessing.Private
{
    public class CreatedQuestionsMaintenanceProcessor : ICreatedQuestionsMaintenanceProcessor
    {
        private readonly ICreatedQuestionsQueryProcessor mCreatedQuery;
        private readonly IQuestionsQueryProcessor mQuestionQuery;

        public CreatedQuestionsMaintenanceProcessor(ICreatedQuestionsQueryProcessor CreatedQuestionsQueryProcessor , IQuestionsQueryProcessor QuestionsQueryProcessor)
        {
            mCreatedQuery = CreatedQuestionsQueryProcessor;
            mQuestionQuery = QuestionsQueryProcessor;
        }

        public async Task<bool> DeleteLogically(RemoveInfo Info)
        {
            
            
            switch (Info.State)
            {
                case CreatedQuestionState.CreatedQuestionIsInChecking:
                case CreatedQuestionState.CreatedQuestionRejected:

                    var isDeletable = await mCreatedQuery.IsDeletable(Info.ID);
                    if(isDeletable)
                    {
                        var response = await mCreatedQuery.Delete(Info.ID);
                        return response;
                    }
                    return false;

                case CreatedQuestionState.CreatedQuestionsVerified:

                    var deletable = await mQuestionQuery.IsDeletable(Info.ID);
                    
                    if (deletable)
                    {
                        var response = await mQuestionQuery.LogicallyRemoveByCreator(Info.ID);
                        return response;
                    }

                    return false;

            }

            return false;
        }


        public async Task<bool> Edit(EditInfo Info)
        {
            var isEditable = await mCreatedQuery.IsEditable(Info.ID);

            if(isEditable)
            {
                var response = await mCreatedQuery.Edit(Info);
                return response;
            }

            return false;
        }
    }
}