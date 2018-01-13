using AutoMapper;

namespace Falcon.Web.Api.AutoMappingConfiguration.UserMap.UserCountMap
{
    public class UserCountToSUserCountAutoTypeConfiguration : Profile
    { 
        public UserCountToSUserCountAutoTypeConfiguration()
        {
            //CreateMap<UserCount, SUserCount>()
            //    .ForMember(s => s.UserID, m => m.MapFrom(u => u.UserID))
            //    .ForMember(s => s.PurchasedCategoryCount, m => m.MapFrom(u => u.PurchasedCategoryCount))
            //    .ForMember(s => s.PurchasedThemeCount, m => m.MapFrom(u => u.PurchasedAvatarCount))
            //    .ForMember(s => s.PurchasedThemeCount, m => m.MapFrom(u => u.PurchasedThemeCount))
            //    .ForMember(s => s.CreatedQuestionsCount , m => m.MapFrom(u => u.CreatedQuestionsCount));

        }
    }
}