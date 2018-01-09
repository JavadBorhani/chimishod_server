using System;

namespace Falcon.Common
{
    public class UUIDGenerator : IUUIDGenerator
    {
        public string GetNewUUID()
        {
            return Guid.NewGuid().ToString();
        }
    }
}
