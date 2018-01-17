using AutoMapper;
using Falcon.Web.Models.Api.Config;

namespace Falcon.Web.Api.AutoMappingConfiguration.GameConfig
{
    public class GameConfigToSGameConfigAutoTypeConfiguration : Profile
    {
        public GameConfigToSGameConfigAutoTypeConfiguration()
        {
            CreateMap<EFCommonContext.DbModel.GameConfig, SGameConfig>()
                .ForMember(sqs => sqs.ID , m => m.MapFrom(qs => qs.ID))
                .ForMember(sqs => sqs.TotalNumberOfQuestions, m => m.MapFrom(qs => qs.TotalNumberOfQuestions))
                .ForMember(sqs => sqs.PeopleQuestionsPercent, m => m.MapFrom(qs => qs.PeopleQuestionsPercent))
                .ForMember(sqs => sqs.FunQuestionsPercent, m => m.MapFrom(qs => qs.FunQuestionsPercent))
                .ForMember(sqs => sqs.DefaultUserCoinAmount, m => m.MapFrom(qs => qs.DefaultUserCoinAmount))
                .ForMember(sqs => sqs.DefaultUserLevelNumber, m => m.MapFrom(qs => qs.DefaultUserLevelNumber))
                .ForMember(sqs => sqs.DefaultUserLevelProgress, m => m.MapFrom(qs => qs.DefaultUserLevelProgress))
                .ForMember(sqs => sqs.MaxReportCount, m => m.MapFrom(qs => qs.MaxReportCount))
                .ReverseMap();
        }
    }
}