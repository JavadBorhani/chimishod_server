using AutoMapper;
using Falcon.EFCommonContext.DbModel;
using Falcon.Web.Api.InMemory.Public;
using Falcon.Web.Common;
using Falcon.Web.Models.Api;

namespace Falcon.Web.Api.AutoMappingConfiguration.UserMap
{
    public class UserToSUserAutoTypeConfiguration : Profile
    {
        public virtual IQuestAndLevelInMemory QuestInMemory
        {
            get
            {
                return WebContainerManager.Get<IQuestAndLevelInMemory>();
            }
        }

        public UserToSUserAutoTypeConfiguration()
        {
            CreateMap<User, SUser>()
                .ForMember(s => s.ID,               m => m.MapFrom(s => s.ID))
                .ForMember(s => s.UserName,         m => m.MapFrom(s => s.UserName))
                .ForMember(s => s.LevelProgress,    m => m.MapFrom(s => s.LevelProgress))
                .ForMember(s => s.GenderIsMale,     m => m.MapFrom(s => s.IsMale))
                .ForMember(s => s.LevelNumber,      m => m.MapFrom(s => s.LevelNumber))
                .ForMember(s => s.QuestNumber,      m => m.MapFrom(s => s.QuestNumber))
                .ForMember(s => s.TotalCoin,        m => m.MapFrom(s => s.TotalCoin))
                .ForMember(s => s.UUID,             m => m.MapFrom(s => s.UUID))
                .ForMember(s => s.AvatarImagePath,  m => m.MapFrom(s => s.AvatarImagePath))
                .ForMember(s => s.CurrentLevel,     m => m.MapFrom(s => s.Level))
                .ForMember(s => s.QuestState,       m => m.Ignore());
        }



    }

}