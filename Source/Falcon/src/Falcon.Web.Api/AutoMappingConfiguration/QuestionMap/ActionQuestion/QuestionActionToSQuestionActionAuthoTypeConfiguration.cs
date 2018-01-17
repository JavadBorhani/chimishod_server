using AutoMapper;
using Falcon.EFCommonContext.DbModel;
using Falcon.Web.Models.Api;

namespace Falcon.Web.Api.AutoMappingConfiguration.QuestionMap.ActionQuestion
{
    public class QuestionActionToSQuestionActionAuthoTypeConfiguration : Profile
    {
        public QuestionActionToSQuestionActionAuthoTypeConfiguration()
        {
            CreateMap<QuestionAction, SActionQuestion>()
                .ForMember(s => s.ActionCoin, m => m.MapFrom( u => u.Coin))
                .ForMember(s => s.ActionId, m => m.MapFrom(u => u.ID))
                .ForMember(s => s.ActionNavigationPageNumber, m => m.MapFrom(u => u.ActionNavigationNumber))
                .ForMember(s => s.MarketPackageName, m => m.MapFrom(u => u.MarketPackageName))
                .ForMember(s => s.MarketIntentString, m => m.MapFrom(u => u.MarketIntentString))
                .ForMember(s => s.AppStoreUri, m => m.MapFrom(u => u.AppStoreUri));
        }

    }
}