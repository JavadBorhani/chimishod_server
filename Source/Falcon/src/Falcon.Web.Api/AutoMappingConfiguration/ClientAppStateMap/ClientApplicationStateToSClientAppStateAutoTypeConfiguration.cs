using AutoMapper;
using Falcon.EFCommonContext.DbModel;
using Falcon.Web.Models.Api.Config;

namespace Falcon.Web.Api.AutoMappingConfiguration.ClientAppStateMap
{
    public class ClientApplicationStateToSClientAppStateAutoTypeConfiguration : Profile
    {
        public ClientApplicationStateToSClientAppStateAutoTypeConfiguration()
        {
            CreateMap<ClientApplicationState, SClientAppState>()
                .ForMember(s => s.ClientVersion, m => m.MapFrom(c => c.ClientVersionInfo))
                .ForMember(s => s.IsMajorChange , m => m.MapFrom(c => c.IsMajorVersion))
                .ForMember(s => s.CreateQuestionPrice , m => m.MapFrom( c => c.CreateQuestionPrice))
                .ForMember(s => s.WatchAdCoin , m => m.MapFrom(c => c.WatchAdCoin))
                .ForMember(s => s.LevelVersionCode , m => m.MapFrom(c => c.LevelVersionCode))
                .ForMember(s => s.PollingIntervalTimeInSeconds, m => m.MapFrom(c => c.PollingIntervalTimeInSeconds))
                .ForMember(s => s.XPLevelFactor, m => m.MapFrom(c => c.XPLevelFactor));
        }
    }
}