using AutoMapper;
using Falcon.EFCommonContext.DbModel;
using Falcon.Web.Models.Api;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Falcon.Web.Api.AutoMappingConfiguration.SpinWheelMap
{
    using Models.Api;
    public class SpinWheelToSSpinWheelAutoTypeConfiguration : Profile
    {
        public SpinWheelToSSpinWheelAutoTypeConfiguration()
        {
            CreateMap<SpinWheel, SSpinWheel>()
                .ForMember(ss => ss.ID, m => m.MapFrom(sw => sw.ID))
                .ForMember(ss => ss.Title, m => m.MapFrom(sw => sw.Title))
                .ForMember(ss => ss.Icon, m => m.MapFrom(sw => sw.Icon))
                .ForMember(ss => ss.SpinWheelType, m => m.ResolveUsing(sw =>
                {
                    return (int)(SSpinWheelType)Enum.Parse(typeof(SSpinWheelType), sw.SpinWheelType.Title);
                }))
                .ForMember(ss => ss.Prize, m => m.MapFrom(sw => sw.Prize))
                .ForMember(ss => ss.SpinWheelAlternativeID, m => m.MapFrom(sw => sw.SpinWheelAlternativeID))
                .ForMember(ss => ss.FirstChance, m => m.MapFrom(sw => sw.FirstChance))
                .ForMember(ss => ss.SecondChance, m => m.MapFrom(sw => sw.SecondChance))
                .ForMember(ss => ss.Priority, m => m.MapFrom(sw => sw.Priority));
        }
    }
}