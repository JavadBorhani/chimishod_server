using AutoMapper;
using Falcon.Common.Security;
using Falcon.Data.QueryProcessors;
using Falcon.Web.Api.InMemory.Public;
using Falcon.Web.Api.InquiryProcessing.Public;
using Falcon.Web.Models.Api;
using Falcon.Web.Models.Api.Barrett;
using Falcon.Web.Models.Api.Quest;
using Falcon.Web.Models.Api.User;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Falcon.Web.Api.InquiryProcessing.Private
{
    public class QuestsInquiryProcessor : IQuestsInquiryProcessor
    {
        private readonly IQuestsQueryProcessor mQuestQuery;
        private readonly IMapper mMapper;
        private readonly IQuestAndLevelInMemory mQuestInMemory;
        private readonly IUserQueryProcessor mUserQuery;
        private readonly IUserSession mUserSession; 


        public QuestsInquiryProcessor(
            IQuestsQueryProcessor QuestQueryProcessor , 
            IMapper Mapper , 
            IQuestAndLevelInMemory QuestInMemory , 
            IUserQueryProcessor UserQueryProcessor ,
            IUserSession UserSession)
        {
            mUserQuery = UserQueryProcessor;
            mQuestQuery = QuestQueryProcessor;
            mMapper = Mapper;
            mQuestInMemory = QuestInMemory;
            mUserSession = UserSession;
        }

        public async Task<SQuest[]> GetQuestList()
        {
            var data = await mQuestQuery.GetAllQuests();
            return data;
        }

        public async Task<SQuestion[]> GetQuestQuestions(int QuestNumber)
        {
            if(mQuestInMemory.GetQuestByQuestNumber(QuestNumber) != null)
            {
                var questions = await mQuestQuery.GetQuestQuestions(QuestNumber);

                return mMapper.Map<SQuestion[]>(questions);

            }
            return null;
        }

        public async Task<SQuestDetail[]> GetQuestDetail(SQuestInquiry Inquiry)
        {

            var quest = mQuestInMemory.GetQuestByQuestNumber(Inquiry.QuestNumber);

            if(quest.QuestTypes == QuestTypes.Finale)
            {
                return null;
            }
            
            // find quest 
             if(Inquiry.Alive)
            {
                var questDetail = await GetLiveQuestDetailWithNormalPeople(Inquiry);
                return questDetail;

            }
            else
            {
                var result = await GetQuestDetailWithNormalPeopole(Inquiry);
                return result;
            }
            
        }

        private async Task<SQuestDetail[]> GetQuestDetailWithNormalPeopole(SQuestInquiry Inquiry)
        {
            var quest = mQuestInMemory.GetQuestByQuestNumber(Inquiry.QuestNumber);

            var questNumbers = new List<int>();
            int parentQuestNumber;

            if (quest.ParentID == null)
            {
                questNumbers.Add(quest.QuestNumber);
                questNumbers.AddRange(quest.ChildQuestNumbers);
                parentQuestNumber = quest.QuestNumber;
            }
            else
            {
                questNumbers.Add(quest.QuestNumber);
                questNumbers.Add(quest.ParentID ?? 0);
                parentQuestNumber = quest.ParentID ?? 0;
            }


            var questDetails = await mQuestQuery.GetQuestDetailWithPeopleStatus(Inquiry.QuestNumber, questNumbers);

            if (questDetails.Count > 0)
            {
                var parentQuest = questDetails.Where(u => u.QuestNumber == parentQuestNumber).SingleOrDefault();

                questDetails.Remove(parentQuest);

                var response = new SQuestDetail[questNumbers.Count - 1];

                for (int i = 0; i < questNumbers.Count - 1; ++i)
                {
                    var questTitle = mQuestInMemory.GetQuestByQuestNumber(questDetails[i].QuestNumber).QuestTitle;

                    response[i] = new SQuestDetail
                    {
                        QuestNumber = questDetails[i].QuestNumber,
                        QuestTitle = questTitle,
                        UserScore = questDetails[i].UserScore / parentQuest.UserScore,
                        PeopleScore = questDetails[i].PeopleScore / parentQuest.PeopleScore,
                    };
                }

                return response.Length > 0 ? response : null;
            }

            return null;
        }

        private async Task<SQuestDetail[]> GetLiveQuestDetailWithNormalPeople(SQuestInquiry Inquiry)
        {

            var quest = mQuestInMemory.GetQuestByQuestNumber(Inquiry.QuestNumber);

            if (quest.QuestTypes == QuestTypes.Finale)
                return null;

            var questNumbers = new List<int>();

            int parentQuestNumber;

            if (quest.ParentID == null)
            {
                questNumbers.Add(quest.QuestNumber);
                questNumbers.AddRange(quest.ChildQuestNumbers);
                parentQuestNumber = quest.QuestNumber;
            }
            else
            {
                questNumbers.Add(quest.QuestNumber);
                questNumbers.Add(quest.ParentID ?? 0);
                parentQuestNumber = quest.ParentID ?? 0;
            }

            var questDetails = await mQuestQuery.GetLiveQuestDetailWithPeopleStatus(Inquiry.QuestNumber , questNumbers);

            if (questDetails.Count > 0)
            {
                var parentQuest = questDetails.Where(u => u.QuestNumber == parentQuestNumber).SingleOrDefault();

                questDetails.Remove(parentQuest);

                var response = new SQuestDetail[questNumbers.Count - 1];

                for (int i = 0; i < questNumbers.Count - 1; ++i)
                {
                    var questTitle = mQuestInMemory.GetQuestByQuestNumber(questDetails[i].QuestNumber).QuestTitle;

                    response[i] = new SQuestDetail
                    {
                        QuestNumber = questDetails[i].QuestNumber,
                        QuestTitle = questTitle,
                        UserScore = questDetails[i].UserScore / parentQuest.UserScore,
                        PeopleScore = questDetails[i].PeopleScore / parentQuest.PeopleScore,
                    };
                }

                return response.Length > 0 ? response : null;
            }

            return null;

        }

        public async Task<SFriendQuestDetail[]> GetFriendQuestDetail(SQuestInquiry Inquiry)
        {
            
            var quest = mQuestInMemory.GetQuestByQuestNumber(Inquiry.QuestNumber);

            if (quest.QuestTypes == QuestTypes.Finale)
                return null;

            var questNumbers = new List<int>();

            int parentQuestNumber; 

            if(quest.ParentID == null)
            {
                questNumbers.Add(quest.QuestNumber);
                questNumbers.AddRange(quest.ChildQuestNumbers);
                parentQuestNumber = quest.QuestNumber;
            }
            else
            {
                questNumbers.Add(quest.QuestNumber);
                questNumbers.Add(quest.ParentID ?? 0);
                parentQuestNumber = quest.ParentID ?? 0;
            }


            var friendQuestDetail = await mQuestQuery.GetFriendQuestDetail(Inquiry.FriendID , Inquiry.QuestNumber, questNumbers);

            if(friendQuestDetail.Count > 0 )
            {
                var parentQuest = friendQuestDetail.Where(u => u.QuestNumber == parentQuestNumber).SingleOrDefault();

                friendQuestDetail.Remove(parentQuest);

                var response = new SFriendQuestDetail[questNumbers.Count - 1];

                for (int i = 0; i < questNumbers.Count - 1; ++i)
                {
                    var questTitle = mQuestInMemory.GetQuestByQuestNumber(friendQuestDetail[i].QuestNumber).QuestTitle;

                    response[i] = new SFriendQuestDetail
                    {
                        QuestNumber = friendQuestDetail[i].QuestNumber,
                        QuestTitle = questTitle,
                        UserScore = friendQuestDetail[i].ScorePoint / (float) parentQuest.ScorePoint,
                    };
                }
                return response.Length > 0 ? response : null;
            }

            return null;
        }

        public async Task<SFinaleQuest> GetFinaleQuestDescription()
        {
            var result = await GetFinaleQuestDetail();

            int itemID = -1; 
            for(int i = 0;  i < result.Count; ++i)
            {
                if (result[i].Score > itemID)
                    itemID = (int)result[i].Score;
            }
           
            var item = await mQuestQuery.GetFinaleQuestDescription(itemID);
            return item;
        }

        public async Task<List<SBarrettUserScore>> GetFinaleQuestDetail()
        {
            var finale = mQuestInMemory.GetFinaleQuest();

            var userQuest = (await mUserQuery.GetUserCurrentQuestNumber()); //TODO: Checkout this : used to be added with +1 ; 
            var allBarrets = mQuestInMemory.GetAllBarretTypes();

            if (userQuest == finale.QuestNumber)
            {

                var userFinaleScores = await mQuestQuery.RetrieveUserBarrettSnapshot(mUserSession.ID, allBarrets);

                if (userFinaleScores != null && userFinaleScores.Count > 0)
                {
                    //TODO : Refactor this
                    for(int i = 0; i < userFinaleScores.Count; ++i)
                    {
                        userFinaleScores[i].Title = mQuestInMemory.GetBarrettType(userFinaleScores[i].BarrettID).Title;
                    }
                    return userFinaleScores;
                }
                    

                var quests = new List<int>();

                for (int i = 0; i < userQuest; ++i)
                {
                    quests.Add(i + 1);
                }

                var parentIds = mQuestInMemory.GetParentQuestNumbers(quests);

                var userSnapshotTable = await mQuestQuery.GetUserQuestScoreSnapshots(quests, parentIds.ToList());

                var result = CalculateBarrettScore(userSnapshotTable, allBarrets);

                var store = await mQuestQuery.SaveUserBarrettScores(result);

                return result;
            }

            return null;
        }

        public async Task<SFinaleQuest> GetFinaleQuestDescription(List<SBarrettUserScore> Items)
        {
            int itemID = -1;
            for (int i = 0; i < Items.Count; ++i)
            {
                if (Items[i].Score > itemID)
                    itemID = (int)Items[i].BarrettID;
            }
            var item = await mQuestQuery.GetFinaleQuestDescription(itemID);
            return item;
        }

        private List<SBarrettUserScore> CalculateBarrettScore(Dictionary<Tuple<int, int>, SQuestScoreSnapshot> UserScores, List<int> BarrettTypes)
        {
            var scores = new List<SBarrettUserScore>(BarrettTypes.Count);

            for (int i = 0; i < BarrettTypes.Count; ++i)
            {
                var barrett = mQuestInMemory.Barretts[BarrettTypes[i]];

                scores.Add(new SBarrettUserScore
                {
                    BarrettID = barrett.Item1.ID,
                    Title = barrett.Item1.Title,
                    UserID = mUserSession.ID,
                    Score = 0
                });

                var barretChilds = barrett.Item2;   // item 2 means child list 
                var length = barretChilds.Count;

                //if ((length * 2) != UserScores.Keys.Count)
                //    throw new BusinessRuleViolationException("logical error in finale quest calculation");

                for (int j = 0; j < length; ++j)
                {
                    var questInfo = mQuestInMemory.GetQuestByQuestNumber(barretChilds[j]);

                    SQuestScoreSnapshot userScoreSnapshot = null;
                    SQuestScoreSnapshot usertotalScoreSnapshot = null;

                    UserScores.TryGetValue(new Tuple<int, int>(questInfo.QuestNumber, questInfo.QuestNumber), out userScoreSnapshot);
                    UserScores.TryGetValue(new Tuple<int, int>(questInfo.QuestNumber, questInfo.ParentID ?? 0), out usertotalScoreSnapshot);

                    if (userScoreSnapshot != null && usertotalScoreSnapshot != null)
                    {
                        scores[i].Score += ((float)userScoreSnapshot.ScorePoint / usertotalScoreSnapshot.ScorePoint);
                    }
                }

                if (length > 0)
                {
                    scores[i].Score = scores[i].Score / length;
                }

            }

            return scores;
        }

        public async Task<SUserFinaleQuestDetailWithDescription> GetFinaleQuestDetailWithDescription()
        {
            var finale = await GetFinaleQuestDetail();
            var description = await GetFinaleQuestDescription(finale);

            var response = new SUserFinaleQuestDetailWithDescription
            {
                UserBarrettScore = finale,
                FinaleQuestDescription = description,
            };

            return response;
        }
    }
}