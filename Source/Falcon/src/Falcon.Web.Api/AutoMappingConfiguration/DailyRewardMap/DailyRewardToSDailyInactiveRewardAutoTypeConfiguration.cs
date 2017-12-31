using AutoMapper;

namespace Falcon.Web.Api.AutoMappingConfiguration.DailyRewardMap
{
    public class DailyRewardToSDailyInactiveRewardAutoTypeConfiguration : Profile
    {
        public DailyRewardToSDailyInactiveRewardAutoTypeConfiguration()
        {
            //CreateMap<DailyReward, SDailyReward>()
            //    .ForMember(s => s.ID, m => m.MapFrom(d => d.ID))
            //    .ForMember(s => s.Name, m => m.MapFrom(d => d.Name))
            //    .ForMember(s => s.Icon, m => m.MapFrom(d => d.Icon))
            //    .ForMember(s => s.Day, m => m.MapFrom(d => d.Day))
            //    .ForMember(s => s.Prize, m => m.MapFrom(d => d.Prize))
            //    .ForMember(s => s.State, m => m.UseValue(DailyRewardState.NotCollectible));
        }
    }
}