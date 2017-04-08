using AutoMapper;
using Falcon.EFCommonContext.DbModel;
using Falcon.Web.Models.Api;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Falcon.Web.Api.AutoMappingConfiguration.MarketMap
{
    public class MarketToSMarketAutoTypeConfiguration : Profile
    {
        public MarketToSMarketAutoTypeConfiguration()
        {
            CreateMap<MarketInfo, SMarketInfo>()
                .ForMember(s => s.ID, m => m.MapFrom(mf => mf.ID))
                .ForMember(s => s.MarketName, m => m.MapFrom(mf => mf.MarketName))
                .ForMember(s => s.AppPackageName, m => m.MapFrom(mf => mf.AppPackageName))
                .ForMember(s => s.PaymentVerificationLink, m => m.MapFrom(mf => mf.PaymentVerificationLink))
                .ForMember(s => s.LinkToAuthorize, m => m.MapFrom(mf => mf.LinkToAuthorize))
                .ForMember(s => s.ClientID, m => m.MapFrom(mf => mf.ClientID))
                .ForMember(s => s.ClientSecret, m => m.MapFrom(mf => mf.ClientSecret))
                .ForMember(s => s.AccessToken, m => m.MapFrom(mf => mf.AccessToken))
                .ForMember(s => s.RefreshToken, m => m.MapFrom(mf => mf.RefreshToken))
                .ForMember(s => s.RedirectURI, m => m.MapFrom(mf => mf.RedirectURI))
                .ForMember(s => s.ExpireAt, m => m.MapFrom(mf => mf.ExpireAt))
                .ForMember(s => s.Code, m => m.MapFrom(mf => mf.Code))
                .ForMember(s => s.NeedsTokenVerification, m => m.MapFrom(mf => mf.NeedsTokenVerification));
        }
    }
}