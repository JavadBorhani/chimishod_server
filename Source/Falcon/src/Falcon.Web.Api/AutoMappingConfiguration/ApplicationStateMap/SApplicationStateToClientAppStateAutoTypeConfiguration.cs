﻿using AutoMapper;
using Falcon.Web.Models.Api;

namespace Falcon.Web.Api.AutoMappingConfiguration.ApplicationStateMap
{
    public class SApplicationStateToClientAppStateAutoTypeConfiguration : Profile
    {
        public SApplicationStateToClientAppStateAutoTypeConfiguration()
        {
            CreateMap<SApplicationState , ClientAppState>()
                .ForMember(c => c.FavoritePrice, m => m.MapFrom(a => a.Favorite_FavoritePrice))
                .ForMember(c => c.CreateQuestionPrice, m => m.MapFrom(a => a.Question_CreateQuestionPrice))
                .ForMember(c => c.AnswerPrize, m => m.MapFrom(a => a.Prize_AnswerPrize))
                .ForMember(c => c.LikePrize, m => m.MapFrom(a => a.Prize_LikePrize))
                .ForMember(c => c.CreateNewQuestionPrize, m => m.MapFrom(a => a.Prize_CreateNewQuestionPrize));
        }
    }
}