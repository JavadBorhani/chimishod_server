using Falcon.Web.Api.Security.Public;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Threading.Tasks;
using System.Text;
using Falcon.Common;

namespace Falcon.Web.Api.Security.Private
{
    public class NumberEncryptor : IEncryptor
    {
        private readonly IRandomGenerator mRandGenerator;
        public NumberEncryptor(IRandomGenerator RandomGenerator)
        {
            mRandGenerator = RandomGenerator;
        }
        private const int CharacterAmount = 20;

        public float DecryptDouble(string Number)
        {
            StringBuilder decStr = new StringBuilder(Number.Substring(5));

            foreach(var entry in firstKeyMap)
            {
                decStr = decStr.Replace(entry.Value, entry.Key);
            }

            float dec = Convert.ToSingle(decStr);
            dec /= -1.618033f;

            dec = (float)((Math.Asin(dec) * (180 / Math.PI)));
            return dec;
        }

        public int DecryptInt(string Code)
        {
            if (Code.Length != CharacterAmount)
                return -1;

            StringBuilder builder = new StringBuilder(Code);



            builder[1] = (char)(builder[1] - (1 * 23));
            builder[3] = (char)(builder[3] - (3 * 23));
            builder[5] = (char)(builder[5] - (5 * 23));
            builder[7] = (char)(builder[7] - (7 * 23));
            builder[9] = (char)(builder[9] - (9 * 23));
            builder[11] = (char)(builder[11] - (11 * 23));
            builder[13] = (char)(builder[13] - (13 * 23));
            builder[14] = (char)(builder[14] - (14 * 23));
            builder[17] = (char)(builder[17] - (17 * 23));
            builder[18] = (char)(builder[18] - (18 * 23));


            bool valid = false;
            char ch0 = (char)(builder[14] - 11);
            char ch1 = (char)(builder[18] + 49);
            if ((builder[3] == ch0) && (builder[13] == ch1))
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

        public string EncryptDouble(float Number , bool UseSecondMap = false)
        {
            float enc = (float)Math.Sin(Math.PI * Number / 180.0f);
            enc *= -1.618033f;

            StringBuilder encStr = new StringBuilder(enc.ToString());

            if(UseSecondMap)
            {
                foreach (var entry in secondKeyMap)
                {
                    encStr = encStr.Replace(entry.Key, entry.Value);
                }
            }
            else
            {
                foreach (var entry in firstKeyMap)
                {
                    encStr = encStr.Replace(entry.Key, entry.Value);
                }
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
            char[] buf = new char[length];
            for (int i = 0; i < buf.Length; i++)
            {
                buf[i] = (char)mRandGenerator.Next(127);
            }
            return new string(buf);
        }

        public string EncryptString(string expression)
        {
            string randString = GetRandomString(expression.Length);

            StringBuilder builder = new StringBuilder(randString, expression.Length * 2);

            for (int i = expression.Length, index = 0; i < expression.Length * 2; ++i, ++index)
            {
                builder.Append((char)(expression[index] - randString[index]));
            }

            return builder.ToString();
        }
        public string DecryptString(string expression)
        {
            string Base = expression.Substring(0, expression.Length / 2);
            string value = expression.Substring(expression.Length / 2);

            char[] outPut = new char[value.Length];
            for (int i = 0; i < value.Length; i++)
            {
                outPut[i] = (char)(value[i] + Base[i]);
            }

            string result = new string(outPut);
            return result;
        }

        private static readonly Dictionary<string, string> firstKeyMap = new Dictionary<string, string>()
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

        private static readonly Dictionary<string, string> secondKeyMap = new Dictionary<string, string>()
        {
            {"1" , "B"},
            {"2" , "}"} ,
            {"3" , "K"} ,
            {"4" , "#"} ,
            {"5" , "?"} ,
            {"6" , "M"} ,
            {"7" , "&"} ,
            {"8" , "J"} ,
            {"9" , "@"} ,
            {"0" , "a"} ,
            {"." , "©"} ,
        };
    }
}