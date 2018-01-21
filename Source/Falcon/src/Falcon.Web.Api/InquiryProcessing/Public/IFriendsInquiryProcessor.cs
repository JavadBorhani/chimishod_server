using Falcon.Web.Models.Api.Friend;
using System.Threading.Tasks;

namespace Falcon.Web.Api.InquiryProcessing.Public
{
    public interface IFriendsInquiryProcessor
    {
        Task<SFriend[]> GetFriendList();
    }
}
