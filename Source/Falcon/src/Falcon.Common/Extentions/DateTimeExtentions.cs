using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Falcon.Common.Extentions
{
    public static class DateTimeExtentions
    {
        public static DateTime ConvertEpochToUTCHumanReadable(this DateTime value , long TimeInMilliseconds)
        {
            return new DateTime(1970, 1, 1, 0, 0, 0, DateTimeKind.Utc).AddMilliseconds(TimeInMilliseconds);
        }
    }
}
