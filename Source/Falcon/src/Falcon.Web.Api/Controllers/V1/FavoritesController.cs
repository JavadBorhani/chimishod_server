// Flapp Copyright 2017-2018

using AutoMapper;
using Falcon.Common.Logging;
using Falcon.Common.Security;
using Falcon.EFCommonContext;
using Falcon.Web.Api.Utilities.Base;
using Falcon.Web.Common;
using log4net;

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
            mLogManager = logManager.GetLog(typeof(FavoritesController));
            mMapper = Mapper;
            mDb = Database;
            mUserSession = UserSession;
        }

        //[ResponseType(typeof(SNewCreatedQuestions))]
        //[Route("Favorites/")]
        //[HttpPost]
        
        //public async Task<IHttpActionResult> GetFavoriteList()
        //{
            
        //    var favoritedQuestion = await mDb.Set<Favorite>().Where(f => f.UserID == mUserSession.ID).Select(f => f.Question).ToListAsync();

        //    if(favoritedQuestion.Count > 0 )
        //    {
        //        var result = mMapper.Map<List<Question>, List<SNewCreatedQuestions>>(favoritedQuestion);
        //        return Ok(result);
        //    }
        //    else
        //    {
        //        return Response(HttpStatusCode.NoContent);
        //    }
        //}

        //[ResponseType(typeof(SNewCreatedQuestions))]
        //[Route("Favorites/{QuestionID}")]
        //[HttpPost]

        //public async Task<IHttpActionResult> RemoveFavoritedQuestion(int QuestionID)
        //{
            
        //    var favoritedQuestions = await mDb.Set<Favorite>().Where( f => f.UserID == mUserSession.ID && f.QuestionID == QuestionID).ToArrayAsync();

        //    if (favoritedQuestions != null)
        //    {
        //        if(favoritedQuestions.Length > 1)
        //        {
        //            mLogManager.Error("More than one favorite");
        //            mDb.Set<Favorite>().RemoveRange(favoritedQuestions);
        //            await mDb.SaveChangesAsync();
        //        }
        //        else if( favoritedQuestions.Length == 1)
        //        {
        //            mDb.Set<Favorite>().Remove(favoritedQuestions[0]);
        //            await mDb.SaveChangesAsync();
        //        }
                   
        //        return Response(HttpStatusCode.OK , QuestionID);
        //    }
        //    else
        //    {
        //        return Response(HttpStatusCode.NoContent);
        //    }
        //}
    }
}