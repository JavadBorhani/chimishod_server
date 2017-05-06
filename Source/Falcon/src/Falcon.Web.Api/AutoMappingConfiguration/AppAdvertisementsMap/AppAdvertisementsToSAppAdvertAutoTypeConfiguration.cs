using AutoMapper;
using Falcon.EFCommonContext.DbModel;
using Falcon.Web.Models.Api;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Falcon.Web.Api.AutoMappingConfiguration.AppAdvertisementsMap
{
    public class AppAdvertisementsToSAppAdvertAutoTypeConfiguration : Profile
    {
        public AppAdvertisementsToSAppAdvertAutoTypeConfiguration()
        {
            CreateMap<AppAdvertisement, SAppAdvert>()
                .ForMember(s => s.ID, m => m.MapFrom(a => a.ID))
                .ForMember(s => s.Title, m => m.MapFrom(a => a.Title))
                .ForMember(s => s.Description, m => m.MapFrom(a => a.Description))
                .ForMember(s => s.BackgroundColor, m => m.MapFrom(a => a.BackgroundColor))
                .ForMember(s => s.MarketPackageName, m => m.MapFrom(a => a.MarketPackageName))
                .ForMember(s => s.MarketIntentString, m => m.MapFrom(a => a.MarketIntentString))
                .ForMember(s => s.AppStoreUri, m => m.MapFrom(a => a.AppStoreUri))
                .ForMember(s => s.IsNew, m => m.MapFrom(a => a.IsNew));                
        }
    }
}