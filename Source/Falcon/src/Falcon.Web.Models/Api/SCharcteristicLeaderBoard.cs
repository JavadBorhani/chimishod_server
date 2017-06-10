using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Falcon.Web.Models.Api
{
    public class SCharcteristicLeaderBoard
    {
        public PagedDataInquiryResponse<SLeaderBoard> Players { get; set; }
        public SLeaderBoard User { get; set; }
    }
}
