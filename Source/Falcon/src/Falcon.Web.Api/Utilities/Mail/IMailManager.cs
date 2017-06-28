using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Falcon.Web.Api.Utilities.Mail
{
    public interface IMailManager
    {
        string SendRecoverySupportMail(string To, string Subject, string Mail , string UserName , string Password);
    }
}