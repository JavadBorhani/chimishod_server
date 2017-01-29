﻿// BMS-Studio Copyright 2017-2018
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;

namespace Falcon.Web.Models.Api
{
    public class SQuestion
    {
        public int ID { get; set; }
        public string What_if { get; set; }
        public string But { get; set; }
        public int Catgory_ID { get; set; }
        public int Yes_Count { get; set; }
        public int No_Count { get; set; }
        public int Like_Count { get; set; }
        public int Dislike_Count { get; set; }
        public double Weight { get; set; }
        public string CreatorID { get; set; }
        public System.DateTime CreatedDate { get; set; }
        public System.DateTime UpdateDate { get; set; }
        public bool Banned { get; set; }
    }
}