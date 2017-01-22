using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Falcon.Web.Models.Api
{
    public class UserState
    { 
        public int? UserStar { get; set; }
        public int? SelectedCategoryID { get; set; }
        public int? SelectedThemeID { get; set; }
        public string SelectedCategoryName { get; set;  }
    }
}
