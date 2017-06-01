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
        private const int CharacterAmount = 20;

        public double DecryptFloat(string Number)
        {
            StringBuilder decStr = new StringBuilder(Number.Substring(5));

            foreach(var entry in keyMap)
            {
                decStr = decStr.Replace(entry.Value, entry.Key);
            }

            double dec = Convert.ToDouble(decStr);
            dec /= -1.618033f;

            dec = ((Math.Asin(dec) * (180 / Math.PI)));
            return dec;
        }

        public int DecryptInt(string Code)
        {
            if (Code.Length != CharacterAmount)
                return -1;

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

        public string EncryptFloat(double Number)
        {
            float enc = (float)Math.Sin(Math.PI * Number / 180.0f);
            enc *= -1.618033f;

            StringBuilder encStr = new StringBuilder(enc.ToString());

            foreach (var entry in keyMap)
            {
                encStr = encStr.Replace(entry.Key, entry.Value);
            }

            return GetRandomString(5) + encStr;
        }

        public string EncryptInt(int ItemID)
        {
            string spinstrid = ItemID.ToString("D3");
            StringBuilder idBuilder = new StringBuilder(GetRandomString(CharacterAmount));

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
            return new string(buf);
        }

        private static readonly Dictionary<string, string> keyMap = new Dictionary<string, string>()
        {
            {"1" , "@"},
            {"2" , "&"} ,
            {"3" , "?"} ,
            {"4" , "~"} ,
            {"5" , "C"} ,
            {"6" , "N"} ,
            {"7" , "{"} ,
            {"8" , "l"} ,
            {"9" , "x"} ,
            {"0" , "G"} ,
            {"." , "F"} ,
        };
    }
}