namespace Falcon.Data
{
    public class PagedDataRequest
    {
        public int PageNumber { get; private set; }
        public int PageSize { get; private set; }
        public PagedDataRequest(int pageNumber, int pageSize)
        {
            PageNumber = pageNumber;
            PageSize = pageSize;
        }
    }
}
