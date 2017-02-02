using AutoMapper;
using Falcon.EFCommonContext.DbModel;
using Falcon.Web.Models.Api;

namespace Falcon.Web.Api.AutoMappingConfiguration.StoreMap
{
    public class StoreToSStoreAutoTypeConfiguration  : Profile
    {
        public StoreToSStoreAutoTypeConfiguration()
        {
            CreateMap<Store, SStore>()
                .ForMember(s => s.ID, m => m.MapFrom(s => s.ID));
        }
    }
}