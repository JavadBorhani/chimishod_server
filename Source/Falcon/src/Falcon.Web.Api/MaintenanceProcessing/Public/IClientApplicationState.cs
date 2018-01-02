using Falcon.Web.Models.Api.Config;

namespace Falcon.Web.Api.MaintenanceProcessing.Public
{
    public interface IClientApplicationState
    {
        SClientAppState State();
        void ReadStateFromDatabase();
    }
}