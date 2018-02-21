using System;
using System.ComponentModel.DataAnnotations;

namespace Falcon.Web.Models.Api.Polling
{
    public class SPollingInquiry
    {
        [Required]
        public DateTime FriendRequestDate { get; set; }

        [Required]
        public DateTime FriendResponseDate { get; set; }

        [Required]
        public DateTime InboxQuestionsDate { get; set; }

    }
}
