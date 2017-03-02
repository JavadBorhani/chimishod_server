using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Falcon.Web.Models
{
    public class PagedDataInquiryResponse<T> : IPageContaining
    {
        private List<T> mItems;

        public List<T> Items
        {
            get { return mItems ?? (mItems = new List<T>()); }
            set { mItems = value; }
        }
        public int PageCount { get; set; }
        public int PageNumber{ get; set; }
        public int PageSize { get; set; }
    }
}
