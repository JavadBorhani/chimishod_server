using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Falcon.Web.Models.Api
{
    public class SNotify
    {
        public enum NotificationType
        {
            Gift  = 1 , 
            Other = 2 , 
        }
        public int ID { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
        public string Image { get; set; }
        public NotificationType Type { get; set; }
        public int Prize { get; set; }
    }
}
