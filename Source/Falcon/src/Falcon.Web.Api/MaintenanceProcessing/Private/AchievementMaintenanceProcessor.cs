﻿using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Falcon.Web.Api.MaintenanceProcessing.Public;
using Falcon.Web.Models.Api;
using Falcon.Web.Api.InquiryProcessing.Public;
using Falcon.Data.QueryProcessors;
using Falcon.Common.Security;
using AutoMapper;
using Falcon.Web.Models.Api.Achievement;

namespace Falcon.Web.Api.MaintenanceProcessing.Private
{
    public class AchievementMaintenanceProcessor : IAchievementMaintenanceProcessor
    {
        private readonly IAchievementQueryProcessor mAchievementQuery;
        private readonly IUsersInquiryProcessor mUserInquiry;
        private readonly IUserSession mUserSession;
        private readonly ICategoriesQueryProcessor mCategoriesQueryProcessor;
        private readonly IMapper mMapper;

        public AchievementMaintenanceProcessor
            (
            IAchievementQueryProcessor AchievementQueryProcessor ,
            IUsersInquiryProcessor UserQuery,
            IUserSession UserSession,
            ICategoriesQueryProcessor CategoriesQueryProcessor,
            IMapper Mapper
            )
        {
            mAchievementQuery = AchievementQueryProcessor;
            mUserInquiry = UserQuery;
            mUserSession = UserSession;
            mCategoriesQueryProcessor = CategoriesQueryProcessor;
            mMapper = Mapper;   
        }
        public async Task<SAchievementDic> PrepareAchievementList()
        {
            var outputList = new SAchievementDic();

            var allAchievementList = await mAchievementQuery.GetAllAchievementWithUserState(mUserSession.ID);

            var userStatRecord = await mAchievementQuery.GetUserAchievementStats(mUserSession.ID);

            var userAnswerCount = await mCategoriesQueryProcessor.GetUserAnswerCount(mUserSession.ID);

            var achievables = new List<int>();

            for(int i = 0; i < allAchievementList.Length; ++i)
            {
                switch(allAchievementList[i].AchievementState)
                {
                    case AchievementState.AchievementDefaultAchievedID:
                    case AchievementState.AchievementDefaultAchievableID:

                        PushingDataToResultBasket(ref outputList, ref allAchievementList[i]);
                        
                        break;

                    case AchievementState.NotSpecified:

                        var state = ValidateInTheCourt(ref allAchievementList[i] , ref userStatRecord , ref userAnswerCount);

                        if(state == AchievementState.AchievementDefaultAchievableID)
                        {
                            achievables.Add(allAchievementList[i].ID);
                        }

                        PushingDataToResultBasket(ref outputList , ref allAchievementList[i]);

                        break;  
                }
                   
            }

            if(achievables.Count > 0 )
            {
                await mAchievementQuery.AddingAchievementPossetionItems(mUserSession.ID, achievables, AchievementState.AchievementDefaultAchievableID);
            }
            
            return outputList;
        }

        private void PushingDataToResultBasket(ref SAchievementDic Output , ref UserAchievementRecord Data)
        {
            string key = Data.QueryTypeID + "-" + Data.CategoryID;

            ValidateKey(ref Output, key);

            var result = mMapper.Map<SAchievement>(Data);

            Output[key].Add(result);
        }

        private void ValidateKey(ref SAchievementDic Output , string Key)
        {
            if(!Output.ContainsKey(Key))
            {
                Output.Add(Key , new List<SAchievement>());
            }
        }
        private AchievementState ValidateInTheCourt(ref UserAchievementRecord Data , ref SAchievementStatistic AchieveStats , ref List<CategoryAnswerCount> AnswerCount )
        {
            var state = AchievementState.AchievementDefaultNotAchievedID;

            switch ((AchievementStyle)Data.QueryTypeID)
            {
                case AchievementStyle.Answer:

                    if (Data.CategoryID != null)
                    {
                        for(int i = 0; i < AnswerCount.Count; ++i)
                        {
                            if(AnswerCount[i].CategoryID == Data.CategoryID)
                            {
                                if (AnswerCount[i].AnswerCount >= Data.Quantity)

                                    state = AchievementState.AchievementDefaultAchievableID;
                                else
                                    state = AchievementState.AchievementDefaultNotAchievedID;
                                
                            }
                        }
                    }
                    else
                    {
                        state = AchievementState.NotSpecified;
                    }
                    break;

                case AchievementStyle.Avatar:

                    if (Data.Quantity >= AchieveStats.PurchasedAvatarCount)
                        state = AchievementState.AchievementDefaultAchievableID;

                    break;


                case AchievementStyle.Category:

                    if (Data.Quantity >= AchieveStats.PurchasedCategoryCount)
                        state = AchievementState.AchievementDefaultAchievableID;

                    break;


                case AchievementStyle.Level:

                    if (Data.Quantity >= AchieveStats.LevelNumber)
                        state = AchievementState.AchievementDefaultAchievableID;

                    break;



                case AchievementStyle.Score:

                    if (Data.Quantity >= AchieveStats.Score)
                        state = AchievementState.AchievementDefaultAchievableID;

                    break;

                case AchievementStyle.CreatedQuestions:

                    if (Data.Quantity >= AchieveStats.CreatedQuestionsCount)
                        state = AchievementState.AchievementDefaultAchievableID;

                    break;  
            }

            Data.AchievementState = state;
            return state;
        }
    }
}   