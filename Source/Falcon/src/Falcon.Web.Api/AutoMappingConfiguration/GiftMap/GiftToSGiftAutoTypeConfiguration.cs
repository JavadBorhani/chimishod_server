using AutoMapper;
using Falcon.EFCommonContext.DbModel;
using Falcon.Web.Models.Api;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Falcon.Web.Api.AutoMappingConfiguration.GiftMap
{
    public class GiftToSGiftAutoTypeConfiguration : Profile
    {
        public GiftToSGiftAutoTypeConfiguration()
        {
            CreateMap<Gift, SGift>()
                .ForMember(s => s.ID, m => m.MapFrom(g => g.ID))
                .ForMember(s => s.Image, m => m.MapFrom(g => g.Image))
                .ForMember(s => s.Name, m => m.MapFrom(g => g.Name))
                .ForMember(s => s.Description, m => m.MapFrom(g => g.Description))
                .ForMember(s => s.Prize, m => m.MapFrom(g => g.Prize))
                .ForMember(s => s.Day, m => m.MapFrom(g => g.Day))
                .ForMember(s => s.GiftType, m => m.MapFrom(g => (GiftTypes)Enum.Parse(typeof(GiftTypes), g.GiftType.Name)))
                .ForMember(s => s.GiftTypeString, m => m.MapFrom(g => g.GiftType.Name))
                .ForMember(s => s.QueryString, m => m.MapFrom(g => g.QueryString))
                .ForMember(s => s.Priority , m => m.Ignore());
        }
    }
}