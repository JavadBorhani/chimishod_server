// Flapp Copyright 2017-2018
using System;

namespace Falcon.Common
{
    public class BusinessRuleViolationException : Exception
    {

        public BusinessRuleViolationException(string incorrectTaskStatus) : base (incorrectTaskStatus)
        {
            // Empty 
        }
    }
}
