using System;

namespace Falcon.Development.Console
{
    class Program
    {
        static void Main(string[] args)
        {
            var data = new Uri("http://api.cafebazzar.ir/v1/authentication/data");
            var host = data.Host;
            string schema = data.Scheme;

            var baseUri = data.GetLeftPart(UriPartial.Authority);
            
            System.Console.WriteLine("host : " + host);
        }
    }
}
