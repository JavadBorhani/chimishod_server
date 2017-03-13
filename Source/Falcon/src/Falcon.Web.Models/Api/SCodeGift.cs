using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Falcon.Web.Models.Api
{
    public enum ResponseState
    {
        IsExpired = 1 , 
        HasGot = 2 , 
        Ok = 3 ,
        NotExists = 4 , 
    }
    public class SCodeGift
    {
        public int ID { get; set; }
        public int TotalCoin { get; set; }        
        public ResponseState ResponseCode { get; set; }
    }
}
    