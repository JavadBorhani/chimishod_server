// Flapp Copyright 2017-2018
using Falcon.Web.Models.Api;

namespace Falcon.Web.Api.MaintenanceProcessing.Public
{
    public interface IGlobalApplicationState
    {
        SApplicationState GetState();
        bool SetState(SApplicationState NewState);
        void ReadStateFromDatabase();
    }
}
