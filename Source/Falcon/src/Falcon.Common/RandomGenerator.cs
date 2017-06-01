using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Falcon.Common
{
    public class RandomGenerator : IRandomGenerator
    {
        private static Random randGenerator = new Random();
        public int Next(int MaxValue)
        {
            return randGenerator.Next(MaxValue);
        }
    }
}
