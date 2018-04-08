using System;
using System.ComponentModel.DataAnnotations;

namespace Falcon.Web.Models.Api.Notification
{
    public class SNotificationID
    {
        [Required]        
        public Guid UUID { get; set; }
    }
}
