using AutoMapper;
using Falcon.EFCommonContext;
using Falcon.EFCommonContext.DbModel;
using Falcon.Web.Api.MaintenanceProcessing.Public;
using Falcon.Web.Common;
using Falcon.Web.Models.Api;
using System.Linq;

namespace Falcon.Web.Api.MaintenanceProcessing.Private
{
    public class GlobalApplicationState : IGlobalApplicationState
    {
        private SApplicationState mCurrentApplicationState;

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

        public SApplicationState State()
        {
            if(mCurrentApplicationState == null)
            {
                ReadStateFromDatabase();
            }
            return mCurrentApplicationState;
        }

        public void ReadStateFromDatabase()
        {
            var appState = mDB.Set<ApplicationState>().AsNoTracking().SingleOrDefault();
            if (appState != null)
            {
                mCurrentApplicationState = mMapper.Map<SApplicationState>(appState);
            }
        }

        public bool SetState(SApplicationState NewState)
        {
            if(ModelIsValid(NewState))
            {
                var dbAppState = mDB.Set<ApplicationState>().SingleOrDefault();
                dbAppState = mMapper.Map<ApplicationState>(NewState);
                mDB.SaveChanges();
            }
            return false;   
        }

        private bool ModelIsValid(SApplicationState model)
        {
            return (model.AnswerPrize > 0 &&
                model.CreateNewQuestionPrize > 0 &&
                model.DefaultUserCoin > 0 &&
                model.LikePrize > 0 &&
                model.FavoritePrice > 0 &&
                model.CreateQuestionPrice > 0);
        }
    }
}