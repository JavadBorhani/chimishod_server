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
                .ForMember(s => s.FriendRequestMessage, m => m.MapFrom(ns => ns.FriendRequestMessage))
                .ForMember(s => s.SentRequestMessage,   m => m.MapFrom(ns => ns.SentRequestMessage))
                .ForMember(s => s.InboxRequestMessage,  m => m.MapFrom(ns => ns.InboxRequestMessage))
                .ForMember(s => s.ApplicationID ,       m => m.MapFrom(ns => ns.NotificationAppID))
                .ReverseMap();
        }
    }
}