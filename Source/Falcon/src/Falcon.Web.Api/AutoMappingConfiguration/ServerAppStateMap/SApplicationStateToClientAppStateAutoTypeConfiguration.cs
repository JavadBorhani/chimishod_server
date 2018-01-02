using AutoMapper;

namespace Falcon.Web.Api.AutoMappingConfiguration.ServerAppStateMap
{
    public class SApplicationStateToClientAppStateAutoTypeConfiguration : Profile
    {
        public SApplicationStateToClientAppStateAutoTypeConfiguration()
        {
            //CreateMap<SApplicationState , ClientAppState>()
            //    .ForMember(c => c.FavoritePrice,                m => m.MapFrom(a => a.Favorite_FavoritePrice))
            //    .ForMember(c => c.CreateQuestionPrice,          m => m.MapFrom(a => a.Question_CreateQuestionPrice))
            //    .ForMember(c => c.AnswerXP,                     m => m.MapFrom(a => a.Prize_AnswerXP))
            //    .ForMember(c => c.LikeScoreAmount,              m => m.MapFrom(a => a.Prize_LikeScoreAmount))
            //    .ForMember(c => c.CreateNewQuestionScore,       m => m.MapFrom(a => a.Prize_CreateNewQuestionScore))
            //    .ForMember(c => c.CreateNewQuestionXP,          m => m.MapFrom(a => a.Prize_CreateNewQuestionXP))
            //    .ForMember(c => c.AnswerScoreAmount,            m => m.MapFrom(a => a.Prize_AnswerScoreAmount))
            //    .ForMember(c => c.WatchAdCoin ,                 m => m.MapFrom(a => a.WatchAdCoin))
            //    .ForMember(c => c.SpinWheelFortuneThreshold ,   m => m.MapFrom(a => a.SpinWheelFortuneThreshold))
            //    .ForMember(c => c.SpinWheelLoopPrice ,          m => m.MapFrom(a => a.SpinWheelLoopPrice));
        }
    }
}