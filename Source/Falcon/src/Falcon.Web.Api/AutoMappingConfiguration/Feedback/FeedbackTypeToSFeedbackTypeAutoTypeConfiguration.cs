using AutoMapper;
using Falcon.EFCommonContext.DbModel;
using Falcon.Web.Models.Api.Feedback;

namespace Falcon.Web.Api.AutoMappingConfiguration.Feedback
{
    public class FeedbackTypeToSFeedbackTypeAutoTypeConfiguration : Profile
    {

        public FeedbackTypeToSFeedbackTypeAutoTypeConfiguration()
        {
            CreateMap<FeedbackType, SFeedbackType>()
                .ForMember(s => s.ID, m => m.MapFrom(s => s.ID))
                .ForMember(s => s.Name, m => m.MapFrom(s => s.Name))
                .ForMember(s => s.Description, m => m.MapFrom(s => s.Description))
                .ReverseMap();
        }
    }
}