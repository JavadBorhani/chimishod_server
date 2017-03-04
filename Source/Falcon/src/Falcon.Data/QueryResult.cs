using Falcon.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Falcon.Data
{
    public class QueryResult<T>
    {
        /// <summary>
        ///     The total number of items, unrestricted by paging logic.
        /// </summary>
        public int TotalItemCount { get; private set; }

        public IEnumerable<T> QueriedItems { get; private set; }

        public int PageSize { get; private set; }

        public int TotalPageCount
        {
            get
            {
                return ResultPagingUtility.CalculatePageCount(TotalItemCount, PageSize);
            }
        }

        public QueryResult(IEnumerable<T> queriedItems, int totalItemCount, int pageSize)
        {
            PageSize = pageSize;
            TotalItemCount = totalItemCount;
            QueriedItems = queriedItems ?? new List<T>();
        }
    }
}
