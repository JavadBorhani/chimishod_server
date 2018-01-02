using AutoMapper;
using Falcon.Web.Models.Api.Config;

namespace Falcon.Web.Api.AutoMappingConfiguration.ClientAppStateMap
{
    public class SClientAppStateToClientVersionInfoAutoTypeConfiguration : Profile
    {
        public SClientAppStateToClientVersionInfoAutoTypeConfiguration()
        {
            CreateMap<SClientAppState, SClientVersionInfo>()
                .ForMember(c => c.VersionNumber, m => m.MapFrom(s => s.ClientVersion))
                .ForMember(c => c.IsMajorVersion, m => m.MapFrom(s => s.IsMajorChange));
        }
    }
}