namespace Falcon.Web.Models.Api.Notification
{
    public class SQuestionNotificationConfiguration
    {
        public int ID { get; set; }
        public int QuestionAnswerCountMinRange { get; set; }
        public int QuestionAnswerCountMaxRange { get; set; }
        public bool Active { get; set; }
    }
}
