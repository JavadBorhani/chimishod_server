﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Falcon.Web.Models.Api
{
    public class SStore
    {
        public int ID { get; set; }
        public string SKU { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public int Coin { get; set; }
        public int Price { get; set; }
        public string Icon { get; set; }
        public string RectangleColor { get; set; }
        public int DiscountAmount { get; set; }
    }
}
