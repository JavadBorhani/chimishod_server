namespace Falcon.Web.Common.Memmory
{
    public enum GlobalVariables { ConcurrencyIssueResolved , QuestToTakeSnapshot }
    public interface IMemoryStore
    {
        void SaveState<T>(GlobalVariables Variable , T Data);
        T LoadState<T>(GlobalVariables Variable);
    }
}
