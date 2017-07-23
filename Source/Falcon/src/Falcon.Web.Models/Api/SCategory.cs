﻿// Flapp Copyright 2017-2018

using System.Collections.Generic;

namespace Falcon.Web.Models.Api
{
    public class CategoryAnswerCount
    {
        public int CategoryID { get; set; }
        public int AnswerCount { get; set; }
    }


    public class SCategory
    {
        public int ID { get; set; }
        public string Name { get; set; }
        public string ShortDescription { get; set; }
        public string LongDescription { get; set; }
        public string Icon { get; set; }
        public int Price { get; set; }
        public bool IsActive { get; set; }
        public bool IsPurchased { get; set; }
        public int PrizeCoefficient { get; set; }
        public int DiscountAmount { get; set; }
        public int TagState { get; set; }
        public IEnumerable<int> CharacterIds { get; set; }
    }
}
