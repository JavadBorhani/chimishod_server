namespace Falcon.Common.Utils
{
    public static class Utils
    {
        public static long[] StringToLongArray(string Expression , char SplitBy)
        {
            var items = Expression.Split(SplitBy);
            var numbers = new long[items.Length];

            for (int i = 0; i < items.Length; ++i)
            {
                numbers[i] = long.Parse(items[i]);
            }
            return numbers;
        }
    }
}
