namespace Falcon.Web.Models.Api.Config
{
    public class SGameConfig 
    {

        public int ID { get; set; }
        
        public int TotalNumberOfQuestions { get; set; }
        
        public int PeopleQuestionsPercent { get; set; }

        public int FunQuestionsPercent { get; set; }


        public SGameConfig()
        {

        }

        public SGameConfig(int id , int tnq , int pqc , int fqp )
        {
            ID = id;
            TotalNumberOfQuestions = tnq;
            PeopleQuestionsPercent = pqc;
            FunQuestionsPercent = fqp; 
        }
    
    }
}
