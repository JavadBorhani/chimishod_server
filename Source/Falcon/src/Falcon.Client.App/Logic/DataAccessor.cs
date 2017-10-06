using Falcon.Client.App.Utils;
using Newtonsoft.Json;

namespace Falcon.Client.App.Logic
{
    public static class DataAccessor
    {
        public static string[] LoadUsers(FileSystem.FileTypes Types)
        {
            var rawData = FileSystem.Deserialize(FileSystem.FileTypes.Users);

            if(rawData != null)
            {
                var data = JsonConvert.DeserializeObject(rawData) as string[];
                return data;
            }
            return null;
        }
        public static void SaveUsers(string[] UUIDBase64)
        {

            var data = JsonConvert.SerializeObject(UUIDBase64);

            FileSystem.Serialize(FileSystem.FileTypes.Users, data);

        }
    }
}
