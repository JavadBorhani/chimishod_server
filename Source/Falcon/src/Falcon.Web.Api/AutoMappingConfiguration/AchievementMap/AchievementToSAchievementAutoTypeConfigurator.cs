using AutoMapper;
using Falcon.EFCommonContext.DbModel;
using Falcon.Web.Models.Api;

namespace Falcon.Web.Api.AutoMappingConfiguration.AchievementMap
{
    public class AchievementToSAchievementAutoTypeConfigurator : Profile
    {
        public AchievementToSAchievementAutoTypeConfigurator()
        {
            CreateMap<Achievement, SAchievement>()
                .ForMember( opt => opt.Name , a => a.Ignore());           
        }
        
    }
}