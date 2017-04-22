using Falcon.Web.Models.Api;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Falcon.Data.QueryProcessors
{
    public interface INotificationsQueryProcessor
    {
        Task<bool> AddDisplayedNotification(SDisplayedNotification DisplayedNotification); //TODO : Refactor Input to some generic interface
        Task<List<int>> GetDisplayedIdList();
    }
}
