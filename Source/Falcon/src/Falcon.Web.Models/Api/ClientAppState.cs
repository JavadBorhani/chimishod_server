using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Falcon.Web.Models.Api
{
    public class ClientAppState
    {

        public int FavoritePrice { get; set;}
        public int CreateQuestionPrice { get; set; }
        public int AnswerPrize { get; set;}
        public int LikePrize { get; set; }
        public int CreateNewQuestionPrize { get; set; }
        public int WatchAdCoin { get; set; }
        public int SpinWheelFortuneThreshold { get; set; }
    }
}
