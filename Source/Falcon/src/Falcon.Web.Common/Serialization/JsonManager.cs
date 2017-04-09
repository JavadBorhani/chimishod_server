using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Falcon.Common.Serialization
{
    public class JsonManager : IJsonManager
    {

        public T DeserializeObject<T>(string value)
        {
            return JsonConvert.DeserializeObject<T>(value);

        }
        public object DeserializeObject(string value, Type type)
        {
            return JsonConvert.DeserializeObject(value, type);
        }

        public string SerializeObject(object value)
        {
            return JsonConvert.SerializeObject(value);
        }
    }
}
