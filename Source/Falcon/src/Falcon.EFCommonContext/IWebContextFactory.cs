namespace Falcon.EFCommonContext
{
    public interface IWebContextFactory
    {
        bool ContextExists { get; }
        IDbContext GetCurrentContext();
        IDbContext GetNewOrCurrentContext();
        void Reset();
        void IncrementConnectionCount();
        void DecrementConnectionCount();
    }
}