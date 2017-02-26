using AutoMapper;
using Falcon.EFCommonContext.DbModel;
using Falcon.Web.Models.Api;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Falcon.Web.Api.AutoMappingConfiguration.LevelMap
{
    public class LevelToSLevelAutoTypeConfiguration : Profile
    {
        public LevelToSLevelAutoTypeConfiguration()
        {
            CreateMap<Level, SLevel>()
                .ForMember(s => s.ID, m => m.MapFrom(l => l.ID))
                .ForMember(s => s.Coin, m => m.MapFrom(l => l.Star))
                .ForMember(s => s.Ceil , m => m.MapFrom(l => l.ScoreCeil))
                .ForMember(s => s.LevelNumber, m => m.MapFrom(l => l.LevelNumber));
        }
    }
}