/// BMS-Studio Copyright 2017-2018

namespace Falcon.Common.TypeMapping
{
    public interface IAutoMapper
    {
        T Map<T>(object objectToMap);
    }
}
