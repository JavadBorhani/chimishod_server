using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;

namespace Falcon.Web.Models.Api
{
    public class Category
    {
        public int ID { get; set; }
        public string Name { get; set; }
        public string ShortDescription { get; set; }
        public string LongDescription { get; set; }
        public string SquareColor { get; set; }
        public string CircleColor { get; set; }
        public string RectangleColor { get; set; }
        public int Price { get; set; }
        public bool IsActive { get; set; }
        public bool IsPurchased { get; set; }
    }
}
