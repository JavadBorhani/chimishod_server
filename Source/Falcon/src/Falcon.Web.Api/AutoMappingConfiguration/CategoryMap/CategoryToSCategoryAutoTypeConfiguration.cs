using AutoMapper;

namespace Falcon.Web.Api.AutoMappingConfiguration.CategoryMap
{

    public class CategoryToSCategoryAutoTypeConfiguration : Profile
    {
        public CategoryToSCategoryAutoTypeConfiguration()
        {
            //CreateMap<Category, SCategory>()
            //    .ForMember(s => s.ID,               ca => ca.MapFrom(y => y.ID))
            //    .ForMember(s => s.Name,             ca => ca.MapFrom(y => y.Name))
            //    .ForMember(s => s.ShortDescription, ca => ca.MapFrom(y => y.ShortDescription))
            //    .ForMember(s => s.LongDescription,  ca => ca.MapFrom(y => y.LongDescription))
            //    .ForMember(s => s.Price,            ca => ca.MapFrom(y => y.Price))
            //    .ForMember(s => s.Icon,             ca => ca.MapFrom(y => y.Icon))
            //    .ForMember(s => s.TagState,         ca => ca.MapFrom(y => y.TagStateID))
            //    .ForMember(s => s.ScoreCoefficient, ca => ca.MapFrom(y => y.ScoreCoefficient))
            //    .ForMember(s => s.DiscountAmount,   ca => ca.MapFrom(y => y.DiscountAmount))
            //    .ForMember(s => s.Priority,         ca => ca.MapFrom(y => y.Priority))
            //    .ForMember(s => s.IsPurchased,      ca => ca.Ignore())
            //    .ForMember(s => s.IsActive,         ca => ca.Ignore())
            //    .ForMember(s => s.CharacterIds,     ca => ca.Ignore());
        }
    }
}