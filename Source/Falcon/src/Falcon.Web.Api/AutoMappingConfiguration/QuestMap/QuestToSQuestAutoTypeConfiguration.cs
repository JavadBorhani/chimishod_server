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
                .ForMember(s => s.CoinPrize, m => m.MapFrom(s => s.Mean_Score));
        }
    }
}