namespace Falcon.Web.Api.Utilities.Mail
{
    public interface IMailManager
    {
        string SendRecoverySupportMail(string To, string Subject, string Mail , string UserName , string Password);
        string SendQuestionCreationRequest(string Subject, string What, string But, int QuestionID);
    }
}