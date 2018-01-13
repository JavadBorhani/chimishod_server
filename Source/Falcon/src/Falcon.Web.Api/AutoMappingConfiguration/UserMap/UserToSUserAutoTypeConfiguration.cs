using AutoMapper;
using Falcon.EFCommonContext.DbModel;
using Falcon.Web.Models.Api;

namespace Falcon.Web.Api.AutoMappingConfiguration.UserMap
{
    public class UserToSUserAutoTypeConfiguration : Profile
    {
        public UserToSUserAutoTypeConfiguration()
        {
            CreateMap<User, SUser>()
                .ForMember(s => s.ID,               m => m.MapFrom(s => s.ID))
                .ForMember(s => s.UserName ,        m => m.MapFrom( s => s.UserName))
                .ForMember(s => s.LevelProgress,    m => m.MapFrom(s => s.LevelProgress))
                .ForMember(s => s.LevelNumber,      m => m.MapFrom(s => s.LevelNumber))
                .ForMember(s => s.TotalCoin,        m => m.MapFrom(s => s.TotalCoin))
                .ForMember(s => s.UUID,             m => m.MapFrom(s => s.UUID))
                .ForMember(s => s.AvatarImagePath,  m => m.MapFrom(s => s.AvatarImagePath))
                .ForMember(s => s.CurrentLevel ,    m => m.MapFrom(s => s.Level));
        }

    }

}