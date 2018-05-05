using AutoMapper;
using Falcon.EFCommonContext.DbModel;
using Falcon.Web.Models.Api.Quest;

namespace Falcon.Web.Api.AutoMappingConfiguration.QuestMap.QuestScore
{
    public class QuestScoreSnapshotToSQuestScoreSnapshotAutoTypeConfiguration : Profile
    {
       
        public QuestScoreSnapshotToSQuestScoreSnapshotAutoTypeConfiguration()
        {
            CreateMap<QuestScoreSnapshot, SQuestScoreSnapshot>()
                .ForMember(d => d.UserID, m => m.MapFrom(s => s.UserID))
                .ForMember(d => d.UserLevelNumber, m => m.MapFrom(s => s.UserLevelNumber))
                .ForMember(d => d.QuestNumber, m => m.MapFrom(s => s.QuestNumber))
                .ForMember(d => d.ScorePoint, m => m.MapFrom(s => s.ScorePoint));
        }
    }
}