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
                .ForMember(s => s.LevelNumber , m => m.MapFrom( u => u.Level.LevelNumber))
                .ForMember(s => s.UserAvatarUrl , m => m.Ignore())
                .ForMember(s => s.Score , m => m.Ignore()) //TODO : Check issue 
                .ForMember(s => s.Rank , m => m.Ignore());
        }
    }
}