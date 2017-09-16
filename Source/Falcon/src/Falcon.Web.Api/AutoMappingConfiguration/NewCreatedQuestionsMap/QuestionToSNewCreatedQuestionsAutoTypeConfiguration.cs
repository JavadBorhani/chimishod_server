using AutoMapper;
using Falcon.Common;
using Falcon.EFCommonContext.DbModel;
using Falcon.Web.Models.Api;


namespace Falcon.Web.Api.AutoMappingConfiguration.NewCreatedQuestions
{
    public class QuestionToSNewCreatedQuestionsAutoTypeConfiguration : Profile
    {
        public QuestionToSNewCreatedQuestionsAutoTypeConfiguration()
        {
            CreateMap<Question, SNewCreatedQuestions>()
                .ForMember(sn => sn.ID ,                m => m.MapFrom(q => q.ID))
                .ForMember(sn => sn.What_if ,           m => m.MapFrom( q => q.What_if))
                .ForMember(sn => sn.But ,               m => m.MapFrom( q => q.But))
                .ForMember(sn => sn.Category_ID ,       m => m.MapFrom( q => q.Catgory_ID))
                .ForMember(sn => sn.Category_Name,      m => m.MapFrom(q => q.Category.Name))
                .ForMember(sn => sn.Yes_Count  ,        m => m.MapFrom( q => q.Yes_Count))
                .ForMember(sn => sn.No_Count ,          m => m.MapFrom( q => q.No_Count))
                .ForMember(sn => sn.Dislike_Count ,     m => m.MapFrom( q => q.Dislike_Count))
                .ForMember(sn => sn.VerifyState ,       m => m.UseValue((int)CreatedQuestionState.CreatedQuestionsVerified))
                .ForMember(sn => sn.ServerTime,         m => m.Ignore())
                .ForMember(sn => sn.RegisterDateTime ,  m => m.MapFrom( q => q.CreatedDate))
                .ForMember(sn => sn.CommentCount,       m => m.MapFrom(sn => sn.CommentCount));
        }
    }
}