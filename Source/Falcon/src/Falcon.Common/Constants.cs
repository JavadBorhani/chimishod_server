// Flapp Copyright 2017-2018

namespace Falcon.Common
{
    public static class Constants
    {
        public static class DefaultUser
        {
            public const string UserName = "Guest_";
            public const string Email     = null;
            public const string PhoneNumber = null;
            public const string GoogleID = null;
            public const bool IsVerified = false;
            public const bool IsBanned = false;
            public const bool IsAbleToWriteComment = true;
            public const int Score = 0;
            public const int UserTypeID = 1;
            public const int TotalStar = 200;
            public const int LevelProgress = 0; 
            public const int LevelAnswerdNumber = 0;
            public const int CurrentLevelD = 1;
            public const int LevelNumber = 1; 
            public const int AppThemeID = 1;
            public const int CategoryID = 1;
            //public const int CategoryCoeffecient = 1;
            public const int EditableCount = 2; 
            public const int AvatarID = 1; 
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
            public const int UserNumberToShow = 20;
            public const int MinPageSize = 1;
            public const int MinPageNumber = 1;
            public const int DefaultPageNumber = 1;
            public const int DefaultPageSize = 10;
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
            public const int Comment = 20;
            public const int Question = 5;
            public const int QuestionsToSkip = 2;
            public const int ServerBurntNumber = 1;  
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
            public const bool CommentDefaultVerify = true;
            public const string CommentDefaultReponseMessage = null;
            public const int FavoriteNumberOfFreeItems = 3;
            public const int FavoriteDefaultPrice = 5;
            public const int NoQuestionID = -1;
            public const string NoQuestionWhat = "داداش خوردی سرور ما رو";
            public const string NoQuestionBut = "سرورمون آب شد";
            public const int PurchaseThemeNumberAllowedToBuy = 1;
            public const int PurchaseCategoryNumberAllowedToBuy = 1;
            public const int CategoryNumberOfSelectAllowed = 1;
            public const int ThemeNumberOfSelectAllowed = 1;
            public const int CreateNewQuestionPrice = 30;
            public const int CreatedQuestionsVerified = 3;
            public const int CreatedQuestionIsInChecking = 2;
            public const int CreatedQuestionRejected = 1;
            public const int StoreNumberToSend = 20;
            public const int CreatedQuestionsDefaultID = -1;
            public const int AchievementsMinimumAchievables = 5;
            public const int AchievementDefaultNotAchievedID = 1;
            public const int AchievementDefaultAchievableID = 2;
            public const int AchievementDefaultAchievedID = 3;
            public const int AchievementCategoryQueryTypeID = 1;  
            public const int AchievementAdHocQueryTypeID = 2;
        }
        public static class DefaultHostConfig
        {
            public const string WebSiteNoReplyMail = "noreply@vglr.ir";
            public const string WebSiteNoReplyMailPassword = "@@@Visualbasic7";
            public const string WebSiteSupportMail = "";
            public const string WebSiteSupportMailPassword = "";
            public const string HostSmtpServer = "31.25.89.211"; 
        }
        public static class Prize
        {
            public const int CreateQuestionPrize = 10;
            public const int CreatedQuestionAccepted = 10;
            public const int LikeQuestion = 1;
            public const int Answering = 1; 
        }

        public const string DefaultLegacyNamespaces = "http://vglr.ir";
    }
}
