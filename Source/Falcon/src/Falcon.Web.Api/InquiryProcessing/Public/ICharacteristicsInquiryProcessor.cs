﻿using Falcon.Data;
using Falcon.Web.Models;
using Falcon.Web.Models.Api;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Falcon.Web.Api.InquiryProcessing.Public
{
    public interface ICharacteristicsInquiryProcessor
    {
        Task<List<SCharacteristic>> GetAllCharcterteristicList();
        Task<int[]> GetCategoryAssignedCharacters(int CategoryID);
        Task<bool> CategoryHasCharacters(int CategoryID , int[] CharacterIds);
        Task<SCharcteristicLeaderBoard> GetLeaderBoard(PagedDataRequest RequestInfo, int CharacterID);
        Task<SUserCharacter[]> GetUserCharacter(int UserID = 0 );
    }
}
