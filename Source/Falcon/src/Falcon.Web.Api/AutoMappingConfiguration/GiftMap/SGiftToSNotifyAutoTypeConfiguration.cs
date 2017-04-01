using AutoMapper;
using Falcon.Web.Models.Api;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using static Falcon.Web.Models.Api.SNotify;

namespace Falcon.Web.Api.AutoMappingConfiguration.GiftMap
{
    public class SGiftToSNotifyAutoTypeConfiguration : Profile
    {
        public SGiftToSNotifyAutoTypeConfiguration()
        {
            CreateMap<SGift, SNotify>()
                .ForMember(n => n.ID, m => m.MapFrom(c => c.ID))
                .ForMember(n => n.Image, m => m.MapFrom(c => c.Image))
                .ForMember(n => n.Title , m => m.MapFrom(c => c.Name))
                .ForMember(n => n.Description , m => m.MapFrom(c => c.Description))
                .ForMember(n => n.Prize , m => m.MapFrom(c => c.Prize))
                .ForMember(n => n.Type , m => m.UseValue(NotificationType.Gift));
        }
    }
}