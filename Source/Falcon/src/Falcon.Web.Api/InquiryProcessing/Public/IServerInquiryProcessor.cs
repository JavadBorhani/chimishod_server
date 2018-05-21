namespace Falcon.Web.Api.InquiryProcessing.Public
{
    public interface IServerInquiryProcessor
    {
        bool ReadConfigurationFilesFromServer();
        bool AddWarmUpConfiguration(); // add first time data to tables 
    }
}