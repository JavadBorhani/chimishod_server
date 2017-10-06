using System;
using System.Text;

namespace Falcon.Client.App.Logic
{
    public class UUIDGenerator
    {

        public static string[] Generate(int Amount)
        {
            if (Amount <= 0)
                return null;

            var resultData = new string[Amount];

            for(int i = 0; i < Amount; ++i)
            {
                var uuid = Encoding.UTF8.GetBytes(Guid.NewGuid().ToString());
                resultData[i] = Convert.ToBase64String(uuid);
            }

            return resultData;
        }
    }
}
