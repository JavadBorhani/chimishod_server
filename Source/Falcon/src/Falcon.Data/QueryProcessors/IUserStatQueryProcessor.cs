using Falcon.EFCommonContext.DbModel;
using Falcon.Web.Models.Api;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Falcon.Data.QueryProcessors
{
    public interface IUserStatQueryProcessor
    {
        Task<bool> AddFortune(int Amount);
        Task<UserStat> GetById(int ID);
        Task<int> RemainedFortune();
    }
}
