using AutoMapper;
using Falcon.EFCommonContext.DbModel;
using Falcon.Web.Models.Api;

namespace Falcon.Web.Api.AutoMappingConfiguration.ReportTypeMap
{
    public class ReportTypeToSReportTypeAutoTypeConfiguration : Profile
    {
        public ReportTypeToSReportTypeAutoTypeConfiguration()
        {
            CreateMap<ReportType, SReportType>()
                .ForMember(s => s.ID,           m => m.MapFrom(r => r.ID))
                .ForMember(s => s.Name,         m => m.MapFrom(r => r.Name))
                .ForMember(s => s.Description,  m => m.MapFrom(r => r.Description))
                .ForMember(s => s.ReportCountToFilter, m => m.MapFrom(r => r.ReportCountToFilter))
                .ForMember(s => s.ShouldBanUser, m => m.MapFrom(r => r.BanUser));
        }
    }
}