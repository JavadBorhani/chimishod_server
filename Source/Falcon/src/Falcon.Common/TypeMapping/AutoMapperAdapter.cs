/// BMS-Studio Copyright 2017-2018
 
using AutoMapper;

namespace Falcon.Common.TypeMapping
{
    public class AutoMapperAdapter : IAutoMapper
    {
        public T Map<T>(object objectToMap)
        {
            return Mapper.Map<T>(objectToMap);
        }
    }
}
