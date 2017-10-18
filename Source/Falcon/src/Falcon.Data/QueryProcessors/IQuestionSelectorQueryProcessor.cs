﻿using Falcon.Web.Models.Api;
using System.Threading.Tasks;

namespace Falcon.Data.QueryProcessors
{
    public interface IQuestionSelectorQueryProcessor
    {
        Task<SQuestion> GetVerifiedQuestions(int Amount);
        Task<SQuestion> GetCreatedQuestions(int Amount);
        Task<SQuestion> GetBoostedQuestions(int Amount);
        Task<SQuestion> GetActionBaseQuestions(int Amount);
    }
}
