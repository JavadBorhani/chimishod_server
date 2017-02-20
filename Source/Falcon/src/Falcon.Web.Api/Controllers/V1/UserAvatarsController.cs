using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Description;
using Falcon.EFCommonContext.DbModel;
using System.Web.Http.Results;
using Falcon.Common;
using Falcon.Web.Models.Api;

namespace Falcon.Web.Api.Controllers.V1
{
    public class UserAvatarsController : ApiController
    {
        private DbEntity db = new DbEntity();

        private readonly IDateTime mDateTime;

        public UserAvatarsController(IDateTime DateTime)
        {
            mDateTime = DateTime;
        }


        [ResponseType(typeof(SUserAvatar))]
        [Route("UserAvatars/{UUID}")]
        [HttpPost]
        public async Task<IHttpActionResult> GetUserFacePictureList(string UUID)
        {
            var userId = await db.Users.AsNoTracking().Where(u => u.UUID == UUID).Select( u => u.ID).SingleOrDefaultAsync();
            //TODO : Refactor this to one query 
            if (userId != 0)
            {
                var avatars = await db.UserAvatars.AsNoTracking().ToArrayAsync();
                var selectedAvatar = await db.SelectedAvatars.AsNoTracking().Where(st => st.UserID == userId).Select(sc => sc.UserAvatarID).SingleOrDefaultAsync();
                var purchasedAvatars = await db.PurchaseAvatars.AsNoTracking().Where(pt => pt.UserID == userId).Select(c => c.UserAvatarID).ToListAsync();

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
            var user = await db.Users.AsNoTracking()
                                        .Where(u => u.UUID == UUID)
                                        .Select(u => new { u.ID, u.TotalStars })
                                        .SingleOrDefaultAsync();

            if (user != null)
            {
                var userSelectedAvatar = await db.SelectedAvatars.Where(sa => sa.UserID == user.ID)
                                                                .Include( sa => sa.UserAvatar)
                                                                .SingleOrDefaultAsync();

                if (await UserAvatarExists(UserAvatarID))
                {
                    if (UserAvatarID == Constants.DefaultUser.CategoryID) 
                    {
                        userSelectedAvatar.UserAvatarID = UserAvatarID;
                        await db.SaveChangesAsync();
                    }
                    else
                    {
                        bool hasBoughtCategory = await db.PurchaseAvatars.AsNoTracking().CountAsync(pc => pc.UserID == user.ID && pc.UserAvatarID == UserAvatarID) > 0;

                        if (hasBoughtCategory)
                        {
                            userSelectedAvatar.UserAvatarID = UserAvatarID;
                            await db.SaveChangesAsync();
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
            var user = await db.Users.SingleOrDefaultAsync(u => u.UUID == UUID);
            if (user != null)
            {
                bool bought = false;
                var avatar = await db.UserAvatars.FindAsync(UserAvatarID);
                var selectedAvatar = await db.SelectedAvatars.SingleOrDefaultAsync(sc => sc.UserID == user.ID);

                if (avatar != null)
                {
                    bool hasBought = (UserAvatarID == Constants.DefaultUser.AvatarID) ? true : await db.PurchaseAvatars.CountAsync(pa => pa.UserID == user.ID && pa.UserAvatarID == UserAvatarID) > 0;
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

                            db.PurchaseAvatars.Add(newAvatar);

                            selectedAvatar.UserAvatarID = UserAvatarID;

                            bought = true;
                            await db.SaveChangesAsync();
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

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private async Task<bool> UserAvatarExists(int id)
        {
            return await db.UserAvatars.CountAsync(e => e.ID == id) > 0;
        }

        private ResponseMessageResult Response(HttpStatusCode Code)
        {
            return ResponseMessage(Request.CreateResponse(Code));
        }
    }
}