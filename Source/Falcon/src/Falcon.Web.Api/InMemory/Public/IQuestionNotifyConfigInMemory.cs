using Falcon.Web.Api.Utilities;
using Falcon.Web.Models.Api.Notification;
using System.Collections.Concurrent;
using System.Collections.Generic;

namespace Falcon.Web.Api.InMemory.Public
{
    public interface IQuestionNotifyConfigInMemory : IInMemory<ConcurrentDictionary<int, SQuestionNotificationConfiguration>>
    {
        List<SQuestionNotificationConfiguration> GetAllItems();
        SQuestionNotificationConfiguration GetLastItem();
    }
}