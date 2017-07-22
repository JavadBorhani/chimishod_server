using AutoMapper;
using Falcon.Common;
using Falcon.EFCommonContext.DbModel;
using Falcon.Web.Models.Api;

namespace Falcon.Web.Api.AutoMappingConfiguration.AchievementMap
{
    public class AchievementToSAchievementAutoTypeConfigurator : Profile
    {
        public AchievementToSAchievementAutoTypeConfigurator()
        {
            CreateMap<Achievement, SAchievement>()
                .ForMember(s => s.ID, a => a.MapFrom(b => b.ID))
                .ForMember(s => s.Name, a => a.MapFrom(b => b.Name))
                .ForMember(s => s.Description, a => a.MapFrom(b => b.Description))
                .ForMember(s => s.Star, a => a.MapFrom(b => b.Coin))
                .ForMember(s => s.Prize , a => a.MapFrom( b => b.ScorePrize))
                .ForMember(s => s.Icon, a => a.MapFrom(b => b.Icon))
                .ForMember(s => s.AchievementState, a => a.UseValue((int)AchievementState.AchievementDefaultAchievableID));
        }
    }
}