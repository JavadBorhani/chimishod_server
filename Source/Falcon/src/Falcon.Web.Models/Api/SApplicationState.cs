// Flapp Copyright 2017-2018

namespace Falcon.Web.Models.Api
{
    public class SApplicationState
    {
        public int ID { get; set; }
        public int FavoritePrice { get; set; }
        public string DefaultUserName { get; set; }
        public int DefaultUserCoin { get; set; }
        public int CreateQuestionPrice { get; set; }
        public int AnswerPrize { get; set; }
        public int LikePrize { get; set; }
        public int CreateNewQuestionPrize { get; set; }
    }
}
