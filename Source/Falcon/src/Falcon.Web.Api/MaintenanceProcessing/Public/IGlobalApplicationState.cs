using Falcon.Web.Models.Api;

namespace Falcon.Web.Api.MaintenanceProcessing.Public
{
    public interface IGlobalApplicationState
    {
        SApplicationState State();
        bool SetState(SApplicationState NewState);
        void ReadStateFromDatabase();
    }
}
