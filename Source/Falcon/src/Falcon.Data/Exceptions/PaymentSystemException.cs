using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Falcon.Data.Exceptions
{
    [Serializable]
    public class  PaymentSystemException : Exception
    {
        public PaymentSystemException(string Message): base(Message)
        {

        }
    }
}
