using System.Net;

namespace Falcon.Development.Console
{
    class Program
    {
       

        public static void Main(string[] args)
        {
            var item = Dns.GetHostEntry(Dns.GetHostName()).AddressList[1].ToString();

            IPAddress address = IPAddress.Parse("::1");

            var ipV4 = address.MapToIPv6();
        }

    }
}
