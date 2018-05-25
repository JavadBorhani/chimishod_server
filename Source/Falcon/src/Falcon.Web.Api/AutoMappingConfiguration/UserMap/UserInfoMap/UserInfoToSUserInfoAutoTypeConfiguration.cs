using AutoMapper;
using Falcon.EFCommonContext.DbModel;
using Falcon.Web.Models.Api;

namespace Falcon.Web.Api.AutoMappingConfiguration.UserMap.UserInfoMap
{
    public class UserInfoToSUserInfoAutoTypeConfiguration : Profile
    {

        public UserInfoToSUserInfoAutoTypeConfiguration()
        {
            CreateMap<UserInfo, SUserInfo>()
                .ForMember(s => s.UserName, m => m.MapFrom(u => u.User.UserName))
                .ForMember(s => s.Email, m => m.MapFrom(u => u.Email))
                .ForMember(s => s.HasRegistered, m => m.Ignore())
                .ForMember(s => s.NotificationID, m => m.Ignore())
                .ForMember(s => s.APILevel, m => m.Ignore())
                .ForMember(s => s.Device, m => m.Ignore())
                .ForMember(s => s.Model, m => m.Ignore())
                .ForMember(s => s.Platform, m => m.Ignore());
        }
    }
}