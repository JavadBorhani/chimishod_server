// Flapp Copyright 2017-2018

using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Description;
using Falcon.EFCommonContext.DbModel;
using Falcon.Common;
using Falcon.Web.Models.Api;
using Falcon.Web.Common;
using Falcon.EFCommonContext;
using Falcon.Web.Api.Utilities.Base;
using Falcon.Common.Security;

namespace Falcon.Web.Api.Controllers.V1
{
    [UnitOfWorkActionFilter]
    public class UserAvatarsController : FalconApiController
    {
        private readonly IDbContext mDb;
        private readonly IDateTime mDateTime;
        private readonly IWebUserSession mUserSession;

        public UserAvatarsController(IDateTime DateTime, IDbContext Database , IWebUserSession UserSession)
        {
            mDateTime = DateTime;
            mDb = Database;
            mUserSession = UserSession;
        }


        [ResponseType(typeof(SUserAvatar))]
        [Route("UserAvatars/{UUID}")]
        [HttpPost]
        public async Task<IHttpActionResult> GetUserFacePictureList(string UUID)
        {
            var userId = await mDb.Set<User>().AsNoTracking().Where(u => u.UUID == UUID).Select( u => u.ID).SingleOrDefaultAsync();
            //TODO : Refactor this to one query 
            if (userId != 0)
            {
                var avatars = await mDb.Set<UserAvatar>().AsNoTracking().ToArrayAsync();
                var selectedAvatar = await mDb.Set<SelectedAvatar>().AsNoTracking().Where(st => st.UserID == userId).Select(sc => sc.UserAvatarID).SingleOrDefaultAsync();
                var purchasedAvatars = await mDb.Set<PurchaseAvatar>().AsNoTracking().Where(pt => pt.UserID == userId).Select(c => c.UserAvatarID).ToListAsync();

                if (avatars.Length > 0 && selectedAvatar > 0 && purchasedAvatars.Count >= 0)
                {
                    var userAvatars = new SUserAvatar[avatars.Length];

                    for (int i = 0; i < userAvatars.Length; ++i)
                    {
                        userAvatars[i] = new SUserAvatar
                        {
                            ID = avatars[i].ID,
                            PicUrl = avatars[i].PicUrl,
                            Price = avatars[i].Price,
                            IsPurchased = (avatars[i].ID == Constants.DefaultUser.AvatarID) ? true : purchasedAvatars.Contains(avatars[i].ID), // TODO : remember to remove what has checked to decrease checking time
                            IsActive = (selectedAvatar == avatars[i].ID) ? true : false,
                        };
                    }

                    return Ok(userAvatars);
                }

                return Response(HttpStatusCode.NotFound);
            }

            return Response(HttpStatusCode.Unauthorized); 
        }

        [ResponseType(typeof(SAvatarState))]
        [Route("UserAvatars/Select/{UUID}/{UserAvatarID}")]
        [HttpPost]
        public async Task<IHttpActionResult> SelectUserFacePicture(string UUID, int UserAvatarID)
        {
            var user = await mDb.Set<User>().AsNoTracking()
                                        .Where(u => u.UUID == UUID)
                                        .Select(u => new { u.ID, u.TotalStars })
                                        .SingleOrDefaultAsync();

            if (user != null)
            {
                var userSelectedAvatar = await mDb.Set<SelectedAvatar>().Where(sa => sa.UserID == user.ID)
                                                                .Include( sa => sa.UserAvatar)
                                                                .SingleOrDefaultAsync();

                if (await UserAvatarExists(UserAvatarID))
                {
                    if (UserAvatarID == Constants.DefaultUser.CategoryID) 
                    {
                        userSelectedAvatar.UserAvatarID = UserAvatarID;
                        await mDb.SaveChangesAsync();
                    }
                    else
                    {
                        bool hasBoughtCategory = await mDb.Set<PurchaseAvatar>().AsNoTracking().CountAsync(pc => pc.UserID == user.ID && pc.UserAvatarID == UserAvatarID) > 0;

                        if (hasBoughtCategory)
                        {
                            userSelectedAvatar.UserAvatarID = UserAvatarID;
                            await mDb.SaveChangesAsync();
                        }
                        else
                        {
                            return Response(HttpStatusCode.Unauthorized);
                        }
                    }

                    var avatarState = new SAvatarState
                    {
                        TotalStar = user.TotalStars,
                        ID = userSelectedAvatar.ID,
                        PicUrl = userSelectedAvatar.UserAvatar.PicUrl,
                    };

                    return Ok(avatarState);
                }
                else
                {
                    return Response(HttpStatusCode.Unauthorized);
                }
            }
            else
            {
                return Response(HttpStatusCode.Unauthorized);
            }
        }

        [ResponseType(typeof(SAvatarState))]
        [Route("UserAvatars/Purchase/{UUID}/{UserAvatarID}")]
        [HttpPost]
        public async Task<IHttpActionResult> PurchaseUserAvatar(string UUID , int UserAvatarID)
        {
            var user = await mDb.Set<User>().SingleOrDefaultAsync(u => u.UUID == UUID);
            if (user != null)
            {
                bool bought = false;
                var avatar = await mDb.Set<UserAvatar>().FindAsync(UserAvatarID);
                var selectedAvatar = await mDb.Set<SelectedAvatar>().SingleOrDefaultAsync(sc => sc.UserID == user.ID);

                if (avatar != null)
                {
                    bool hasBought = (UserAvatarID == Constants.DefaultUser.AvatarID) ? true : await mDb.Set<PurchaseAvatar>().CountAsync(pa => pa.UserID == user.ID && pa.UserAvatarID == UserAvatarID) > 0;
                    if (hasBought)
                    {
                        return Response(HttpStatusCode.Conflict);
                    }
                    else
                    {
                        if (user.TotalStars - avatar.Price >= 0)
                        {
                            user.TotalStars -= avatar.Price;

                            PurchaseAvatar newAvatar = new PurchaseAvatar
                            {
                                UserID = user.ID,
                                UserAvatarID = avatar.ID,
                                PurchasedDate = mDateTime.Now
                            };

                            mDb.Set<PurchaseAvatar>().Add(newAvatar);

                            selectedAvatar.UserAvatarID = UserAvatarID;

                            bought = true;
                            await mDb.SaveChangesAsync();
                        }
                    }
                }

                var clientResult = new SAvatarState
                {
                    TotalStar = user.TotalStars,
                    ID = avatar.ID,
                    PicUrl = avatar.PicUrl,
                    Purchased = bought,
                    RequestID = UserAvatarID,
                };
                return Ok(clientResult);
            }

            return NotFound();
        }

        private async Task<bool> UserAvatarExists(int id)
        {
            return await mDb.Set<UserAvatar>().CountAsync(e => e.ID == id) > 0;
        }
    }
}