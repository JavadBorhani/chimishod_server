// Flapp Copyright 2017-2018

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Falcon.Common
{
    public class DateTimeAdapter : IDateTime
    {
        public DateTime Now
        {
            get
            {
                return DateTime.Now;
            }
        }

        public DateTime UtcNow
        {
            get
            {
                return DateTime.UtcNow; 
            }
        }
        public long Ticks
        {
            get
            {
                return DateTime.Now.Ticks;
            }
        }
        public DateTime ConvertEpochToUTCHumanReadable(long TimeInMilliseconds)
        {
            return new DateTime(1970, 1, 1, 0, 0, 0, DateTimeKind.Utc).AddMilliseconds(TimeInMilliseconds);
        }

        public DateTime ConvertEpochToLocalHumanReadable(long TimeInMilliseconds)
        {
            return TimeZoneInfo.ConvertTime(ConvertEpochToUTCHumanReadable(TimeInMilliseconds), TimeZoneInfo.Local);
        }
    }
}
