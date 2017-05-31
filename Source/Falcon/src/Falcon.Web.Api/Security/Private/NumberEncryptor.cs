using Falcon.Web.Api.Security.Public;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Threading.Tasks;
using System.Text;

namespace Falcon.Web.Api.Security.Private
{
    public class NumberEncryptor : INumberEncryptor
    {
        public int Decrypt(string Code)
        {
            StringBuilder builder = new StringBuilder(Code);

            for (int i = 0; i < builder.Length; i++)
            {
                builder[i] = (char)(builder[i] - (i * 23));
            }

            bool valid = false;
            char ch0 = (char)(builder[14] - 11);
            char ch1 = (char)(builder[18] + 49);
            char ch00 = builder[3];
            char ch11 = builder[13];
            if ((ch00 == ch0) && (ch11 == ch1))
                valid = true;

            if (valid)
            {
                char[] ch = new char[3];
                ch[0] = (char)(builder[5] - builder[1]);
                ch[1] = (char)(builder[17] - builder[7]);
                ch[2] = (char)(builder[11] - builder[9]);


                string var = new string(ch);
                return Int32.Parse(var);
            }
            else
                return -1;
        }

        public string Encrypt(int ItemID)
        {
            string spinstrid = ItemID.ToString("D3");
            StringBuilder idBuilder = new StringBuilder(GetRandomString(20));

            char ch0 = (char)((spinstrid[0] + idBuilder[2]));
            char ch1 = (char)((spinstrid[1] + idBuilder[11]));
            char ch2 = (char)((spinstrid[2] + idBuilder[7]));
            idBuilder[3] = ch0;
            idBuilder[13] = ch1;
            idBuilder[17] = ch2;

            return idBuilder.ToString();
        }
        private string GetRandomString(int length)
        {
            Random random = new Random();
            char[] buf = new char[length];
            for (int i = 0; i < buf.Length; i++)
            {
                buf[i] = (char)random.Next(127);
            }
            return new String(buf);
        }

    }
}