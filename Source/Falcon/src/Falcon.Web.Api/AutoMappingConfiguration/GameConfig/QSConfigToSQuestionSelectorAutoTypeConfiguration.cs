using AutoMapper;
using Falcon.EFCommonContext.DbModel;
using Falcon.Web.Models.Api.Config;

namespace Falcon.Web.Api.AutoMappingConfiguration.GameConfig
{
    public class QSConfigToSQuestionSelectorAutoTypeConfiguration : Profile
    {
        public QSConfigToSQuestionSelectorAutoTypeConfiguration()
        {
            CreateMap<QuestionSelectorConfig, SQuestionSelectorConfig>()
                .ForMember(sqs => sqs.ID , m => m.MapFrom(qs => qs.ID))
                .ForMember(sqs => sqs.TotalNumberOfQuestions, m => m.MapFrom(qs => qs.TotalNumberOfQuestions))
                .ForMember(sqs => sqs.CreatedQuestionsPercent, m => m.MapFrom(qs => qs.CreatedQuestionsPercent))
                .ForMember(sqs => sqs.VerifiedQuestionsPercent, m => m.MapFrom(qs => qs.VerifiedQuestionsPercent))
                .ForMember(sqs => sqs.BoostedQuestionsPercent, m => m.MapFrom(qs => qs.BoostedQuestionsPercent))
                .ForMember(sqs => sqs.ActionBasedQuestionsPercent, m => m.MapFrom(qs => qs.ActionBasedQuestionsPercent));
        }
    }
}