using Falcon.Data;
using Falcon.Web.Models;
using Falcon.Web.Models.Api.Answer;
using Falcon.Web.Models.Api.Friend;
using Falcon.Web.Models.Api.Notification.Client;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Falcon.Web.Api.InquiryProcessing.Public
{
    public interface IFriendsInquiryProcessor
    {
        Task<SFriend[]> GetAllFriendList();
        Task<SFriend> GetFriend(int FriendID);
        Task<int[]> GetAllFriendIds();
        Task<bool> HasFriends(int[] FriendIds);
        Task<PagedDataInquiryResponse<SQuestionWithAnswerState>> GetFriendPublicQuestions(PagedDataRequest RequestInfo, int FriendID);
        Task<PagedDataInquiryResponse<SQuestionWithAnswerState>> GetFriendMutualQuestions(PagedDataRequest RequestInfo, int FriendID);
        Task<SFriendAnswer[]> GetFriendAnswers(SFriendAnswerInquiry FriendAnswerInquiry);
        Task<SFriendStatus> GetFriendListFromDateUpToNow(DateTime FriendRequestDate , DateTime FriendResponseDate);
        List<SUserNameAndImagePath> GetFriendUserNameAndImageFromCache(SFriendCharacterDetailInquiry FriendList);

    }
}
