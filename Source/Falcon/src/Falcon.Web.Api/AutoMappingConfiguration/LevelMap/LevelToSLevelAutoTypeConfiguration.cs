using AutoMapper;
using Falcon.EFCommonContext.DbModel;
using Falcon.Web.Models.Api.Level;

namespace Falcon.Web.Api.AutoMappingConfiguration.LevelMap
{
    public class LevelToSLevelAutoTypeConfiguration : Profile
    {
        public LevelToSLevelAutoTypeConfiguration()
        {
            //CreateMap<Level, SLevel>()
            //    .ForMember(s => s.Coin, m => m.MapFrom(l => l.Star))
            //    .ForMember(s => s.Ceil , m => m.MapFrom(l => l.ScoreCeil))
            //    .ForMember(s => s.LevelNumber, m => m.MapFrom(l => l.LevelNumber));
        }
    }
}