using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Falcon.Common.Serialization
{
    public interface IJsonManager
    {
        T DeserializeObject<T>(string value);
        object DeserializeObject(string value, Type type);
        string SerializeObject(object value); 
    }
}
