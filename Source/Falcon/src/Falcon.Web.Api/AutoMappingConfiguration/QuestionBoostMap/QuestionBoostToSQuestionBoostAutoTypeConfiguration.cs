﻿using AutoMapper;
using Falcon.EFCommonContext.DbModel;
using Falcon.Web.Models.Api;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Falcon.Web.Api.AutoMappingConfiguration.QuestionBoostMap
{
    public class QuestionBoostToSQuestionBoostAutoTypeConfiguration : Profile
    {
        public QuestionBoostToSQuestionBoostAutoTypeConfiguration()
        {
            CreateMap<QuestionBoost, SQuestionBoost>()
                .ForMember(s => s.ID, q => q.MapFrom(qb => qb.ID))
                .ForMember(s => s.Name , q => q.MapFrom(qb => qb.Name))
                .ForMember(s => s.Description, q => q.MapFrom(qb => qb.Description))
                .ForMember(s => s.Price , q => q.MapFrom( qb => qb.Price))
                .ForMember(s => s.Icon , q => q.MapFrom( qb => qb.Icon))
                .ForMember(s => s.RectangleColor , q => q.MapFrom(qb => qb.RectangleColor)) ;
        }
    }
}