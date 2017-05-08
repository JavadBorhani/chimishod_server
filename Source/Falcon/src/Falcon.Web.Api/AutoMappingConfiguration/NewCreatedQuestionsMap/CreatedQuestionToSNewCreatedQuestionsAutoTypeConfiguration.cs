using AutoMapper;
using Falcon.Common;
using Falcon.EFCommonContext.DbModel;
using Falcon.Web.Models.Api;

namespace Falcon.Web.Api.AutoMappingConfiguration.NewCreatedQuestions
{
    public class CreatedQuestionToSNewCreatedQuestionsAutoTypeConfiguration : Profile
    {
        public CreatedQuestionToSNewCreatedQuestionsAutoTypeConfiguration()
        {
            CreateMap<CreatedQuestion, SNewCreatedQuestions>()
                .ForMember(sn => sn.ID,                 m => m.UseValue(Constants.DefaultValues.CreatedQuestionsDefaultID))
                .ForMember(sn => sn.What_if,            m => m.MapFrom(cq => cq.What_if))
                .ForMember(sn => sn.But,                m => m.MapFrom(cq => cq.But))
                .ForMember(sn => sn.Category_ID,        m => m.MapFrom(cq => cq.CategoryID))
                .ForMember(sn => sn.Category_Name,      m => m.MapFrom(cq => cq.Category.Name))
                .ForMember(sn => sn.Yes_Count,          m => m.Ignore())
                .ForMember(sn => sn.No_Count,           m => m.Ignore())
                .ForMember(sn => sn.Like_Count,         m => m.Ignore())
                .ForMember(sn => sn.Dislike_Count,      m => m.Ignore())
                .ForMember(sn => sn.ServerTime,         m => m.Ignore())
                .ForMember(sn => sn.VerifyState ,       m => m.MapFrom( cq => cq.VerifyStateID))
                .ForMember(sn => sn.RegisterDateTime ,  m => m.MapFrom(cq => cq.RegisterDateTime));
        }
    }
}