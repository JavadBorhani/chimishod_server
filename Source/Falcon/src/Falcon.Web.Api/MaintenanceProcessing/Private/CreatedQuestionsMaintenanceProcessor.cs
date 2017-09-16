using Falcon.Web.Api.MaintenanceProcessing.Public;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Threading.Tasks;
using Falcon.Data.QueryProcessors;
using Falcon.Web.Models.Api;
using Falcon.Web.Models.Api.Input;
using Falcon.Web.Models.Api.Input.Questions;

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
            //TODO : Adding Delete Policy 

            switch (Info.State)
            {
                case CreatedQuestionState.CreatedQuestionIsInChecking:
                case CreatedQuestionState.CreatedQuestionRejected:

                    return await mCreatedQuery.Delete(Info.ID);

                case CreatedQuestionState.CreatedQuestionsVerified:

                    return await mQuestionQuery.LogicallyRemoveByCreator(Info.ID);

            }

            return false;
        }


        public Task<bool> Edit(EditInfo Info)
        {
            //TODO : Checking Remove Policy ;

            return mCreatedQuery.Edit(Info);
        }
    }
}