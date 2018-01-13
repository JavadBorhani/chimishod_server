using AutoMapper;
using Falcon.EFCommonContext.DbModel;
using Falcon.Web.Models.Api.Level;

namespace Falcon.Web.Api.AutoMappingConfiguration.LevelMap
{
    public class LevelToSLevelAutoTypeConfiguration : Profile
    {
        public LevelToSLevelAutoTypeConfiguration()
        {
            CreateMap<Level, SLevel>()
                .ForMember(s => s.LevelNumber, m => m.MapFrom(l => l.LevelNumber))
                .ForMember(s => s.CoinPrize, m => m.MapFrom(l => l.CoinPrize))
                .ForMember(s => s.ScoreCeil, m => m.MapFrom(l => l.ScoreCeil))
                .ForMember(s => s.QuestID, m => m.MapFrom(l => l.QuestID))
                .ForMember(s => s.QuestType, m => m.MapFrom(l => l.QuestType))
                .ForMember(s => s.QuestTitle, m => m.MapFrom(l => l.QuestTitle));
        }
    }
}