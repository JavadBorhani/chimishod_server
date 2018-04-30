namespace Falcon.Web.Models.Api.Purchase
{
    public interface IPurchase<T>
    {
        T Contents { get; set; }
        bool Purchased { get; set; }
        int TotalCoin { get; set; }
    }
}
