using Falcon.Web.Models.Api;

namespace Falcon.Web.Api.MaintenanceProcessing.Public
{
    interface IGlobalApplicationState
    {
        SApplicationState GetState();
        bool SetState(SApplicationState NewState);
        void ReadStateFromDatabase();
    }
}
