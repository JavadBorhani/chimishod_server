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
    }
}