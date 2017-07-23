using AutoMapper;
using Falcon.EFCommonContext.DbModel;
using Falcon.Web.Models.Api;

namespace Falcon.Web.Api.AutoMappingConfiguration.CategoryMap
{

    public class CategoryToSCategoryAutoTypeConfiguration : Profile
    {
        public CategoryToSCategoryAutoTypeConfiguration()
        {
            CreateMap<Category, SCategory>()
                .ForMember(s => s.ID,               ca => ca.MapFrom(y => y.ID))
                .ForMember(s => s.Name,             ca => ca.MapFrom(y => y.Name))
                .ForMember(s => s.ShortDescription, ca => ca.MapFrom(y => y.ShortDescription))
                .ForMember(s => s.LongDescription,  ca => ca.MapFrom(y => y.LongDescription))
                .ForMember(s => s.Price,            ca => ca.MapFrom(y => y.Price))
                .ForMember(s => s.Icon,             ca => ca.MapFrom(y => y.Icon))
                .ForMember(s => s.TagState,         ca => ca.MapFrom(y => y.TagStateID))
                .ForMember(s => s.DiscountAmount,   ca => ca.MapFrom(y => y.DiscountAmount))
                .ForMember(s => s.IsPurchased,      ca => ca.Ignore())
                .ForMember(s => s.IsActive,         ca => ca.Ignore())
                .ForMember(s => s.CharacterIds,     ca => ca.Ignore());
        }
    }
}