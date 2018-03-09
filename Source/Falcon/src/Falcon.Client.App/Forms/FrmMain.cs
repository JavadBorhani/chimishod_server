using Falcon.Client.App.Logic;
using RestSharp;
using System;
using System.Windows.Forms;

namespace Falcon.Client.App
{
    public partial class FrmMain : Form
    {
        public const string ServerURI = "http://mvp.chimishod.ir/";
        RestClientManager mRequestManger;

        private const string UUID = "YTc0NWY3ZTItYjcyYy00ZWRlLWEzNDMtYjVjOGJjMjA4MmNj";

        string[] users; 

        public FrmMain()
        {
            InitializeComponent();
            mRequestManger = new RestClientManager(ServerURI);

            users = DataAccessor.LoadUsers(Utils.FileSystem.FileTypes.Users);

            ckbYes.Checked = true;

        }

        private void Frm_Load(object sender, EventArgs e)
        {

        }

        private void btnCreateUser_Click(object sender, EventArgs e)
        {
            
            if(users == null)
            {
                users = UUIDGenerator.Generate(Convert.ToInt32(txtUserNumber.Text));
                AddToListBox("start creating...");
                for (int i = 0; i < users.Length; ++i)
                {
                    mRequestManger.CreateUserAsync(users[i], AddToListBox);
                }
                AddToListBox("end creating....");
                DataAccessor.SaveUsers(users);
            }
              
        }


        private void AddToListBox(IRestResponse response)
        {
            if(RequestResultListBox == null)
                RequestResultListBox = new ListBox();

            RequestResultListBox.Invoke((MethodInvoker) delegate { RequestResultListBox.Items.Add("response : " + response.StatusCode); });
        }


        private void AddToListBox(string text)
        {
            if (RequestResultListBox == null)
                RequestResultListBox = new ListBox();

            RequestResultListBox.Invoke((MethodInvoker)delegate { RequestResultListBox.Items.Add(text); });
        }

        private void btnGenerate_Click(object sender, EventArgs e)
        {
            if (users == null)
                return;

            btnGenerate.Enabled = false;

            int yesCount = (int)((Convert.ToInt32(txtYesPercent.Text) / 100.0f) * users.Length);

            int noCount = (int)((Convert.ToInt32(txtNoPercent.Text) / 100.0f) * users.Length); 

            for(int i = 0; i < users.Length; ++i)
            {
                if ( i > yesCount)
                {
                    ckbYes.Checked = false;
                }
                mRequestManger.SendAnswerAsync(users[i] , Convert.ToInt32(txtQuestionID.Text) , ckbYes.Checked , ckbLike.Checked , ckbDislike.Checked , UpdateProgress);
                
            }

        }

        private void SendHugeRequest()
        {
            AddToListBox("start creating...");
            for (int i = 0; i < 100; ++i)
            {
                mRequestManger.SendNotification(UUID, AddToListBox);
            }
            AddToListBox("end creating...");
        }
        
        private void UpdateProgress(IRestResponse response)
        {
            Console.WriteLine("answer result" + response.ResponseStatus);

            AnswerProgressbar.Invoke((MethodInvoker) delegate 
            {
                if(AnswerProgressbar.Value <= 100)
                {
                    AnswerProgressbar.Value = AnswerProgressbar.Value++;
                }
            });
        }

        private void btnLoadUser_Click(object sender, EventArgs e)
        {

        }

        private void AnswerGroupBox_Enter(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            SendHugeRequest();
        }

        private void btnUserInfo_Click(object sender, EventArgs e)
        {
            AddToListBox("start request...");
            for(int i = 0; i < 1000; ++i)
            {
                mRequestManger.GetUserInfo("NWRhNTQxZmItNjY1YS00MDM4LWE0ZDEtZjU5YjdiODQwYTg4", AddToListBox);
                mRequestManger.GetUserInfo("M2FkZGVmNjctNzc1YS00MjM1LThjZjctYTQ5ZTVkZDhmMTg2", AddToListBox);
            }
            AddToListBox("finish request...");
        }
    }
}
