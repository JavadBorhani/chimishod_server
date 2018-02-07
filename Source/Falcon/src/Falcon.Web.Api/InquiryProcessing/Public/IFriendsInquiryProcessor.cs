using Falcon.Data;
using Falcon.Web.Models;
using Falcon.Web.Models.Api.Friend;
using System.Threading.Tasks;

namespace Falcon.Web.Api.InquiryProcessing.Public
{
    public interface IFriendsInquiryProcessor
    {
        Task<SFriend[]> GetAllFriendList();
        Task<int[]> GetAllFriendIds();
        Task<bool> HasFriends(int[] FriendIds);
        Task<PagedDataInquiryResponse<SPublicQuestionWithAnswerState>> GetFriendPublicQuestions(PagedDataRequest RequestInfo, int FriendID);
        Task<PagedDataInquiryResponse<SPublicQuestionWithAnswerState>> GetFriendMutualQuestions(PagedDataRequest RequestInfo, int FriendID);
    }
}
