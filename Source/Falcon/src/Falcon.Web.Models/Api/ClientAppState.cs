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
        public int AnswerScoreAmount { get; set;}
        public int AnswerXP { get; set; }
        public int LikeScoreAmount { get; set; }
        public int CreateNewQuestionScore { get; set; }
        public int CreateNewQuestionXP { get; set; }
        public int WatchAdCoin { get; set; }
        public int SpinWheelFortuneThreshold { get; set; }
        public int SpinWheelLoopPrice { get; set; }
    }
}
