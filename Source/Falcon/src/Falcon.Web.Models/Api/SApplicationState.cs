// Flapp Copyright 2017-2018

using System.ComponentModel.DataAnnotations;

namespace Falcon.Web.Models.Api
{
    public class SApplicationState
    {        
        public int ID { get; set; }
        [Required]
        public int Favorite_FavoritePrice { get; set; }

        [Required]
        public int Favorite_FreeNumberToFavorite { get; set; }

        [Required(AllowEmptyStrings = false)]
        public string User_DefaultUserName { get; set; }

        [Required]
        public int User_DefaultUserCoin { get; set; }

        [Required]
        public int Question_CreateQuestionPrice { get; set; }

        [Required]
        public int Question_DefaultReturnAmount { get; set; }

        [Required]
        public int Question_NumberToSkip { get; set; }

        [Required(AllowEmptyStrings = false)]
        public string Question_NoQuestionFoundWhat { get; set; }

        [Required(AllowEmptyStrings = false)]
        public string Question_NoQuestionFoundBut { get; set; }

        [Required]
        public int Question_NoQuestionFoundID { get; set; }

        [Required]
        public int Question_ServerBurntReturnAmount { get; set; }

        [Required]
        public int Prize_AnswerPrize { get; set; }

        [Required]
        public int Prize_LikePrize { get; set; }

        [Required]
        public int Prize_CreateNewQuestionPrize { get; set; }

        [Required]
        public int Prize_NewQuestionAcceptedPrize { get; set; }

        [Required]
        public int Paging_DefaultPageSize { get; set; }

        [Required]
        public int Leader_TopNumberToShow { get; set; }

        [Required]
        public int Comment_DefaultNumberAmount { get; set; }

        [Required]
        public bool Comment_DefaultVerifyState { get; set; }

        [EmailAddress]
        [Required(AllowEmptyStrings = false)]
        public string Host_WebSiteNoReplyMail { get; set; }

        [Required(AllowEmptyStrings = false)]
        public string Host_WebSiteNoReplyMailPassword { get; set; }

        [EmailAddress]
        [Required(AllowEmptyStrings = false)]
        public string Host_SupportMail { get; set; }

        [Required(AllowEmptyStrings = false)]
        public string Host_SupportMailPassword { get; set; }

        [Required(AllowEmptyStrings = false)]
        public string Host_SmtpServer { get; set; }


        [Required(AllowEmptyStrings = false)]
        public string HostCredentialUserName { get; set; }

        [Required(AllowEmptyStrings = false)]
        public string HostCredentialPassword { get; set; }

        [Required]
        public int Store_DefaultReturnAmount { get; set; }
        [Required]
        public int WatchAdCoin { get; set; }

        [Required]
        public int SpinWheelFortuneThreshold { get; set; }

        [Required]
        public int SpinWheelLoopPrice { get; set; }
    }
}
