using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Falcon.Web.Api.Security.Public
{
    public interface IEncryptor
    {
        float   DecryptDouble(string Number); // decrypt floats using two different maps 
        string  EncryptDouble(float Number , bool UseSecondMap = false); // encrypt floats using sin and cos functions
        string  EncryptInt(int ItemNumber); // encrypt id items , decrypt function is in client
        int     DecryptInt(string Item); // decrypt encrypted string from client , encrypt function is not hear
        string  EncryptString(string expression); // encrypt Persian string to unclear one, decrypt is in client
        string  DecryptString(string expression); // decrypt strings to Persian 
    }
}
