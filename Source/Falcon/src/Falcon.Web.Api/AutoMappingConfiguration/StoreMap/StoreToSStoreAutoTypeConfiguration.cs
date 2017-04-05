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
                .ForMember(s => s.ID,               m => m.MapFrom(s => s.ID))
                .ForMember(s => s.Name,             m => m.MapFrom(s => s.Name))
                .ForMember(s => s.Description,      m => m.MapFrom(s => s.Description))
                .ForMember(s => s.Star,             m => m.MapFrom(s => s.Star))
                .ForMember(s => s.Price,            m => m.MapFrom(s => s.Price))
                .ForMember(s => s.Icon,             m => m.MapFrom(s => s.Icon))
                .ForMember(s => s.RectangleColor,   m => m.MapFrom(s => s.RectangleColor))
                .ForMember(s => s.SKU,              m => m.MapFrom(s => s.SKU))
                .ReverseMap();
        }
    }
}