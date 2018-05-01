using AutoMapper;
using Falcon.Web.Models.Api.Quest;

namespace Falcon.Web.Api.AutoMappingConfiguration.BarretType
{
    using EFCommonContext.DbModel;

    public class BarretTypeToSFinaleQuestAutoTypeConfiguration : Profile
    {
        public BarretTypeToSFinaleQuestAutoTypeConfiguration()
        {
            CreateMap<BarrettType, SFinaleQuest>()
                .ForMember(s => s.ID , m => m.MapFrom(u => u.ID))
                .ForMember(s => s.Title , m => m.MapFrom(u => u.Name))
                .ForMember(s => s.Description, m => m.Ignore());            
        }
    }
}