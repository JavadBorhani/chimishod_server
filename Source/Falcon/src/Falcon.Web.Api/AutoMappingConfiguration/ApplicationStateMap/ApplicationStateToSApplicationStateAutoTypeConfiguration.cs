using AutoMapper;
using Falcon.EFCommonContext.DbModel;
using Falcon.Web.Models.Api;

namespace Falcon.Web.Api.AutoMappingConfiguration.ApplicationStateMap
{
    public class ApplicationStateToSApplicationStateAutoTypeConfiguration : Profile
    {
        public ApplicationStateToSApplicationStateAutoTypeConfiguration()
        {
            CreateMap<ApplicationState, SApplicationState>()

                //Favorite
                .ForMember(s => s.Favorite_FavoritePrice, ca => ca.MapFrom(y => y.Favorite_FavoritePrice))
                .ForMember(s => s.Favorite_FreeNumberToFavorite, ca => ca.MapFrom(y => y.Favorite_FreeNumberToFavorite))

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
                .ForMember(s => s.Prize_AnswerPrize, ca => ca.MapFrom(y => y.Prize_AnswerPrize))
                .ForMember(s => s.Prize_LikePrize, ca => ca.MapFrom(y => y.Prize_LikePrize))
                .ForMember(s => s.Prize_CreateNewQuestionPrize, ca => ca.MapFrom(y => y.Prize_CreateNewQuestionPrize))
                .ForMember(s => s.Prize_NewQuestionAcceptedPrize, ca => ca.MapFrom(y => y.Prize_NewQuestionAcceptedPrize))

                .ForMember(s => s.Store_DefaultReturnAmount, ca => ca.MapFrom(y => y.Store_DefaultReturnAmount))

                .ForMember(s => s.Paging_DefaultPageSize, ca => ca.MapFrom(y => y.Paging_DefaultPageSize))

                .ForMember(s => s.Leader_TopNumberToShow, ca => ca.MapFrom(y => y.Leader_TopNumberToShow))

                //Comment
                .ForMember(s => s.Comment_DefaultNumberAmount, ca => ca.MapFrom(y => y.Comment_DefaultNumberAmount))
                .ForMember(s => s.Comment_DefaultVerifyState, ca => ca.MapFrom(y => y.Comment_DefaultVerifyState))

                //Host
                .ForMember(s => s.Host_WebSiteNoReplyMail, ca => ca.MapFrom(y => y.Host_WebSiteNoReplyMail))
                .ForMember(s => s.Host_WebSiteNoReplyMailPassword, ca => ca.MapFrom(y => y.Host_WebSiteNoReplyMailPassword))
                .ForMember(s => s.Host_SupportMail, ca => ca.MapFrom(y => y.Host_SupportMail))
                .ForMember(s => s.Host_SupportMailPassword, ca => ca.MapFrom(y => y.Host_SupportMailPassword))
                .ForMember(s => s.Host_SmtpServer, ca => ca.MapFrom(y => y.Host_SmtpServer));

        }
    }
}