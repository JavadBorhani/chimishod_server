﻿using AutoMapper;

namespace Falcon.Web.Api.AutoMappingConfiguration.UserMap.UserStatMap
{
    public class UserStatToSUserStatAutoTypeConfiguration : Profile
    {
        public UserStatToSUserStatAutoTypeConfiguration()
        {
            //CreateMap<UserStat, SUserStat>()
            //    .ForMember(s => s.ID, m => m.MapFrom(us => us.ID))
            //    .ForMember(s => s.UserID, m => m.MapFrom(u => u.UserID))
            //    .ForMember(s => s.Score, m => m.MapFrom(u => u.Score))
            //    .ForMember(s => s.Rank, m => m.MapFrom(u => u.Rank))
            //    .ForMember(s => s.SpinRemainedChance, m => m.MapFrom(u => u.SpinRemainedChance))
            //    .ForMember(s => s.SpinWheelCount, m => m.MapFrom(u => u.SpinWheelCount));
        }
    }
}