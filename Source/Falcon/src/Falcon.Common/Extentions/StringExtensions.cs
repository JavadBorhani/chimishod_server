using System;

namespace Falcon.Common.Extentions
{
    public static class StringExtensions
    {
        public static string[] Lines(this string source , string Splitter)
        {
            return source.Split(new string[] { Splitter}, StringSplitOptions.None);
        }
    }
}
