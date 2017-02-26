using AutoMapper;
using Falcon.EFCommonContext.DbModel;
using Falcon.Web.Models.Api;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Falcon.Web.Api.AutoMappingConfiguration.UserInfoMap
{
    public class UserInfoToSUserInfoAutoTypeConfiguration : Profile
    {

        public UserInfoToSUserInfoAutoTypeConfiguration()
        {
            CreateMap<UserInfo, SUserInfo>()
                .ForMember(s => s.UserName, m => m.MapFrom(u => u.User.UserName))
                .ForMember(s => s.Email , m => m.MapFrom( u => u.Email))
                .ForMember(s => s.HasRegistered , m => m.Ignore());
        }
    }
}