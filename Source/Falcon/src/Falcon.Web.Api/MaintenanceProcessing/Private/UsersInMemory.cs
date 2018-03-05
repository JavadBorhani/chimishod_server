using AutoMapper;
using Falcon.EFCommonContext;
using Falcon.EFCommonContext.DbModel;
using Falcon.Web.Api.MaintenanceProcessing.Public;
using Falcon.Web.Common;
using System;
using System.Collections.Concurrent;
using System.Linq;

namespace Falcon.Web.Api.MaintenanceProcessing.Private
{
    public class UsersInMemory : IUsersInMemory
    {
        private ConcurrentDictionary<int, SUserDetail> mUsers = new ConcurrentDictionary<int, SUserDetail>();

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

        public bool AddItem(int UserID, SUserDetail Value)
        {

            if (Value == null) return false;
            return mUsers.TryAdd(UserID, Value);
        }

        public ConcurrentDictionary<int, SUserDetail> GetState()
        {
            CheckIsAvailable();
            return mUsers;
        }

        public void ReadStateFromDatabase()
        {
            mUsers.Clear();

            var data = mDB.Set<User>().AsNoTracking().Select(u => new { u.ID, u.UserName , u.AvatarImagePath }).ToArray();

            for(int i = 0; i < data.Length; ++i )
            {
                mUsers.TryAdd(data[i].ID, new SUserDetail
                {
                    ImagePath = data[i].AvatarImagePath,
                    UserName = data[i].UserName,
                });
            }

        }

        public bool SetState(ConcurrentDictionary<int, SUserDetail> NewState)
        {
            throw new NotImplementedException();
        }

        public bool UpdateImagePath(int UserID , string Path)
        {
            SUserDetail item;
            mUsers.TryGetValue(UserID, out item);
            return mUsers.TryUpdate(UserID, new SUserDetail
            {
                ImagePath = Path,
                UserName = item.UserName
            }, item);
        }

        public bool UpdateUserName(int UserID, string UserName)
        {
            SUserDetail item;
            mUsers.TryGetValue(UserID, out item);
            return mUsers.TryUpdate(UserID, new SUserDetail
            {
                ImagePath = item.ImagePath,
                UserName = UserName
            }, item);
        }

        public bool UpdateUserNameAndImagePath( int UserID, SUserDetail NewValue)
        {
            SUserDetail item;
            mUsers.TryGetValue(UserID, out item);
            return mUsers.TryUpdate(UserID, NewValue, item);
        }
        private void CheckIsAvailable()
        {
            if (mUsers == null || mUsers.Count <= 0)
            {
                ReadStateFromDatabase();
            }
        }
    }
}