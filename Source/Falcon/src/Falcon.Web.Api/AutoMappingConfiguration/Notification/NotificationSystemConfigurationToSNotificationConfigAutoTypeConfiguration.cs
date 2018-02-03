using AutoMapper;
using Falcon.EFCommonContext.DbModel;
using Falcon.Web.Models.Api.Notification;

namespace Falcon.Web.Api.AutoMappingConfiguration.Notification
{
    public class NotificationSystemConfigurationToSNotificationConfigAutoTypeConfiguration : Profile
    {
        public NotificationSystemConfigurationToSNotificationConfigAutoTypeConfiguration()
        {
            CreateMap<NotificationSystemConfiguration, SNotificationConfig>()

                .ForMember(s => s.Name,                 m => m.MapFrom(ns => ns.NotificationName))
                .ForMember(s => s.EndPointUri,          m => m.MapFrom(ns => ns.NotificationURL))
                .ForMember(s => s.AuthenticationKey,    m => m.MapFrom(ns => ns.NotificationKey))

                .ForMember(s => s.FriendRequest_Title,  m => m.MapFrom(ns => ns.FriendRequest_Title))
                .ForMember(s => s.SentRequest_Title,   m => m.MapFrom(ns => ns.SentRequest_Title))
                .ForMember(s => s.InboxRequest_Title,  m => m.MapFrom(ns => ns.InboxRequest_Title))
                .ForMember(s => s.FriendResponse_Title, m => m.MapFrom(ns => ns.FriendResponse_Title))

                .ForMember(s => s.FriendRequest_Description, m => m.MapFrom(ns => ns.FriendRequest_Description))
                .ForMember(s => s.SentRequest_Description, m => m.MapFrom(ns => ns.SentRequest_Description))
                .ForMember(s => s.InboxRequest_Description, m => m.MapFrom(ns => ns.InboxRequest_Description))
                .ForMember(s => s.FriendResponse_Description, m => m.MapFrom(ns => ns.FriendResponse_Description))


                .ForMember(s => s.FriendRequest_Image, m => m.MapFrom(ns => ns.FriendRequest_Image))
                .ForMember(s => s.SentRequest_Image, m => m.MapFrom(ns => ns.SentRequest_Image))
                .ForMember(s => s.InboxRequest_Image, m => m.MapFrom(ns => ns.InboxRequest_Image))
                .ForMember(s => s.FriendResponse_Image, m => m.MapFrom(ns => ns.FriendResponse_Image))

                .ForMember(s => s.ApplicationID ,       m => m.MapFrom(ns => ns.NotificationAppID))
                .ReverseMap();
        }


        //   ,[FriendRequest_Title]
        //,[SentRequest_Title]
        //,[InboxRequest_Title]
        //,[FriendResponse_Title]
        //,[FriendRequest_Description]
        //,[SentRequest_Description]
        //,[InboxRequest_Description]
        //,[FriendResponse_Description]
        //,[FriendRequest_Image]
        //,[SentRequest_Image]
        //,[InboxRequest_Image]
        //,[FriendResponse_Image]
    }
}