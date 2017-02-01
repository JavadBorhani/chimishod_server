using AutoMapper;
using Falcon.EFCommonContext.DbModel;
using Falcon.Web.Models.Api;

namespace Falcon.Web.Api.AutoMappingConfiguration.ApplicationStateMap
{
    public class ApplicationStateToSApplicationStateAutoTypeConfiguration : Profile
    {
        public ApplicationStateToSApplicationStateAutoTypeConfiguration()
        {
            CreateMap<ApplicationState, SApplicationState>()
                .ForMember(s => s.ID,                   ca => ca.MapFrom(y => y.ID))
                .ForMember(s => s.FavoritePrice,        ca => ca.MapFrom(y => y.FavoritePrice))
                .ForMember(s => s.CreateQuestionPrice,  ca => ca.MapFrom(y => y.CreateQuestionPrice))
                .ForMember(s => s.DefaultUserCoin,      ca => ca.MapFrom(y => y.DefaultUserCoin))
                .ForMember(s => s.CreateQuestionPrice,  ca => ca.MapFrom(y => y.CreateQuestionPrice));
    }
    }
}