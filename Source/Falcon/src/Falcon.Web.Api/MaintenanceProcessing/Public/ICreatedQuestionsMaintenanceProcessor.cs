using Falcon.Web.Models.Api;
using Falcon.Web.Models.Api.Input;
using Falcon.Web.Models.Api.Input.Questions;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;

namespace Falcon.Web.Api.MaintenanceProcessing.Public
{
    public interface ICreatedQuestionsMaintenanceProcessor
    {
        Task<bool> DeleteLogically(RemoveInfo Info);
        Task<bool> Edit(EditInfo Info);
    }
}