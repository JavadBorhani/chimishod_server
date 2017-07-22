using AutoMapper;
using Falcon.Web.Models.Api;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Falcon.Web.Api.AutoMappingConfiguration.AchievementMap
{
    public class UserAchievementRecordToSAchievementAutoTypeConfiguration : Profile
    {
        public UserAchievementRecordToSAchievementAutoTypeConfiguration()
        {
            CreateMap<UserAchievementRecord, SAchievement>()
                .ForMember(s => s.ID, m => m.MapFrom(ua => ua.ID))
                .ForMember(s => s.Name, m => m.MapFrom(ua => ua.Name))
                .ForMember(s => s.Description, m => m.MapFrom(ua => ua.Description))
                .ForMember(s => s.Star, m => m.MapFrom(ua => ua.Coin))
                .ForMember(s => s.Icon, m => m.MapFrom(ua => ua.Icon))
                .ForMember(s => s.Prize, m => m.MapFrom(ua => ua.ScorePrize))
                .ForMember(s => s.AchievementState, m => m.MapFrom(ua => ua.AchievementState));
        }
    }
}