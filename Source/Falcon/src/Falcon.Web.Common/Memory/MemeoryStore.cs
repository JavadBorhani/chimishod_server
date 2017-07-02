using System.Web;

namespace Falcon.Web.Common.Memmory
{
    public class MemeoryStore : IMemoryStore
    {
        public T LoadState<T>(GlobalVariables Variable)
        {
            var data = HttpContext.Current.Items[Variable.ToString()];
            if(data != null)
            {
                return (T)data;
            }
            else
            {
                return default(T);
            }
        }

        public void SaveState<T>(GlobalVariables Variable, T Data)
        {
            HttpContext.Current.Items[Variable.ToString()] = Data;
        }
    }
}