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
        private ConcurrentDictionary<string, SUserDetail> mUUIDUsers = new ConcurrentDictionary<string, SUserDetail>();

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

            if (Value == null)
                return false;

            var uuidAdded = mUUIDUsers.TryAdd(Value.UUID, Value);
            var userAdded = mUsers.TryAdd(UserID, Value); 

            return uuidAdded && userAdded;
        }

        public ConcurrentDictionary<int, SUserDetail> GetState()
        {
            CheckIsAvailable();
            return mUsers;
        }

        public void ReadStateFromDatabase()
        {
            mUsers.Clear();

            var data = mDB.Set<User>().AsNoTracking()
                .Where(u => u.Activated)
                .Select(u => new { u.ID, u.UserName , u.AvatarImagePath , u.NotificationID , u.UUID})
                .ToArray();

            for(int i = 0; i < data.Length; ++i )
            {
                var item = new SUserDetail
                {
                    ID = data[i].ID,
                    ImagePath = data[i].AvatarImagePath,
                    UserName = data[i].UserName,
                    UUID = data[i].UserName,
                    NotificationID = data[i].NotificationID
                };

                mUsers.TryAdd(data[i].ID, item);
                mUUIDUsers.TryAdd(data[i].UUID, item);
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
                ID = item.ID,
                UserName = item.UserName,
                NotificationID = item.NotificationID,
                UUID = item.UUID,
                ImagePath = Path,
            }, item);
        }

        public bool UpdateUserName(int UserID, string UserName)
        {
            SUserDetail item;
            mUsers.TryGetValue(UserID, out item);
            
            return mUsers.TryUpdate(UserID, new SUserDetail
            {
                ID = item.ID,
                ImagePath = item.ImagePath,
                NotificationID = item.NotificationID,
                UUID = item.UUID,
                UserName = UserName,
            }, item);
        }

        public bool UpdateUserItem( int UserID, SUserDetail NewValue)
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

        public bool RemoveUser(int UserID)
        {
            SUserDetail user;
            SUserDetail uuid;
            var userRemoved = mUsers.TryRemove(UserID, out user);
            var uuidRemoved = mUUIDUsers.TryRemove(user.UUID , out uuid);

            return userRemoved && uuidRemoved;
        }

        public bool UpdateNotificationID(int UserID, string NotificationID)
        {
            SUserDetail item;
            mUsers.TryGetValue(UserID, out item);
            return mUsers.TryUpdate(UserID, new SUserDetail
            {
                ID = item.ID,
                UUID = item.UUID,
                ImagePath = item.ImagePath,
                UserName = item.UserName,
                NotificationID = NotificationID,
            }, item);
        }

        public SUserDetail GetUser(string UUID)
        {
            SUserDetail item;
            mUUIDUsers.TryGetValue(UUID, out item);
            return item;
        }
    }
}