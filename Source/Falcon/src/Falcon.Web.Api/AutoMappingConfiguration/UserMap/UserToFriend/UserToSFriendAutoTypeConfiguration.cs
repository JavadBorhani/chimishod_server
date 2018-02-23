using AutoMapper;
using Falcon.EFCommonContext.DbModel;
using Falcon.Web.Models.Api.Friend;

namespace Falcon.Web.Api.AutoMappingConfiguration.UserMap.UserToFriend
{
    public class UserToSFriendAutoTypeConfiguration : Profile
    {
        public UserToSFriendAutoTypeConfiguration()
        {
            CreateMap<User, SFriend>()
                .ForMember(s => s.UserID, m => m.MapFrom(u => u.ID))
                .ForMember(s => s.UserName, m => m.MapFrom(u => u.UserName))
                .ForMember(s => s.UserPictureUrl, m => m.MapFrom(u => u.AvatarImagePath))
                .ForMember(s => s.GenderIsMale, m => m.MapFrom(u => u.IsMale))
                .ForMember(s => s.Status, m => m.UseValue(RelationStatus.None))
                .ForMember(s => s.UpdatedDate, m => m.Ignore())
                .ForMember(s => s.RelationOperatorIsMe, m => m.UseValue(false));
        }                 
    }
}