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
                .ForMember(s => s.ClientVersion, m => m.MapFrom(c => c.CreateQuestionPrize));
        }
    }
}