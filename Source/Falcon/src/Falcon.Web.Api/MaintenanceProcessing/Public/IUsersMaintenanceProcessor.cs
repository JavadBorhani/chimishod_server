﻿using Falcon.Web.Models.Api;
using Falcon.Web.Models.Api.User;
using System.Threading.Tasks;

namespace Falcon.Web.Api.MaintenanceProcessing.Public
{
    public interface IUsersMaintenanceProcessor
    {
        Task<int> LevelUp(int Prize); // will return new amount of coin if the user has leveled up 
        Task<SUser> CreateNewUser(SUserRegistrationForm RegistrationForm);
        Task<SUser> LoadUser(int UserID);
    }
}
