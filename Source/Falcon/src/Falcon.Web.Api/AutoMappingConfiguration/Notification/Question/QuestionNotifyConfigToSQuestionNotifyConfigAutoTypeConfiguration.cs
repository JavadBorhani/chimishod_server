using AutoMapper;
using Falcon.EFCommonContext.DbModel;
using Falcon.Web.Models.Api.Notification;

namespace Falcon.Web.Api.AutoMappingConfiguration.Notification.Question
{
    public class QuestionNotifyConfigToSQuestionNotifyConfigAutoTypeConfiguration : Profile
    {
        public QuestionNotifyConfigToSQuestionNotifyConfigAutoTypeConfiguration()
        {
            CreateMap<QuestionNotificationConfiguration, SQuestionNotificationConfiguration>()
                .ForMember(d => d.ID,                           m => m.MapFrom(s => s.ID))
                .ForMember(d => d.QuestionAnswerCountMinRange,  m => m.MapFrom(s => s.QuestionAnswerCountMinRange))
                .ForMember(d => d.QuestionAnswerCountMaxRange,  m => m.MapFrom(s => s.QuestionAnswerCountMaxRange))
                .ForMember(d => d.Active,                       m => m.MapFrom(s => s.Active));
        }
    }
}