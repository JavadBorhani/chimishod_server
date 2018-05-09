namespace Falcon.Web.Models.Api.Quest
{
    public enum SQuestQuestionType
    {
        Score = 1 ,
        Fun = 2,
    };

    public class SQuestQuestion
    {
        public int ID { get; set; }
        public int QuestionID { get; set; }
        public SQuestQuestionType QuestionType { get; set; }
        public int QuestNumber { get; set; }
        public int Priority { get; set; }
        public int? YesQuestNumber { get; set; }
        public int? NoQuestNumber { get; set; }
        public int YesScore { get; set; }
        public int NoScore { get; set; }
    }
}
