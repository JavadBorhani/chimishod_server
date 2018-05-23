using Falcon.Web.Api.Utilities;
using System.Collections.Concurrent;

namespace Falcon.Web.Api.MaintenanceProcessing.Public
{
    public class SUserDetail
    {
        public int ID { get; set; }
        public string UserName { get; set; }
        public string ImagePath { get; set; }
        public string UUID {get;set;}
        public string NotificationID { get; set; }
    }
    public interface IUsersInMemory : IInMemory<ConcurrentDictionary<int , SUserDetail>>
    {
        bool UpdateImagePath(int UserID , string Path);
        bool UpdateUserName(int UserID , string UserName);
        bool UpdateUserItem(int UserID , SUserDetail NewValue);
        bool UpdateNotificationID(int UserID, string NotificationID);
        bool AddItem(int UserID, SUserDetail Value);
        bool RemoveUser(int UserID);
        SUserDetail GetUser(string UUID);
    }
}