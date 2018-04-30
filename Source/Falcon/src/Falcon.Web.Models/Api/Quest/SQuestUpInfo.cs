namespace Falcon.Web.Models.Api.Quest
{

    public class SQuestUpInfo
    {
        public QuestUpMode QuestUpMode { get; set; }
        public int QuestUpNumber { get; set; }
    }

    public enum QuestUpMode
    {
        NotQuestUpped,
        QuestUpped,
        QuestUppedAndNeedAnother
    }
}
