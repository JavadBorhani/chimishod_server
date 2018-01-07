using Falcon.Web.Api.InquiryProcessing.Public;
using Falcon.Web.Api.MaintenanceProcessing.Public;
using Falcon.Web.Api.Utilities.Base;
using Falcon.Web.Common;

namespace Falcon.Web.Api.Controllers.V2
{
    [UnitOfWorkActionFilter]
    public class FriendsController : FalconApiController
    {


        private readonly IFriendsMaintenanceProcessor mFriendsMaintenance;
        private readonly IFriendsInquiryProcessor mFriendsInquiry;
        public FriendsController(IFriendsMaintenanceProcessor FriendsMaintenance , IFriendsInquiryProcessor FriendsInquiry)
        {
            mFriendsMaintenance = FriendsMaintenance;
            mFriendsInquiry = FriendsInquiry;
        }




    }
}
