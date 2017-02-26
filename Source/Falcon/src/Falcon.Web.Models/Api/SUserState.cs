// Flapp Copyright 2017-2018

namespace Falcon.Web.Models.Api
{
    public class SUserState
    { 
        //Should Refactor this to multiple files
        public int? UserStar { get; set; }
        public int? SelectedCategoryID { get; set; }
        public int? SelectedThemeID { get; set; }
        public string SelectedCategoryName { get; set; }
        public int SelectedCategoryCoEfficient { get; set; }
        public bool Bought { get; set; }
        public int RequestID { get; set; }
    }
}
