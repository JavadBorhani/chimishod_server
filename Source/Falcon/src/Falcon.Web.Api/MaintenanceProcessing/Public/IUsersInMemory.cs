using Falcon.Web.Api.Utilities;
using System.Collections.Concurrent;

namespace Falcon.Web.Api.MaintenanceProcessing.Public
{
    public class SUserDetail
    {
        public string UserName { get; set; }
        public string ImagePath { get; set; }
    }
    public interface IUsersInMemory : IInMemory<ConcurrentDictionary<int , SUserDetail>>
    {
        bool UpdateImagePath(int UserID , string Path);
        bool UpdateUserName(int UserID , string UserName);
        bool UpdateUserNameAndImagePath(int UserID , SUserDetail NewValue);
        bool AddItem(int UserID, SUserDetail Value);
    }
}