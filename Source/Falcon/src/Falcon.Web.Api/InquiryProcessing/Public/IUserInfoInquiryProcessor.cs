using Falcon.Web.Models.Api;
using System.Threading.Tasks;

namespace Falcon.Web.Api.InquiryProcessing.Public
{
    public interface IUserInfoInquiryProcessor
    {
        Task<bool> ForgotPassword(SGoogleAuthentication UserInfo);
    }
}
