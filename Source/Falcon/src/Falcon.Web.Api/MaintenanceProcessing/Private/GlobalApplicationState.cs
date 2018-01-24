// Flapp Copyright 2017-2018
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

        public SApplicationState GetState()
        {
            if(mCurrentApplicationState == null)
            {
                ReadStateFromDatabase();
            }
            return mCurrentApplicationState;
        }

        public void ReadStateFromDatabase()
        {
            var appState = mDB.Set<ServerApplicationState>().AsNoTracking().FirstOrDefault();
            if (appState != null)
            {
                mCurrentApplicationState = mMapper.Map<SApplicationState>(appState);
            }
        }

        public bool SetState(SApplicationState NewState)
        {
            if (ModelIsValid(NewState))
            {
                var dbAppState = mDB.Set<ServerApplicationState>().SingleOrDefault();
                dbAppState = mMapper.Map<ServerApplicationState>(NewState);
                mDB.SaveChanges();
            }
            return false;
        }

        private bool ModelIsValid(SApplicationState model)
        {
            return (model.Comment_DefaultNumberAmount > 0 &&
                //model.Favorite_FavoritePrice > 0 &&
                //model.Favorite_FreeNumberToFavorite > 0 &&
                !string.IsNullOrEmpty(model.Host_SmtpServer) &&
                !string.IsNullOrEmpty(model.Host_SupportMail) &&
                !string.IsNullOrEmpty(model.Host_SupportMailPassword) &&
                !string.IsNullOrEmpty(model.Host_WebSiteNoReplyMail) &&
                !string.IsNullOrEmpty(model.Host_WebSiteNoReplyMailPassword) &&
                !string.IsNullOrEmpty(model.HostCredentialUserName) &&
                !string.IsNullOrEmpty(model.HostCredentialPassword) &&
                model.Leader_TopNumberToShow > 0 &&
                model.Paging_DefaultPageSize > 0 &&
                model.Prize_AnswerXP > 0 &&
                model.Prize_LikeScoreAmount > 0 &&
                model.Prize_CreateNewQuestionXP > 0 &&
                model.Prize_NewQuestionAcceptedXP >= 0 &&
                model.Prize_CreateNewQuestionScore >= 0 &&
                model.Prize_NewQuestionAcceptedScore >= 0 &&
                model.Prize_AnswerScoreAmount >= 0 &&
                model.Question_CreateQuestionPrice >= 0 &&
                model.Question_DefaultReturnAmount >= 0 &&
                !string.IsNullOrEmpty(model.Question_NoQuestionFoundBut) &&
                !string.IsNullOrEmpty(model.Question_NoQuestionFoundWhat) &&
                model.Question_NoQuestionFoundID <= 0 &&
                model.Question_NumberToSkip >= 0 &&
                model.Question_ServerBurntReturnAmount >= 0 &&
                model.Store_DefaultReturnAmount >= 0 &&
                model.User_DefaultUserCoin >= 0 &&
                //model.WatchAdCoin >= 0 &&
                !string.IsNullOrEmpty(model.User_DefaultUserName)
                );
        }
    }
}