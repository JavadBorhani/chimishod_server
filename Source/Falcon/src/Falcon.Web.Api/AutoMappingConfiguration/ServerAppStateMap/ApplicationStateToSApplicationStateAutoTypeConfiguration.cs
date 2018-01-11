using AutoMapper;
using Falcon.EFCommonContext.DbModel;
using Falcon.Web.Models.Api;

namespace Falcon.Web.Api.AutoMappingConfiguration.ServerAppStateMap
{
    public class ApplicationStateToSApplicationStateAutoTypeConfiguration : Profile
    {
        public ApplicationStateToSApplicationStateAutoTypeConfiguration()
        {
            CreateMap<ApplicationState, SApplicationState>()

                //Favorite
                //.ForMember(s => s.Favorite_FavoritePrice, ca => ca.MapFrom(y => y.Favorite_FavoritePrice))
                //.ForMember(s => s.Favorite_FreeNumberToFavorite, ca => ca.MapFrom(y => y.Favorite_FreeNumberToFavorite))

                //User
                .ForMember(s => s.User_DefaultUserName, ca => ca.MapFrom(y => y.User_DefaultUserName))
                .ForMember(s => s.User_DefaultUserCoin, ca => ca.MapFrom(y => y.User_DefaultUserCoin))

                //Question
                .ForMember(s => s.Question_CreateQuestionPrice, ca => ca.MapFrom(y => y.Question_CreateQuestionPrice))
                .ForMember(s => s.Question_DefaultReturnAmount, ca => ca.MapFrom(y => y.Question_DefaultReturnAmount))
                .ForMember(s => s.Question_NumberToSkip, ca => ca.MapFrom(y => y.Question_NumberToSkip))
                .ForMember(s => s.Question_NoQuestionFoundWhat, ca => ca.MapFrom(y => y.Question_NoQuestionFoundWhat))
                .ForMember(s => s.Question_NoQuestionFoundBut, ca => ca.MapFrom(y => y.Question_NoQuestionFoundBut))
                .ForMember(s => s.Question_NoQuestionFoundID, ca => ca.MapFrom(y => y.Question_NoQuestionFoundID))
                .ForMember(s => s.Question_ServerBurntReturnAmount, ca => ca.MapFrom(y => y.Question_ServerBurntReturnAmount))

                //Prize
                .ForMember(s => s.Prize_AnswerXP, ca => ca.MapFrom(y => y.Prize_AnswerXP))
                .ForMember(s => s.Prize_LikeScoreAmount, ca => ca.MapFrom(y => y.Prize_LikeScoreAmount))
                .ForMember(s => s.Prize_CreateNewQuestionXP, ca => ca.MapFrom(y => y.Prize_CreateNewQuestionXP))
                .ForMember(s => s.Prize_NewQuestionAcceptedXP, ca => ca.MapFrom(y => y.Prize_NewQuestionAcceptedXP))
                .ForMember(s => s.Prize_CreateNewQuestionScore, ca => ca.MapFrom(y => y.Prize_CreateNewQuestionScore))
                .ForMember(s => s.Prize_NewQuestionAcceptedScore, ca => ca.MapFrom(y => y.Prize_NewQuestionAcceptedScore))

                .ForMember(s => s.Store_DefaultReturnAmount, ca => ca.MapFrom(y => y.Store_DefaultReturnAmount))

                .ForMember(s => s.Paging_DefaultPageSize, ca => ca.MapFrom(y => y.Paging_DefaultPageSize))

                .ForMember(s => s.Leader_TopNumberToShow, ca => ca.MapFrom(y => y.Leader_TopNumberToShow))

                //Comment
                .ForMember(s => s.Comment_DefaultNumberAmount, ca => ca.MapFrom(y => y.Comment_DefaultNumberAmount))
                .ForMember(s => s.Comment_DefaultVerifyState, ca => ca.MapFrom(y => y.Comment_DefaultVerifyState))

                //Watch Ad 
                //.ForMember(s => s.WatchAdCoin, ca => ca.MapFrom( y => y.WatchAdCoin))

                //SpinWheel
                .ForMember(s => s.SpinWheelFortuneThreshold, ca => ca.MapFrom(y => y.SpinWheelFortuneThreshold))
                .ForMember(s => s.SpinWheelLoopPrice, ca => ca.MapFrom(y => y.SpinWheelLoopPrice))

                //Host
                .ForMember(s => s.Host_WebSiteNoReplyMail, ca => ca.MapFrom(y => y.Host_WebSiteNoReplyMail))
                .ForMember(s => s.Host_WebSiteNoReplyMailPassword, ca => ca.MapFrom(y => y.Host_WebSiteNoReplyMailPassword))
                .ForMember(s => s.Host_SupportMail, ca => ca.MapFrom(y => y.Host_SupportMail))
                .ForMember(s => s.Host_SupportMailPassword, ca => ca.MapFrom(y => y.Host_SupportMailPassword))
                .ForMember(s => s.Host_SmtpServer, ca => ca.MapFrom(y => y.Host_SmtpServer))
                .ForMember(s => s.HostCredentialUserName, ca => ca.MapFrom(y => y.HostCredentialUserName))
                .ForMember(s => s.HostCredentialPassword, ca => ca.MapFrom(y => y.HostCredentialPassword));

        }
    }
}