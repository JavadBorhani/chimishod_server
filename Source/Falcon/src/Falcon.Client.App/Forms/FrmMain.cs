using Falcon.Client.App.Logic;
using RestSharp;
using System;
using System.Windows.Forms;

namespace Falcon.Client.App
{
    public partial class FrmMain : Form
    {
        public const string ServerURI = "http://development.chimishod.ir/";
        RestClientManager mRequestManger;

        string[] users; 

        public FrmMain()
        {
            InitializeComponent();
            mRequestManger = new RestClientManager(ServerURI);

            users = DataAccessor.LoadUsers(Utils.FileSystem.FileTypes.Users);

        }

        private void Frm_Load(object sender, EventArgs e)
        {

        }

        private void btnCreateUser_Click(object sender, EventArgs e)
        {

            if(users == null)
            {
                users = UUIDGenerator.Generate(1);

                for (int i = 0; i < users.Length; ++i)
                {
                    mRequestManger.CreateUserAsync(users[i], AddToListBox);
                }

                DataAccessor.SaveUsers(users);
            }
              
        }


        private void AddToListBox(IRestResponse response)
        {
            if(RequestResultListBox == null)
                RequestResultListBox = new ListBox();

            RequestResultListBox.Invoke((MethodInvoker) delegate { RequestResultListBox.Items.Add("response : " + response.Request.Parameters.Count); });
        }

        private void btnGenerate_Click(object sender, EventArgs e)
        {
            btnGenerate.Enabled = false;

        }
    }
}
