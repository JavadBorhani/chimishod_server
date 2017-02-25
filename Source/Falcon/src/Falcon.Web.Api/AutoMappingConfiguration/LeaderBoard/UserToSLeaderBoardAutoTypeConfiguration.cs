using AutoMapper;
using Falcon.EFCommonContext.DbModel;
using Falcon.Web.Models.Api;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Falcon.Web.Api.AutoMappingConfiguration.LeaderBoard
{
    public class UserToSLeaderBoardAutoTypeConfiguration : Profile
    {
        public UserToSLeaderBoardAutoTypeConfiguration()
        {
            CreateMap<User, SLeaderBoard>()
                .ForMember(s => s.UserID , m => m.MapFrom( u => u.ID))
                .ForMember(s => s.UserName, m => m.MapFrom( u => u.UserName))
                .ForMember(s => s.Score , m => m.MapFrom( u => u.Score))
                .ForMember(s => s.LevelNumber , m => m.MapFrom( u => u.Level.LevelNumber))
                .ForMember(s => s.LevelProgress , m => m.MapFrom( u => u.LevelProgress))
                .ForMember(s => s.LevelCeil , m => m.MapFrom(u => u.Level.ScoreCeil))
                .ForMember(s => s.UserAvatarUrl , m => m.Ignore())
                .ForMember(s => s.Rank , m => m.Ignore());
        }
    }
}