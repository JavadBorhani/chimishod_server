using AutoMapper;
using Falcon.EFCommonContext.DbModel;
using Falcon.Web.Models.Api.Barrett;

namespace Falcon.Web.Api.AutoMappingConfiguration.BarretType
{
    public class BarrettTypeToSBarrettTypeAutoTypeConfiguration : Profile
    {
        public BarrettTypeToSBarrettTypeAutoTypeConfiguration()
        {
            CreateMap<BarrettType, SBarrettType>()
                .ForMember(s => s.ID,           m => m.MapFrom(u => u.ID))
                .ForMember(s => s.Name,         m => m.MapFrom(u => u.Name))
                .ForMember(s => s.Description,  m => m.MapFrom(u => u.Description))
                .ForMember(s => s.Separator,    m => m.MapFrom(u => u.Separator));

        }
    }
}