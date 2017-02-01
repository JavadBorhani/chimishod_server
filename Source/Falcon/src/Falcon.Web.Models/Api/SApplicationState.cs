using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Falcon.Web.Models.Api
{
    public class SApplicationState
    {
        public int ID { get; set; }
        public int FavoritePrice { get; set; }
        public string DefaultUserName { get; set; }
        public int DefaultUserCoin { get; set; }
        public int CreateQuestionPrice { get; set; }
    }
}
