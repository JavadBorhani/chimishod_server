using AutoMapper;
using Falcon.Web.Models.Api.Config;

namespace Falcon.Web.Api.AutoMappingConfiguration.GameConfig
{
    public class QSConfigToSQuestionSelectorAutoTypeConfiguration : Profile
    {
        public QSConfigToSQuestionSelectorAutoTypeConfiguration()
        {
            CreateMap<EFCommonContext.DbModel.GameConfig, SGameConfig>()
                .ForMember(sqs => sqs.ID , m => m.MapFrom(qs => qs.ID))
                .ForMember(sqs => sqs.TotalNumberOfQuestions, m => m.MapFrom(qs => qs.TotalNumberOfQuestions))
                .ForMember(sqs => sqs.PeopleQuestionsPercent, m => m.MapFrom(qs => qs.PeopleQuestionsPercent))
                .ForMember(sqs => sqs.FunQuestionsPercent, m => m.MapFrom(qs => qs.FunQuestionsPercent))
                .ReverseMap();
        }
    }
}