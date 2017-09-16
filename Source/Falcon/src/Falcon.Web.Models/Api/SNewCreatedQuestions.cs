using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Falcon.Web.Models.Api
{
    public enum CreatedQuestionState
    {
        CreatedQuestionRejected = 1 ,
        CreatedQuestionIsInChecking = 2,
        CreatedQuestionsVerified = 3,
    }
    public class SNewCreatedQuestions
    {
        public int ID { get; set; }
        public string What_if { get; set; }
        public string But { get; set; }
        public int Category_ID { get; set; }
        public string Category_Name { get; set; }
        public int Yes_Count { get; set; }
        public int No_Count { get; set; }
        public int Like_Count { get; set; }
        public int Dislike_Count { get; set; }
        public int VerifyState { get; set; }
        public int CommentCount { get; set; }
        public DateTime RegisterDateTime { get; set; }
        public DateTime ServerTime { get; set; }
    }
}
