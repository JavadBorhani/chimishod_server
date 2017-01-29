// BMS-Studio Copyright 2017-2018
using System;

namespace Falcon.Data.Exceptions
{
    [Serializable]
    public class ChildObjectNotFoundException : Exception
    {
        public ChildObjectNotFoundException(string message) : base(message)
        {

        }
    }
}
