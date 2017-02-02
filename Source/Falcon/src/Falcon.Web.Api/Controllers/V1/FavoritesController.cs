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

namespace Falcon.Web.Api.Controllers.V1
{
    public class FavoritesController : ApiController
    {
        private DbEntity db = new DbEntity();


        private readonly IMapper mMapper;
        
        public FavoritesController(IMapper Mapper)
        {
            mMapper = Mapper;
        }

        [ResponseType(typeof(SNewCreatedQuestions))]
        [Route("Favorites/{UUID}")]
        [HttpPost]
        
        public async Task<IHttpActionResult> GetFavoriteList(string UUID)
        {
            var userID = await db.Users.AsNoTracking().Where(u => u.UUID == UUID).Select(u => u.ID).SingleOrDefaultAsync();

            if (userID != 0) // UserExists
            {
                var favoritedQuestion = await db.Favorites.Where(f => f.UserID == userID).Select(f => f.Question).ToListAsync();

                if(favoritedQuestion.Count > 0 )
                {
                    var result = mMapper.Map<List<Question>, List<SNewCreatedQuestions>>(favoritedQuestion);
                    return Ok(result);
                }
                else
                {
                    return ReturnResponse(HttpStatusCode.NoContent);
                }
            }
            else
            {
                return ReturnResponse(HttpStatusCode.Unauthorized);
            }
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool FavoriteExists(int id)
        {
            return db.Favorites.Count(e => e.ID == id) > 0;
        }

        private ResponseMessageResult ReturnResponse(HttpStatusCode Code)
        {
            return ResponseMessage(Request.CreateResponse(Code));
        }
    }
}