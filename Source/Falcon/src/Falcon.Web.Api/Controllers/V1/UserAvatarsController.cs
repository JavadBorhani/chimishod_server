// Flapp Copyright 2017-2018

using Falcon.Common;
using Falcon.Common.Security;
using Falcon.Data.QueryProcessors;
using Falcon.EFCommonContext;
using Falcon.Web.Api.Utilities.Base;
using Falcon.Web.Common;

namespace Falcon.Web.Api.Controllers.V1
{
    [UnitOfWorkActionFilter]
    public class UserAvatarsController : FalconApiController
    {
        private readonly IDbContext mDb;
        private readonly IDateTime mDateTime;
        private readonly IWebUserSession mUserSession;
        private readonly IUserQueryProcessor mUserQuery;

        public UserAvatarsController(IDateTime DateTime, IDbContext Database , IWebUserSession UserSession , IUserQueryProcessor UserQuery)
        {
            mDateTime = DateTime;
            mDb = Database;
            mUserSession = UserSession;
            mUserQuery = UserQuery;
        }


        //[ResponseType(typeof(SUserAvatar))]
        //[Route("UserAvatars/")]
        //[HttpPost]
        //public async Task<IHttpActionResult> GetUserFacePictureList()
        //{
        //        var avatars = await mDb.Set<UserAvatar>().AsNoTracking().ToArrayAsync();
        //        var selectedAvatar = await mDb.Set<SelectedAvatar>().AsNoTracking().Where(st => st.UserID == mUserSession.ID).Select(sc => sc.UserAvatarID).SingleOrDefaultAsync();
        //        var purchasedAvatars = await mDb.Set<PurchaseAvatar>().AsNoTracking().Where(pt => pt.UserID == mUserSession.ID).Select(c => c.UserAvatarID).ToListAsync();

        //        if (avatars.Length > 0 && selectedAvatar > 0 && purchasedAvatars.Count >= 0)
        //        {
        //            var userAvatars = new SUserAvatar[avatars.Length];

        //            for (int i = 0; i < userAvatars.Length; ++i)
        //            {
        //            userAvatars[i] = new SUserAvatar
        //            {
        //                ID = avatars[i].ID,
        //                PicUrl = avatars[i].PicUrl,
        //                Price = avatars[i].Price,
        //                Name =  avatars[i].Name,
        //                IsPurchased = (avatars[i].ID == Constants.DefaultUser.AvatarID) ? true : purchasedAvatars.Contains(avatars[i].ID), // TODO : remember to remove what has checked to decrease checking time
        //                IsActive = (selectedAvatar == avatars[i].ID) ? true : false,
        //                DiscountAmount = avatars[i].DiscountAmount,
        //                TagState = avatars[i].TagStateID
        //                };
        //            }

        //            return Ok(userAvatars);
        //        }

        //        return Response(HttpStatusCode.NotFound);
        //}

        //[ResponseType(typeof(SAvatarState))]
        //[Route("UserAvatars/Select/{UserAvatarID}")]
        //[HttpPost]
        //public async Task<IHttpActionResult> SelectUserFacePicture(int UserAvatarID)
        //{
        //    var user = await mDb.Set<User>().AsNoTracking()
        //                                .Where(u => u.UUID == mUserSession.UUID)
        //                                .Select(u => new { u.ID, u.TotalCoin })
        //                                .SingleOrDefaultAsync();

        //    if (user != null)
        //    {
        //        var userSelectedAvatar = await mDb.Set<SelectedAvatar>().Where(sa => sa.UserID == user.ID)
        //                                                        .Include( sa => sa.UserAvatar)
        //                                                        .SingleOrDefaultAsync();

        //        if (await UserAvatarExists(UserAvatarID))
        //        {
        //            if (UserAvatarID == Constants.DefaultUser.CategoryID) 
        //            {
        //                userSelectedAvatar.UserAvatarID = UserAvatarID;
        //                await mDb.SaveChangesAsync();
        //            }
        //            else
        //            {
        //                bool hasBoughtCategory = await mDb.Set<PurchaseAvatar>().AsNoTracking().CountAsync(pc => pc.UserID == user.ID && pc.UserAvatarID == UserAvatarID) > 0;

        //                if (hasBoughtCategory)
        //                {
        //                    userSelectedAvatar.UserAvatarID = UserAvatarID;
        //                    await mDb.SaveChangesAsync();
        //                }
        //                else
        //                {
        //                    return Response(HttpStatusCode.Unauthorized);
        //                }
        //            }

        //            var avatarState = new SAvatarState
        //            {
        //                TotalStar = user.TotalCoin,
        //                ID = userSelectedAvatar.ID,
        //                PicUrl = userSelectedAvatar.UserAvatar.PicUrl,
        //            };

        //            return Ok(avatarState);
        //        }
        //        else
        //        {
        //            return Response(HttpStatusCode.Unauthorized);
        //        }
        //    }
        //    else
        //    {
        //        return Response(HttpStatusCode.Unauthorized);
        //    }
        //}

        //[ResponseType(typeof(SAvatarState))]
        //[Route("UserAvatars/Purchase/{UserAvatarID}")]
        //[HttpPost]
        //public async Task<IHttpActionResult> PurchaseUserAvatar(int UserAvatarID)
        //{
        //    var user = await mDb.Set<User>().SingleOrDefaultAsync(u => u.UUID == mUserSession.UUID);
        //    if (user != null)
        //    {
        //        bool bought = false;
        //        var avatar = await mDb.Set<UserAvatar>().FindAsync(UserAvatarID);
        //        var selectedAvatar = await mDb.Set<SelectedAvatar>().SingleOrDefaultAsync(sc => sc.UserID == user.ID);
        //        int totalCoin;
        //        if (avatar != null)
        //        {
        //            bool hasBought = (UserAvatarID == Constants.DefaultUser.AvatarID) ? true : await mDb.Set<PurchaseAvatar>().CountAsync(pa => pa.UserID == user.ID && pa.UserAvatarID == UserAvatarID) > 0;
        //            if (hasBought)
        //            {
        //                return Response(HttpStatusCode.Conflict);
        //            }
        //            else
        //            {
        //                if (user.TotalCoin - avatar.Price >= 0)
        //                {
        //                    totalCoin = await mUserQuery.DecreaseCoin(avatar.Price);

        //                    if (totalCoin < 0)
        //                        throw new BusinessRuleViolationException("concurrency issue on purchase");

        //                    PurchaseAvatar newAvatar = new PurchaseAvatar
        //                    {
        //                        UserID = user.ID,
        //                        UserAvatarID = avatar.ID,
        //                        PurchasedDate = mDateTime.Now
        //                    };

        //                    mDb.Set<PurchaseAvatar>().Add(newAvatar);

        //                    selectedAvatar.UserAvatarID = UserAvatarID;

        //                    bought = true;
        //                    await mDb.SaveChangesAsync();
        //                }
        //            }
        //        }

        //        var clientResult = new SAvatarState
        //        {
        //            TotalStar = user.TotalCoin,
        //            ID = avatar.ID,
        //            PicUrl = avatar.PicUrl,
        //            Purchased = bought,
        //            RequestID = UserAvatarID,
        //        };
        //        return Ok(clientResult);
        //    }

        //    return NotFound();
        //}

        //private async Task<bool> UserAvatarExists(int id)
        //{
        //    return await mDb.Set<UserAvatar>().CountAsync(e => e.ID == id) > 0;
        //}
    }
}