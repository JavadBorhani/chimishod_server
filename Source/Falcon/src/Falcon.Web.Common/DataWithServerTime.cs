using System;

namespace Falcon.Web.Common
{
    public class DataWithServerTime<T>
    {
        public T Data { get; set; }
        public DateTime ServerTime { get; set; }
    }
}
