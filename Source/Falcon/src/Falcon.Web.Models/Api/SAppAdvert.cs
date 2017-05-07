using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Falcon.Web.Models.Api
{
    public class SAppAdvert
    {
        public int ID { get; set; }
        public string Icon { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
        public string BackgroundColor { get; set; }
        public string MarketPackageName { get; set; }
        public string MarketIntentString { get; set; }
        public string AppStoreUri { get; set; }        
        public bool IsNew { get; set; }
    }
}
