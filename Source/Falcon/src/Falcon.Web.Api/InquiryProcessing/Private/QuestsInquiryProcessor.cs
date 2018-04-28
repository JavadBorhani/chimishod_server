using AutoMapper;
using Falcon.Data.QueryProcessors;
using Falcon.Web.Api.InquiryProcessing.Public;
using Falcon.Web.Models.Api;
using Falcon.Web.Models.Api.Quest;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Falcon.Web.Api.InquiryProcessing.Private
{
    public class QuestsInquiryProcessor : IQuestsInquiryProcessor
    {
        private readonly IQuestsQueryProcessor mQuestQuery;
        private readonly IMapper mMapper;
        private readonly IQuestInMemoryProcessor mQuestInMemory;

        public QuestsInquiryProcessor(IQuestsQueryProcessor QuestQueryProcessor , IMapper Mapper , IQuestInMemoryProcessor QuestInMemory)
        {
            mQuestQuery = QuestQueryProcessor;
            mMapper = Mapper;
            mQuestInMemory = QuestInMemory;
        }
        public async Task<SQuest[]> GetQuestList()
        {
            var data = await mQuestQuery.GetAllQuests();
            return data;
        }

        public async Task<SQuestion[]> GetQuestQuestions(int QuestNumber)
        {
            var questions = await mQuestQuery.GetQuestQuestions(QuestNumber);

            return mMapper.Map<SQuestion[]>(questions);
        }

        public async Task<SQuestDetail[]> GetQuestDetail(SQuestInquiry Inquiry)
        {
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

            var questDetails = await mQuestQuery.GetLiveQuestDetailWithPeopleStatus(Inquiry.QuestNumber , questNumbers); //TODO : Checkout the logic

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
                        UserScore = friendQuestDetail[i].ScorePoint / (float)parentQuest.ScorePoint,
                    };
                }
                return response.Length > 0 ? response : null;
            }

            return null;
        }

        public Task<bool> GetFinalQuestDescription()
        {
            return Task.FromResult(false);   
        }
    }
}