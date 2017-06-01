using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Falcon.Web.Api.Security.Public
{
    public interface INumberEncryptor
    {
        double  DecryptDouble(string Number);
        string  EncryptDouble(double Number , bool UseSecondMap = false);
        string  EncryptInt(int ItemNumber);
        int     DecryptInt(string Item);
    }
}
