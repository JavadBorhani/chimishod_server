using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Falcon.Web.Models.Api
{
    public class SDisplayedNotification
    {
        public int UserID { get; set; }
        public int NotificationID { get; set; }
        public DateTime ExpireDate { get; set; }
        public DateTime InsertDate { get; set; } 
    }
}
