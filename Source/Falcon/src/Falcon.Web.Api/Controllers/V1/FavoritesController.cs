using System.Linq;
using System.Web.Http;
using Falcon.EFCommonContext.DbModel;
using AutoMapper;
using System.Threading.Tasks;
using System.Data.Entity;
using System.Net;
using System.Web.Http.Results;
using System.Net.Http;
using Falcon.Web.Models.Api;
using System.Collections.Generic;
using System.Web.Http.Description;
using System;
using Falcon.Common.Logging;
using log4net;
using Falcon.Web.Api.Utilities.Extentions;
using Falcon.Web.Common;
using Falcon.EFCommonContext;

namespace Falcon.Web.Api.Controllers.V1
{
    [UnitOfWorkActionFilter]
    public class FavoritesController : FalconApiController
    {
        private readonly IDbContext mDb;
        private readonly IMapper mMapper;
        private readonly ILog mLogManager;
        
        public FavoritesController(IMapper Mapper , ILogManager logManager, IDbContext Database)
        {
            mMapper = Mapper;
            mLogManager = logManager.GetLog(typeof(FavoritesController));
            mDb = Database;
        }

        [ResponseType(typeof(SNewCreatedQuestions))]
        [Route("Favorites/{UUID}")]
        [HttpPost]
        
        public async Task<IHttpActionResult> GetFavoriteList(string UUID)
        {
            var userID = await mDb.Set<User>().AsNoTracking().Where(u => u.UUID == UUID).Select(u => u.ID).SingleOrDefaultAsync();

            if (userID != 0) // UserExists
            {
                var favoritedQuestion = await mDb.Set<Favorite>().Where(f => f.UserID == userID).Select(f => f.Question).ToListAsync();

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
            else
            {
                return Response(HttpStatusCode.Unauthorized);
            }
        }

        [ResponseType(typeof(SNewCreatedQuestions))]
        [Route("Favorites/{UUID}/{QuestionID}")]
        [HttpPost]

        public async Task<IHttpActionResult> RemoveFavoritedQuestion(string UUID , int QuestionID)
        {
            var userID = await mDb.Set<User>().AsNoTracking().Where(u => u.UUID == UUID).Select(u => u.ID).SingleOrDefaultAsync();

            if (userID != 0) // UserExists
            {
                var favoritedQuestions = await mDb.Set<Favorite>().Where( f => f.UserID == userID && f.QuestionID == QuestionID).ToArrayAsync();

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
            else
            {
                return Response(HttpStatusCode.Unauthorized);
            }
        }
    }
}