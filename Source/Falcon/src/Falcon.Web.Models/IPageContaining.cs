using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Falcon.Web.Models
{
    public interface IPageContaining
    {
        int PageNumber { get; set; }
        int PageCount { get; set; }
    }
}
