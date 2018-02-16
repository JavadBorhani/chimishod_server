using Falcon.Web.Api.Utilities;
using Falcon.Web.Models.Api.Quest;
using System.Collections.Generic;

namespace Falcon.Web.Api.InquiryProcessing.Public
{
    public interface IQuestInMemoryProcessor : IInMemory<Dictionary<int , SQuest>>
    {

    }
}