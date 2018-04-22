using Falcon.Common.Utils;
using Falcon.EFCommonContext;
using Falcon.EFCommonContext.DbModel;
using Falcon.Web.Api.InMemory.Public;
using Falcon.Web.Common;
using Falcon.Web.Models.Api.Telegram;
using System.Linq;

namespace Falcon.Web.Api.InMemory.Private
{
    public class TelegramConfigurationInMemory : ITelegramConfigurationInMemory
    {


        private IDbContext mDb
        {
            get
            {
                return WebContainerManager.Get<IDbContext>();
            }
        }


        private STelegramConfiguration Configuration = new STelegramConfiguration();


        public STelegramConfiguration GetState()
        {
            CheckAvailability();
            return Configuration;
        }

        public void ReadStateFromDatabase()
        {
            var item = mDb.Set<TelegramBot>().AsNoTracking().SingleOrDefault();

            if(item != null)
            {
                Configuration.Token = item.Token;
                Configuration.TelegramIDs = Utils.StringToLongArray(item.TelegramChatIDs, ' ');
                Configuration.ServerCallbackPath = item.ServerCallbackPath;
                Configuration.AuthorizationKey = item.AuthorizationKey;
            }

        }


        private void CheckAvailability()
        {
            if(Configuration == null)
            {
                ReadStateFromDatabase();
            }

        }
        public bool SetState(STelegramConfiguration NewState)
        {
            if (NewState != null)
            {
                Configuration.Token = NewState.Token;
                Configuration.TelegramIDs = NewState.TelegramIDs;
                Configuration.ServerCallbackPath = NewState.ServerCallbackPath;
                Configuration.AuthorizationKey = NewState.AuthorizationKey;
                return true;
            }
            return false;
        }
    }
}