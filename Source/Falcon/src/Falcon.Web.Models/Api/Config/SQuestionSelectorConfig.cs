using System;

namespace Falcon.Web.Models.Api.Config
{
    public class SQuestionSelectorConfig : ICloneable
    {
        public int ID { get; set; }
        public int TotalNumberOfQuestions { get; set; }
        public int CreatedQuestionsPercent { get; set; }
        public int VerifiedQuestionsPercent { get; set; }
        public int BoostedQuestionsPercent { get; set; }
        public int ActionBasedQuestionsPercent { get; set; }

        public SQuestionSelectorConfig()
        {

        }

        public SQuestionSelectorConfig(int id , int tnq , int cqp , int vqp , int bqp , int abqp)
        {
            ID = id;
            TotalNumberOfQuestions = tnq;
            CreatedQuestionsPercent = cqp;
            VerifiedQuestionsPercent = vqp;
            BoostedQuestionsPercent = bqp;
            ActionBasedQuestionsPercent = abqp;
        }


        public object Clone()
        {
            return new SQuestionSelectorConfig(ID, 
                TotalNumberOfQuestions, 
                CreatedQuestionsPercent, 
                VerifiedQuestionsPercent, 
                BoostedQuestionsPercent, 
                ActionBasedQuestionsPercent);
        }        

    }
}
