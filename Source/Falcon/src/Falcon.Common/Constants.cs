// Flapp Copyright 2017-2018

using System.IO;

namespace Falcon.Common
{
    public static class Constants
    {
        //TODO : Default CategoryID should move to application state 
        public static class DefaultUser
        {
            //public const string UserName = "Guest_"; is in db
            public const string Email     = null;
            public const string PhoneNumber = null;
            public const string GoogleID = null;
            public const bool IsVerified = false;
            public const bool IsBanned = false;
            public const bool IsAbleToWriteComment = true;
            public const int Score = 0;
            public const int UserTypeID = 1;
            //public const int TotalStar = 200; is in db
            public const int LevelProgress = 0; 
            public const int LevelAnswerdNumber = 0;
            public const int CurrentLevelNumber = 1;
            public const int LevelNumber = 1; 
            public const int AppThemeID = 1;
            public const int CategoryID = 1;
            //public const int CategoryCoeffecient = 1;
            public const int EditableCount = 2; 
            public const int AvatarID = 1;
            public const int DWMDefaultCount = 0;
            public const int SpinWheelChance = 3;
            public const int SpinWheelCount  = 0;
            public const int SpinWheelAnotherFortune = 1; 
        }
        public static class Notfication
        {
            public const int DefaultExpireDays = 1;
        }
        public static class MediaTypeNames
        {
            public const string ApplicationXml = "application/xml";
            public const string TextXml = "text/xml";
            public const string ApplicationJson = "application/json";
            public const string TextJson = "text/json";
        }

        public static class Paging
        {
            //public const int UserNumberToShow = 20; LeaderBoard_NumberToShow
            public const int MinPageSize = 1;
            public const int MinPageNumber = 1;
            public const int DefaultPageNumber = 1;
            //public const int DefaultPageSize = 5;
        }
        public static class CommonParameterNames
        {
            public const string PageNumber = "pageNumber";
            public const string PageSize = "pageSize";
        }
        public static class CommonLinkRelValues
        {
            public const string Self = "self";
            public const string All = "all";
            public const string CurrentPage = "currentPage";
            public const string PreviousPage = "previousPage";
            public const string NextPage = "nextPage";
        }
        public static class CommonRoutingDefinitions
        {
            public const string ApiSegmentName = "api";
            public const string ApiVersionSegmentName = "apiVersion";
            public const string CurrentApiVersion = "v1";
        }
        public static class SchemeTypes
        {
            public const string Basic = "basic"; 
        }
        public static class RoleNames
        {
            public const string Manager = "Manager";
            public const string SeniorWorker = "SeniorWorker";
            public const string JuniorWorker = "JuniorWorker";
        }
        public static class DefaultReturnAmounts
        {
            //public const int Comment = 20;
            //public const int Question = 5;
            //public const int QuestionsToSkip = 2;
            //public const int ServerBurntNumber = 1;  
        }

        public static class UserInfoStatusType
        {
            public const string EditSucceed = "1";
            public const string UserNameConflict = "2";
            public const string EmailConflict = "3";
            public const string Error = "4"; 
            public const string UserNameIsWrong = "5";
        }
        public static class DefaultValues
        {
            //public const bool CommentDefaultVerify = true;
            public const string CommentDefaultReponseMessage = null;
            //public const int FavoriteNumberOfFreeItems = 3;
            //public const int FavoriteDefaultPrice = 5; is in db
            //public const int NoQuestionID = -1;
            //public const string NoQuestionWhat = "داداش خوردی سرور ما رو";
            //public const string NoQuestionBut = "سرورمون آب شد";
            public const int PurchaseThemeNumberAllowedToBuy = 1;
            public const int PurchaseCategoryNumberAllowedToBuy = 1;
            public const int CategoryNumberOfSelectAllowed = 1;
            public const int ThemeNumberOfSelectAllowed = 1;
            //public const int CreateNewQuestionPrice = 30;
            public const int CreatedQuestionsVerified = 3;
            public const int CreatedQuestionIsInChecking = 2;
            public const int CreatedQuestionRejected = 1;
            //public const int StoreNumberToSend = 20;
            public const int CreatedQuestionsDefaultID = -1;
            public const int AchievementsMinimumAchievables = 5;
            public const int AchievementDefaultNotAchievedID = 1;
            public const int AchievementDefaultAchievableID = 2;
            public const int AchievementDefaultAchievedID = 3;
            public const int AchievementCategoryQueryTypeID = 1;  
            public const int AchievementAdHocQueryTypeID = 2;
            public const int LatencyNumber = 3000;
            public const int FirstPageNumer = 1;
            public const int NoLevelUp = -1;
            public const int NoNewCoin = -1; 
             
        }
        //public static class DefaultHostConfig
        //{
        //    //public const string WebSiteNoReplyMail = "noreply@vglr.ir";
        //    //public const string WebSiteNoReplyMailPassword = "@@@Visualbasic7";
        //    //public const string WebSiteSupportMail = "";
        //    //public const string WebSiteSupportMailPassword = "";
        //    //public const string HostSmtpServer = "31.25.89.211"; 
        //}
        //public static class Prize
        //{
        //    //public const int CreateQuestionPrize = 10; is in database
        //    //public const int CreatedQuestionAccepted = 10;
        //    //public const int LikeQuestion = 1; in db
        //    //public const int Answering = 1; is in db
        //}
        public static class RoutesToIgnoreAuthentication
        {
            public const string UserAuthenticator = "UserAuthenticator";
            public const string UserInfo = "UserInfo";
        }

        //TODO : If second advert added needs to move to database
        public static class WatchAdVerfierAddress
        {
            public const string TapSellLink = "http://api.tapsell.ir/v2/suggestions/validate-suggestion";
        }

        public static class MarketMessages
        {
            //TODO : define expired message of different stores
            public static readonly string[] TokenExpire = new string[]
            {
                "token expired", 
                "second"
            };

        }
        public static class SpinWheel
        {
            public const int NumberOfSlots = 12;
        }


        public const string DefaultLegacyNamespaces = "http://vglr.ir";

        public static class MailTemplates
        {
            public static string Recovery
            {
                get
                {
                    return "<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">" +
"<html xmlns=\"http://www.w3.org/1999/xhtml\">" +
"<head>" +
"    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\" />" +
"    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />" +
"    <title>Set up a new password for [Product Name]</title>" +
"    <!--" +
"    The style block is collapsed on page load to save you some scrolling." +
"    Postmark automatically inlines all CSS properties for maximum email client" +
"    compatibility. You can just update styles here, and Postmark does the rest." +
"    -->" +
"    <style type=\"text/css\" rel=\"stylesheet\" media=\"all\">" +
"        /* Base ------------------------------ */" +
"        *:not(br):not(tr):not(html) {" +
"            font-family: Arial, 'Helvetica Neue', Helvetica, sans-serif;" +
"            box-sizing: border-box;" +
"        }" +
"        body {" +
"            width: 100% !important;" +
"            height: 100%;" +
"            margin: 0;" +
"            line-height: 1.4;" +
"            background-color: #F2F4F6;" +
"            color: #74787E;" +
"            -webkit-text-size-adjust: none;" +
"        }" +
"        p," +
"        ul," +
"        ol," +
"        blockquote {" +
"            line-height: 1.4;" +
"            text-align: left;" +
"        }" +
"        a {" +
"            color: #3869D4;" +
"        }" +
"            a img {" +
"                border: none;" +
"            }" +
"        /* Layout ------------------------------ */" +
"        .email-wrapper {" +
"            width: 100%;" +
"            margin: 0;" +
"            padding: 0;" +
"            -premailer-width: 100%;" +
"            -premailer-cellpadding: 0;" +
"            -premailer-cellspacing: 0;" +
"            background-color: #F2F4F6;" +
"        }" +
"        .email-content {" +
"            width: 100%;" +
"            margin: 0;" +
"            padding: 0;" +
"            -premailer-width: 100%;" +
"            -premailer-cellpadding: 0;" +
"            -premailer-cellspacing: 0;" +
"        }" +
"        /* Masthead ----------------------- */" +
"        .email-masthead {" +
"            padding: 25px 0;" +
"            text-align: center;" +
"        }" +
"        .email-masthead_logo {" +
"            width: 94px;" +
"        }" +
"        .email-masthead_name {" +
"            font-size: 16px;" +
"            font-weight: bold;" +
"            color: #bbbfc3;" +
"            text-decoration: none;" +
"            text-shadow: 0 1px 0 white;" +
"        }" +
"        /* Body ------------------------------ */" +
"        .email-body {" +
"            width: 100%;" +
"            margin: 0;" +
"            padding: 0;" +
"            -premailer-width: 100%;" +
"            -premailer-cellpadding: 0;" +
"            -premailer-cellspacing: 0;" +
"            border-top: 1px solid #EDEFF2;" +
"            border-bottom: 1px solid #EDEFF2;" +
"            background-color: #FFFFFF;" +
"        }" +
"        .email-body_inner {" +
"            width: 570px;" +
"            margin: 0 auto;" +
"            padding: 0;" +
"            -premailer-width: 570px;" +
"            -premailer-cellpadding: 0;" +
"            -premailer-cellspacing: 0;" +
"            background-color: #FFFFFF;" +
"        }" +
"        .email-footer {" +
"            width: 570px;" +
"            margin: 0 auto;" +
"            padding: 0;" +
"            -premailer-width: 570px;" +
"            -premailer-cellpadding: 0;" +
"            -premailer-cellspacing: 0;" +
"            text-align: center;" +
"        }" +
"            .email-footer p {" +
"                color: #AEAEAE;" +
"            }" +
"        .body-action {" +
"            width: 100%;" +
"            margin: 30px auto;" +
"            padding: 0;" +
"            -premailer-width: 100%;" +
"            -premailer-cellpadding: 0;" +
"            -premailer-cellspacing: 0;" +
"            text-align: center;" +
"        }" +
"        .body-sub {" +
"            margin-top: 25px;" +
"            padding-top: 25px;" +
"            border-top: 1px solid #EDEFF2;" +
"        }" +
"        .content-cell {" +
"            padding: 35px;" +
"        }" +
"        .preheader {" +
"            display: none !important;" +
"        }" +
"        /* Attribute list ------------------------------ */" +
"        .attributes {" +
"            margin: 0 0 21px;" +
"        }" +
"        .attributes_content {" +
"            background-color: #EDEFF2;" +
"            padding: 16px;" +
"        }" +
"        .attributes_item {" +
"            padding: 0;" +
"        }" +
"        /* Related Items ------------------------------ */" +
"        .related {" +
"            width: 100%;" +
"            margin: 0;" +
"            padding: 25px 0 0 0;" +
"            -premailer-width: 100%;" +
"            -premailer-cellpadding: 0;" +
"            -premailer-cellspacing: 0;" +
"        }" +
"        .related_item {" +
"            padding: 10px 0;" +
"            color: #74787E;" +
"            font-size: 15px;" +
"            line-height: 18px;" +
"        }" +
"        .related_item-title {" +
"            display: block;" +
"            margin: .5em 0 0;" +
"        }" +
"        .related_item-thumb {" +
"            display: block;" +
"            padding-bottom: 10px;" +
"        }" +
"        .related_heading {" +
"            border-top: 1px solid #EDEFF2;" +
"            text-align: center;" +
"            padding: 25px 0 10px;" +
"        }" +
"        /* Discount Code ------------------------------ */" +
"        .discount {" +
"            width: 100%;" +
"            margin: 0;" +
"            padding: 24px;" +
"            -premailer-width: 100%;" +
"            -premailer-cellpadding: 0;" +
"            -premailer-cellspacing: 0;" +
"            background-color: #EDEFF2;" +
"            border: 2px dashed #9BA2AB;" +
"        }" +
"        .discount_heading {" +
"            text-align: center;" +
"        }" +
"        .discount_body {" +
"            text-align: center;" +
"            font-size: 15px;" +
"        }" +
"        /* Social Icons ------------------------------ */" +
"        .social {" +
"            width: auto;" +
"        }" +
"            .social td {" +
"                padding: 0;" +
"                width: auto;" +
"            }" +
"        .social_icon {" +
"            height: 20px;" +
"            margin: 0 8px 10px 8px;" +
"            padding: 0;" +
"        }" +
"        /* Data table ------------------------------ */" +
"        .purchase {" +
"            width: 100%;" +
"            margin: 0;" +
"            padding: 35px 0;" +
"            -premailer-width: 100%;" +
"            -premailer-cellpadding: 0;" +
"            -premailer-cellspacing: 0;" +
"        }" +
"        .purchase_content {" +
"            width: 100%;" +
"            margin: 0;" +
"            padding: 25px 0 0 0;" +
"            -premailer-width: 100%;" +
"            -premailer-cellpadding: 0;" +
"            -premailer-cellspacing: 0;" +
"        }" +
"        .purchase_item {" +
"            padding: 10px 0;" +
"            color: #74787E;" +
"            font-size: 15px;" +
"            line-height: 18px;" +
"        }" +
"        .purchase_heading {" +
"            padding-bottom: 8px;" +
"            border-bottom: 1px solid #EDEFF2;" +
"        }" +
"            .purchase_heading p {" +
"                margin: 0;" +
"                color: #9BA2AB;" +
"                font-size: 12px;" +
"            }" +
"        .purchase_footer {" +
"            padding-top: 15px;" +
"            border-top: 1px solid #EDEFF2;" +
"        }" +
"        .purchase_total {" +
"            margin: 0;" +
"            text-align: right;" +
"            font-weight: bold;" +
"            color: #2F3133;" +
"        }" +
"        .purchase_total--label {" +
"            padding: 0 15px 0 0;" +
"        }" +
"        /* Utilities ------------------------------ */" +
"        .align-right {" +
"            text-align: right;" +
"        }" +
"        .align-left {" +
"            text-align: left;" +
"        }" +
"        .align-center {" +
"            text-align: center;" +
"        }" +
"        /*Media Queries ------------------------------ */" +
"        @media only screen and (max-width: 600px) {" +
"            .email-body_inner," +
"            .email-footer {" +
"                width: 100% !important;" +
"            }" +
"        }" +
"        @media only screen and (max-width: 500px) {" +
"            .button {" +
"                width: 100% !important;" +
"            }" +
"        }" +
"        /* Buttons ------------------------------ */" +
"        .button {" +
"            background-color: #3869D4;" +
"            border-top: 10px solid #3869D4;" +
"            border-right: 18px solid #3869D4;" +
"            border-bottom: 10px solid #3869D4;" +
"            border-left: 18px solid #3869D4;" +
"            display: inline-block;" +
"            color: #FFF;" +
"            text-decoration: none;" +
"            border-radius: 3px;" +
"            box-shadow: 0 2px 3px rgba(0, 0, 0, 0.16);" +
"            -webkit-text-size-adjust: none;" +
"        }" +
"        .button--green {" +
"            background-color: #22BC66;" +
"            border-top: 10px solid #22BC66;" +
"            border-right: 18px solid #22BC66;" +
"            border-bottom: 10px solid #22BC66;" +
"            border-left: 18px solid #22BC66;" +
"        }" +
"        .button--red {" +
"            background-color: #FF6136;" +
"            border-top: 10px solid #FF6136;" +
"            border-right: 18px solid #FF6136;" +
"            border-bottom: 10px solid #FF6136;" +
"            border-left: 18px solid #FF6136;" +
"        }" +
"        /* Type ------------------------------ */" +
"        h1 {" +
"            margin-top: 0;" +
"            color: #2F3133;" +
"            font-size: 19px;" +
"            font-weight: bold;" +
"            text-align: left;" +
"        }" +
"        h2 {" +
"            margin-top: 0;" +
"            color: #2F3133;" +
"            font-size: 16px;" +
"            font-weight: bold;" +
"            text-align: left;" +
"        }" +
"        h3 {" +
"            margin-top: 0;" +
"            color: #2F3133;" +
"            font-size: 14px;" +
"            font-weight: bold;" +
"            text-align: left;" +
"        }" +
"        p {" +
"            margin-top: 0;" +
"            color: #74787E;" +
"            font-size: 16px;" +
"            line-height: 1.5em;" +
"            text-align: left;" +
"        }" +
"            p.sub {" +
"                font-size: 12px;" +
"            }" +
"            p.center {" +
"                text-align: center;" +
"            }" +
"    </style>" +
"</head>" +
"<body>" +
"    <span class=\"preheader\">Use this link to reset your password. The link is only valid for 24 hours.</span>" +
"    <table class=\"email-wrapper\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">" +
"        <tr>" +
"            <td align=\"center\">" +
"                <table class=\"email-content\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">" +
"                    <tr>" +
"                        <td class=\"email-masthead\">" +
"                            <a href=\"https://Chimishod.ir\" class=\"email-masthead_name\">" +
"                                Chimishod" +
"                            </a>" +
"                        </td>" +
"                    </tr>" +
"                    <!-- Email Body -->" +
"                    <tr>" +
"                        <td class=\"email-body\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">" +
"                            <table class=\"email-body_inner\" align=\"center\" width=\"570\" cellpadding=\"0\" cellspacing=\"0\">" +
"                                <!-- Body content -->" +
"                                <tr>" +
"                                    <td class=\"content-cell\">" +
"                                        <h1>Hi {0},</h1>" +
"                                        <p>You recently requested to get user name and password for Chimishod account.Use following information to enter your account.<strong> Remember to change your password </strong>" +
"                                        <!-- Action -->" +
"                                        <table class=\"body-action\" align=\"center\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">" +
"                                            <tr>" +
"                                                <td align=\"center\">" +
"                                                    <!-- Border based button" +
"                                                    https://litmus.com/blog/a-guide-to-bulletproof-buttons-in-email-design -->" +
"                                                    <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">" +
"                                                        <tr>" +
"                                                            <td align=\"center\">" +
"                                                                <table border=\"0\" cellspacing=\"0\" cellpadding=\"0\">" +
"                                                                    <tr>" +
"                                                                        <td>" +
"                                                                            <a href=\"{{action_url}}\" class=\"button button--green\" target=\"_blank\">User Name : {1} , Password : {2}</a>" +
"                                                                        </td>" +
"                                                                    </tr>" +
"                                                                </table>" +
"                                                            </td>" +
"                                                        </tr>" +
"                                                    </table>" +
"                                                </td>" +
"                                            </tr>" +
"                                        </table>" +
"                                        <p>For security, this request was received from a mobile device. If you did not request a password reset, please ignore this email or <a href=\"{{mailto:support@chimishod.ir}}\">contact support</a> if you have questions.</p>" +
"                                        <p>" +
"                                            Thanks," +
"                                            <br>The FlappCo Team" +
"                                        </p>" +
"                                        <!-- Sub copy -->" +
"                                        <table class=\"body-sub\">" +
"                                            <tr>" +
"                                                <td>" +
"                                                    <p class=\"sub\">If you’re having trouble with the button above, copy and paste the URL below into your web browser.</p>" +
"                                                    <p class=\"sub\">Email : Support@Flapp.ir</p>" +
"                                                </td>" +
"                                            </tr>" +
"                                        </table>" +
"                                    </td>" +
"                                </tr>" +
"                            </table>" +
"                        </td>" +
"                    </tr>" +
"                    <tr>" +
"                        <td>" +
"                            <table class=\"email-footer\" align=\"center\" width=\"570\" cellpadding=\"0\" cellspacing=\"0\">" +
"                                <tr>" +
"                                    <td class=\"content-cell\" align=\"center\">" +
"                                        <p class=\"sub align-center\">&copy; 2017 Chimishod. All rights reserved.</p>" +
"                                        <p class=\"sub align-center\">" +
"                                            [Company Name, LLC]" +
"                                            <br>1234 Street Rd." +
"                                            <br>Suite 1234" +
"                                        </p>" +
"                                    </td>" +
"                                </tr>" +
"                            </table>" +
"                        </td>" +
"                    </tr>" +
"                </table>" +
"            </td>" +
"        </tr>" +
"    </table>" +
"</body>" +
"</html>";
                }
            }
        }
    }
}
