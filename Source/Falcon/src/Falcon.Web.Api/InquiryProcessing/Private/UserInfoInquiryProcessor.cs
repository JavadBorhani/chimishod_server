using Falcon.Data.QueryProcessors;
using Falcon.Web.Api.InquiryProcessing.Public;
using Falcon.Web.Api.JobSystem.Public;
using Falcon.Web.Api.Utilities.Mail;
using Falcon.Web.Models.Api;
using System.Threading.Tasks;

namespace Falcon.Web.Api.InquiryProcessing.Private
{
    public class UserInfoInquiryProcessor : IUserInfoInquiryProcessor
    {
        private readonly IUserInfoQueryProcessor mUserInfoQuery;
        private readonly IJobManager mJobManager;
        private readonly IMailManager mMailManager;

        public UserInfoInquiryProcessor(IUserInfoQueryProcessor UserInfoQueryProcessor , IJobManager JobManager , IMailManager MailManager)
        {
            mUserInfoQuery = UserInfoQueryProcessor;
            mJobManager = JobManager;
            mMailManager = MailManager;
        }

        public async Task<bool> ForgotPassword(SGoogleAuthentication UserInfo)
        {
            var userInfo = await mUserInfoQuery.GetLoginInfoByEmail(UserInfo);

            if (userInfo != null)
            {

                mJobManager.Enqueue(() =>
                mMailManager.SendRecoverySupportMail(UserInfo.Email, "بازیابی پسورد", UserInfo.Email, userInfo.UserName, userInfo.Password));

                return true;
            }
            return false;
        }
    }
}