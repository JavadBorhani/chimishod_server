using AutoMapper;
using Falcon.EFCommonContext.DbModel;
using Falcon.Web.Models.Api.Quest;

namespace Falcon.Web.Api.AutoMappingConfiguration.QuestMap
{
    public class QuestToSQuestAutoTypeConfiguration : Profile
    {

        public QuestToSQuestAutoTypeConfiguration()
        {
            CreateMap<Quest, SQuest>()
                .ForMember(s => s.QuestNumber, m => m.MapFrom(s => s.QuestNumber))
                .ForMember(s => s.QuestTypes, m => m.MapFrom(s => s.QuestTypes))
                .ForMember(s => s.QuestTitle, m => m.MapFrom(s => s.QuestTitle))
                .ForMember(s => s.QuestDescription, m => m.MapFrom(s => s.QuestDescription))
                .ForMember(s => s.QuestWhiteIcon, m => m.MapFrom(s => s.QuestWhiteIcon))
                .ForMember(s => s.QuestColoredIcon, m => m.MapFrom(s => s.QuestColoredIcon))
                .ForMember(s => s.QuestOffIcon, m => m.MapFrom(s => s.QuestOffIcon))
                .ForMember(s => s.BarretTypeID, m => m.MapFrom(s => s.BarrettType))
                .ForMember(s => s.ChildQuestNumbers, m => m.Ignore());
        }
    }
}