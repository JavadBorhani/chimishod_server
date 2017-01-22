using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Falcon.Web.Models.Api
{
    public class AppTheme
    {
        public int ID { get; set; }
        public string Name { get; set; }
        public string ShortDesciption { get; set; }
        public string LongDescription { get; set; }
        public string SquareColor { get; set; }
        public string CircleColor { get; set; }
        public int Price { get; set; }
        public string Style { get; set; }
        public DateTime CreatedDate { get; set; }
        public DateTime UpdatedDate { get; set; }
        public bool IsActive { get; set; }
        public bool IsPurchased { get; set; }
    }
}
