// Flapp Copyright 2017-2018

namespace Falcon.Web.Models.Api
{
    public class SApplicationState
    {
        public int ID { get; set; }
        public int Favorite_FavoritePrice { get; set; }
        public int Favorite_FreeNumberToFavorite { get; set; }
        public string User_DefaultUserName { get; set; }
        public int User_DefaultUserCoin { get; set; }
        public int Question_CreateQuestionPrice { get; set; }
        public int Question_DefaultReturnAmount { get; set; }
        public int Question_NumberToSkip { get; set; }
        public string Question_NoQuestionFoundWhat { get; set; }
        public string Question_NoQuestionFoundBut { get; set; }
        public int Question_NoQuestionFoundID { get; set; }
        public int Question_ServerBurntReturnAmount { get; set; }
        public int Prize_AnswerPrize { get; set; }
        public int Prize_LikePrize { get; set; }
        public int Prize_CreateNewQuestionPrize { get; set; }
        public int Prize_NewQuestionAcceptedPrize { get; set; }
        public int Paging_DefaultPageSize { get; set; }
        public int Leader_TopNumberToShow { get; set; }
        public int Comment_DefaultNumberAmount { get; set; }
        public bool Comment_DefaultVerifyState { get; set; }
        public string Host_WebSiteNoReplyMail { get; set; }
        public string Host_WebSiteNoReplyMailPassword { get; set; }
        public string Host_SupportMail { get; set; }
        public string Host_SupportMailPassword { get; set; }
        public string Host_SmtpServer { get; set; }
        public int Store_DefaultReturnAmount { get; set; }
    }
}
