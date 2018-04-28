namespace Falcon.Web.Models.Api.Config
{
    public class SGameConfig 
    {

        public int ID { get; set; }
        public int TotalNumberOfQuestions { get; set; }
        public int HighQualityQuestionsPercent { get; set; }
        public int NewCreatedQuestionsPercent { get; set; }
        public int FunQuestionsPercent { get; set; }
        public int DefaultUserCoinAmount { get; set; }    
        public int DefaultUserLevelNumber { get; set; }
        public int DefaultUserLevelProgress { get; set; }
    }
}
