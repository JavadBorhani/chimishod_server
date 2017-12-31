using AutoMapper;


namespace Falcon.Web.Api.AutoMappingConfiguration.CommentsMap
{
    public class CommentToSCommentAutoTypeConfiguration : Profile
    {
        public CommentToSCommentAutoTypeConfiguration()
        {
            //CreateMap<Comment, SComment>()
            //    .ForMember(s => s.UserID, m => m.MapFrom(c => c.UserID))
            //    .ForMember(s => s.UserName, m => m.MapFrom(c => c.User.UserName))
            //    .ForMember(s => s.Content, m => m.MapFrom(c => c.CommentContent))
            //    .ForMember(s => s.Response, m => m.MapFrom(c => c.Response))
            //    .ForMember(s => s.InsertDate, m => m.MapFrom(c => c.InsertDate))
            //    .ForMember(s => s.ServerTime, m => m.Ignore())
            //    .ForMember(s => s.Avatar, m => m.Ignore());
        }
    }
}