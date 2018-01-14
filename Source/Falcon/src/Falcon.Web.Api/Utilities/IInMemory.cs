namespace Falcon.Web.Api.Utilities
{
    public interface IInMemory<T>
    {
        T GetState();
        bool SetState(T NewState);
        void ReadStateFromDatabase();
    }
}
