// Flapp Copyright 2017-2018

using System.Linq;
using System.Web.Http;
using Falcon.EFCommonContext.DbModel;
using AutoMapper;
using System.Threading.Tasks;
using System.Data.Entity;
using System.Net;
using Falcon.Web.Models.Api;
using System.Collections.Generic;
using System.Web.Http.Description;
using Falcon.Common.Logging;
using log4net;
using Falcon.Web.Common;
using Falcon.EFCommonContext;
using Falcon.Web.Api.Utilities.Base;
using Falcon.Common.Security;

namespace Falcon.Web.Api.Controllers.V1
{
    [UnitOfWorkActionFilter]
    public class FavoritesController : FalconApiController
    {
        private readonly IDbContext mDb;
        private readonly IMapper mMapper;
        private readonly ILog mLogManager;
        private readonly IWebUserSession mUserSession;
        public FavoritesController(IMapper Mapper , ILogManager logManager, IDbContext Database , IWebUserSession UserSession)
        {
            mMapper = Mapper;
            mLogManager = logManager.GetLog(typeof(FavoritesController));
            mDb = Database;
            mUserSession = UserSession;
        }

        [ResponseType(typeof(SNewCreatedQuestions))]
        [Route("Favorites/{UUID}")]
        [HttpPost]
        
        public async Task<IHttpActionResult> GetFavoriteList()
        {
            
            var favoritedQuestion = await mDb.Set<Favorite>().Where(f => f.UserID == mUserSession.UserID).Select(f => f.Question).ToListAsync();

            if(favoritedQuestion.Count > 0 )
            {
                var result = mMapper.Map<List<Question>, List<SNewCreatedQuestions>>(favoritedQuestion);
                return Ok(result);
            }
            else
            {
                return Response(HttpStatusCode.NoContent);
            }
        }

        [ResponseType(typeof(SNewCreatedQuestions))]
        [Route("Favorites/{QuestionID}")]
        [HttpPost]

        public async Task<IHttpActionResult> RemoveFavoritedQuestion(int QuestionID)
        {
            
            var favoritedQuestions = await mDb.Set<Favorite>().Where( f => f.UserID == mUserSession.UserID && f.QuestionID == QuestionID).ToArrayAsync();

            if (favoritedQuestions != null)
            {
                if(favoritedQuestions.Length > 1)
                {
                    mLogManager.Error("More than one favorite");
                    mDb.Set<Favorite>().RemoveRange(favoritedQuestions);
                    await mDb.SaveChangesAsync();
                }
                else if( favoritedQuestions.Length == 1)
                {
                    mDb.Set<Favorite>().Remove(favoritedQuestions[0]);
                    await mDb.SaveChangesAsync();
                }
                   
                return Response(HttpStatusCode.OK , QuestionID);
            }
            else
            {
                return Response(HttpStatusCode.NoContent);
            }
        }
    }
}