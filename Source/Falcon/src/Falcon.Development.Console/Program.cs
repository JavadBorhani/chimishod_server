namespace Falcon.Development.Console
{
    class Program
    {
        public class SUserDetail
        {
            public SUserDetail(string UserName , string ImagePath , string UUID , string NotificationID, bool State , int ID)
            {
                this.NotificationID = NotificationID;
                this.UserName = UserName;
                this.ImagePath = ImagePath;
                this.UUID = UUID;
                this.NotificationID = NotificationID;
                this.ID = ID;
                IsActive = State;
            
            }

            public string UserName { get; set; }
            public string ImagePath { get; set; }
            public string UUID { get; set; }
            public string NotificationID { get; set; }
            public bool IsActive { get; set; }
            public int ID { get; set; }
            
        }

        public static void Main(string[] args)
        {
            
        }

    }
}
