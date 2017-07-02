using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Falcon.Web.Api.MaintenanceProcessing.Public
{
    public interface IUsersMaintenanceProcessor
    {
        Task<int> LevelUp(int Prize); // will return new amount of coin if the user has leveled up 
    }
}
