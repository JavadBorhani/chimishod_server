using Falcon.Common;
using Falcon.Common.Logging;
using Falcon.Web.Api.MaintenanceProcessing.Public;
using Falcon.Web.Common;
using Falcon.Web.Models.Api;
using log4net;
using log4net.Core;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;

namespace Falcon.Web.Api.Utilities
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