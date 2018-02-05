using Newtonsoft.Json;
using System;

namespace Falcon.Common.Serialization
{
    public class JsonManager : IJsonManager
    {

        public T DeserializeObject<T>(string value)
        {
            try
            {
                return JsonConvert.DeserializeObject<T>(value);
            }
            catch
            {
                return default(T);
            }
        }
        public object DeserializeObject(string value, Type type)
        {
            try
            {
                return JsonConvert.DeserializeObject(value, type);
            }
            catch
            {
                return null;
            }
        }

        public string SerializeObject(object value)
        {
            return JsonConvert.SerializeObject(value);
        }
    }
}
