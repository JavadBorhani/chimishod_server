using Falcon.Common;
using Falcon.Data.QueryProcessors;
using Falcon.EFCommonContext;
using Falcon.EFCommonContext.DbModel;
using System.Threading.Tasks;

namespace Falcon.Database.SqlServer.QueryProcessors
{
    public class SentQueryProcessor : ISentQueryProcessor
    {
        private readonly IDbContext mDb;
        private readonly IDateTime mDateTime;
        public SentQueryProcessor(IDbContext Database , IDateTime DateTime)
        {
            mDateTime = DateTime;
            mDb = Database;
        }
        public async Task<int> StoreMessage(int UserID, int QuestionID)
        {
            var item = mDb.Set<Sent>().Add(new Sent
            {
                CreatedDate = mDateTime.Now,
                UserID = UserID,
                QuestionID = QuestionID
            });

            await mDb.SaveChangesAsync();

            return item.GroupID;
        }

        public async Task<bool> StoreMessageGroup(int GroupID ,int SenderID, int QuestionID, int[] ReceiverID)
        {
            var sentGroups = new SentGroup[ReceiverID.Length];
            for (int i = 0; i < sentGroups.Length; ++i)
            {
                sentGroups[i] = new SentGroup
                {
                    GroupID = GroupID,
                    SenderID = SenderID , 
                    QuestionID = QuestionID,
                    RecieverID = ReceiverID[i],
                    CreatedDate = mDateTime.Now,
                    UpdatedDate = mDateTime.Now
                };
            }

            mDb.Set<SentGroup>().AddRange(sentGroups);

            await mDb.SaveChangesAsync();

            return true;
        }
    }
}
