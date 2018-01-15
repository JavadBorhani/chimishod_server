using AutoMapper;
using Falcon.Data.QueryProcessors;
using Falcon.EFCommonContext;
using Falcon.Web.Api.InquiryProcessing.Public;
using Falcon.Web.Common;
using Falcon.Web.Models.Api.Config;
using System.Threading.Tasks;

namespace Falcon.Web.Api.InquiryProcessing.Private
{
    public class GameConfig : IGameConfig
    {
        private SGameConfig mGameConfig;
        public virtual IGameConfigQueryProcessor mGameConfigQuery
        {
            get
            {
                return WebContainerManager.Get<IGameConfigQueryProcessor>();
            }
        }


        public virtual IDbContext mDB
        {
            get
            {
                return WebContainerManager.Get<IDbContext>();
            }
        }

        public virtual IMapper mMapper
        {
            get
            {
                return WebContainerManager.Get<IMapper>();
            }
        }

        public SGameConfig GetQuestionSelectorConfig()
        {

            return GetState();
        }

        public SGameConfig GetState()
        {
            if(mGameConfig == null)
            {
                ReadStateFromDatabase();
            }
            return mGameConfig;
        }

        public void ReadStateFromDatabase()
        {
            var config = mGameConfigQuery.GetGameConfiguration();
            mGameConfig = mMapper.Map<SGameConfig>(config);
        }

        public bool SetState(SGameConfig NewState)
        {
            if( NewState != null && 
                NewState.FunQuestionsPercent != 0 && 
                NewState.PeopleQuestionsPercent != 0 && 
                NewState.TotalNumberOfQuestions != 0 )

            mGameConfig = NewState;
            mGameConfigQuery.SetGameConfiguration(NewState);
            return true;
        }
    }
}