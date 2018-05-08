using Falcon.Common;
using Falcon.Web.Api.MaintenanceProcessing.Public;
using Falcon.Web.Models.Api;
using System;
using System.Net;
using System.Net.Mail;

namespace Falcon.Web.Api.Utilities.Mail
{
    public class MailManager : IMailManager
    {
        private readonly SApplicationState mApplicationState;
        public MailManager(IGlobalApplicationState GlobalApplicationState)
        {
            mApplicationState = GlobalApplicationState.GetState();
        }

        public string SendRecoverySupportMail(string To, string Subject, string Mail, string UserName, string Password)
        {
            try
            {
                string body = Constants.MailTemplates.Recovery.Replace("{0}", Mail).Replace("{1}" , UserName).Replace("{2}" , Password);

                MailMessage message = new MailMessage(mApplicationState.Host_SupportMail, To, Subject, body);
                NetworkCredential credentials = new NetworkCredential(mApplicationState.HostCredentialUserName, mApplicationState.HostCredentialPassword);
                SmtpClient smtpobj = new SmtpClient(mApplicationState.Host_SmtpServer, 25);
                message.IsBodyHtml = true;
                smtpobj.UseDefaultCredentials = false;
                smtpobj.EnableSsl = false;
                smtpobj.Credentials = credentials;
                smtpobj.Send(message);
                return "1";
            }
            catch(Exception exception)
            {
                return exception.Message;
            }
        }

        public string SendQuestionCreationRequest(string Subject, string What, string But , int QuestionID)
        {
            try
            {
                var ban = string.Format(mApplicationState.ServerTelegramPath, QuestionID, 0);
                var ok = string.Format(mApplicationState.ServerTelegramPath, QuestionID, 1);


                var html = Constants.MailTemplates.QuestionCreation.Replace("{0}", mApplicationState.QuestionCreation_MailTo)
                    .Replace("{1}" , What)
                    .Replace("{2}" , But)
                    .Replace("{3}" , ban)
                    .Replace("{4}",  ok);
                
                MailMessage message = new MailMessage(mApplicationState.Host_SupportMail, mApplicationState.QuestionCreation_MailTo, Subject, html);

                if(mApplicationState.QuestionCreation_MailCC != null)
                    message.CC.Add(mApplicationState.QuestionCreation_MailCC);

                NetworkCredential credentials = new NetworkCredential(mApplicationState.HostCredentialUserName, mApplicationState.HostCredentialPassword);
                SmtpClient smtpobj = new SmtpClient(mApplicationState.Host_SmtpServer, 25);
                message.IsBodyHtml = true;
                smtpobj.UseDefaultCredentials = false;
                smtpobj.EnableSsl = false;
                smtpobj.Credentials = credentials;
                smtpobj.Send(message);
                return "1";
            }
            catch (Exception exception)
            {
                return exception.Message;
            }
        }

    }
}