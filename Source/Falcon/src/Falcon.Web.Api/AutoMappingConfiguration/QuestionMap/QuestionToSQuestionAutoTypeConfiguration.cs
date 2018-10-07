using AutoMapper;
using Falcon.EFCommonContext.DbModel;
using Falcon.Web.Models.Api;
using Falcon.Web.Models.Api.User;

namespace Falcon.Web.Api.AutoMappingConfiguration.QuestionMap
{
    public class QuestionToSQuestionAutoTypeConfiguration : Profile
    {
        public QuestionToSQuestionAutoTypeConfiguration()
        {
            CreateMap<Question, SQuestion>()
                .ForMember(q => q.ID, m => m.MapFrom(s => s.ID))
                .ForMember(q => q.AuthorID, m => m.MapFrom(s => s.UserID))
                .ForMember(q => q.What_if, m => m.MapFrom(s => s.What_if))
                .ForMember(q => q.But, m => m.MapFrom(s => s.But))
                .ForMember(q => q.Yes_Count, m => m.MapFrom(s => s.Yes_Count))
                .ForMember(q => q.No_Count, m => m.MapFrom(s => s.No_Count))
                .ForMember(q => q.Like_Count, m => m.MapFrom(s => s.Like_Count))
                .ForMember(q => q.Dislike_Count, m => m.MapFrom(s => s.Dislike_Count))
                .ForMember(q => q.AuthorUserName, m => m.MapFrom(s => s.User.UserName))
                .ForMember(q => q.Gender , m => m.MapFrom( s => s.User.IsMale ? Gender.Man : Gender.Woman))
                .ForMember(q => q.ActionInfo , m => m.MapFrom(s => s.QuestionAction));
        }

        //AuthorID
        //AuthorUserName
        //ActionInfo

        //public int ID { get; set; }
        //public string What_if { get; set; }
        //public string But { get; set; }
        //public Nullable<int> UserID { get; set; }
        //public Nullable<int> HashTagID { get; set; }
        //public int Yes_Count { get; set; }
        //public int No_Count { get; set; }
        //public int Like_Count { get; set; }
        //public int Dislike_Count { get; set; }
        //public Nullable<int> ActionID { get; set; }
        //public double Weight { get; set; }
        //public int CommentCount { get; set; }
        //public int ReportCount { get; set; }
        //public bool Banned { get; set; }
        //public bool RemovedByCreator { get; set; }
        //public bool IsPublic { get; set; }
        //public bool IsOurAuthor { get; set; }
    }
}