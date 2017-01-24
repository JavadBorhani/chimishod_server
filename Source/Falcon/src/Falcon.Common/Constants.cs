using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Falcon.Common
{
    public static class Constants
    {
        public static class DefaulUser
        {
            public const string UserName = "Not-Set";
            public const int UserTypeID = 1;
            public const int TotalStar = 50;
            public const int LevelAnswerdNumber = 0;
            public const int CurrentLevelID = 1;
            public const bool IsAbleToWriteComment = true;
            public const int AppThemeID = 1;
            public const int CategoryID = 1;
            public const string FirstName = null;
            public const string LastName  = null;
            public const string Email     = null;
            public const string PhoneNumber = null;
            public const string GoogleID = null;
            public const bool IsVerified = false;
            public const bool IsBanned = false;
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
            public const int MinPageSize = 1;
            public const int MinPageNumber = 1;
            public const int DefaultPageNumber = 1;
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
            public const string CurrentApiVersion = "V1";
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
            public const int PurchasedThemeNumberOfAllowedBuy = 1;
        }
        public const string DefaultLegacyNamespaces = "http://vglr.ir";
    }
}
