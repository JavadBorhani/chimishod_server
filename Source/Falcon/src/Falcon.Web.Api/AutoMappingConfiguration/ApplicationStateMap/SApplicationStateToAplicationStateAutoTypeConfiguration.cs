using AutoMapper;
using Falcon.EFCommonContext.DbModel;
using Falcon.Web.Models.Api;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Falcon.Web.Api.AutoMappingConfiguration.ApplicationStateMap
{
    public class SApplicationStateToAplicationStateAutoTypeConfiguration : Profile
    {
        public SApplicationStateToAplicationStateAutoTypeConfiguration()
        {
            CreateMap<SApplicationState , ApplicationState>()
                .ForMember(s => s.ID, ca => ca.MapFrom(y => y.ID))
                .ForMember(s => s.User_DefaultUserCoin, ca => ca.MapFrom(y => y.User_DefaultUserCoin))
                .ForMember(s => s.Favorite_FavoritePrice, ca => ca.MapFrom(y => y.Favorite_FavoritePrice))
                .ForMember(s => s.Question_CreateQuestionPrice, ca => ca.MapFrom(y => y.Question_CreateQuestionPrice))
                .ForMember(s => s.Prize_CreateNewQuestionPrize, ca => ca.MapFrom(y => y.Prize_CreateNewQuestionPrize))
                .ForMember(s => s.Prize_AnswerPrize, ca => ca.MapFrom(y => y.Prize_AnswerPrize))
                .ForMember(s => s.Prize_LikePrize, ca => ca.MapFrom(y => y.Prize_LikePrize));
        }
    }
}