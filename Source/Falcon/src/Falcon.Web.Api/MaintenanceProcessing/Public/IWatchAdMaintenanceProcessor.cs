// Flapp Copyright 2017-2018
using Falcon.Web.Models.Api;
using System.Threading.Tasks;

namespace Falcon.Web.Api.MaintenanceProcessing.Public
{
    public interface IWatchAdMaintenanceProcessor
    {
        /// <summary>
        /// Return New User TotalCoin 
        /// </summary>
        /// <param name="WatchAdValidation"></param>
        /// <returns></returns>
        Task<int> ValidateWatchAd(SWatchAdValidation WatchAdValidation);

        /// <summary>
        /// Will check only level up video and save for user without increasing coin and return watch ad multiplier
        /// </summary>
        /// <param name="WatchAdValidation"></param>
        /// <returns></returns>
        Task<bool> ValidateLevelUpWatchAd(SWatchAdValidation WatchAdValidation);
    }
}