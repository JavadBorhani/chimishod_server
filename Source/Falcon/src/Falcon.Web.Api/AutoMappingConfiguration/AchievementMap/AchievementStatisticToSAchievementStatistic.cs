using AutoMapper;


namespace Falcon.Web.Api.AutoMappingConfiguration.AchievementMap
{
    public class AchievementStatisticToSAchievementStatistic : Profile
    {
        public AchievementStatisticToSAchievementStatistic()
        {
            //CreateMap<AchievementStatistic, SAchievementStatistic>()
            //    .ForMember(s => s.UserID ,                      m => m.MapFrom(a => a.UserID))
            //    .ForMember(s => s.LevelNumber ,                 m => m.MapFrom(a => a.LevelNumber))
            //    .ForMember(s => s.Score ,                       m => m.MapFrom(a => a.Score))
            //    .ForMember(s => s.PurchasedCategoryCount ,      m => m.MapFrom(a => a.PurchasedCategoryCount))
            //    .ForMember(s => s.PurchasedAvatarCount ,        m => m.MapFrom(a => a.PurchasedAvatarCount))
            //    .ForMember(s => s.CreatedQuestionsCount ,       m => m.MapFrom(a => a.CreatedQuestionsCount));
        }
    }
}