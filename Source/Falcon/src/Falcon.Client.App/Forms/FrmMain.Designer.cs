namespace Falcon.Client.App
{
    partial class FrmMain
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.btnCreateUser = new System.Windows.Forms.Button();
            this.RequestResultListBox = new System.Windows.Forms.ListBox();
            this.AnswerGroupBox = new System.Windows.Forms.GroupBox();
            this.btnGenerate = new System.Windows.Forms.Button();
            this.txtNoPercent = new System.Windows.Forms.TextBox();
            this.txtYesPercent = new System.Windows.Forms.TextBox();
            this.label4 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.txtNumberOfAnswers = new System.Windows.Forms.TextBox();
            this.AnswerStatus = new System.Windows.Forms.GroupBox();
            this.ckbDislike = new System.Windows.Forms.CheckBox();
            this.ckbLike = new System.Windows.Forms.CheckBox();
            this.label1 = new System.Windows.Forms.Label();
            this.txtQuestionID = new System.Windows.Forms.TextBox();
            this.ckbNo = new System.Windows.Forms.CheckBox();
            this.ckbYes = new System.Windows.Forms.CheckBox();
            this.btnLoadUser = new System.Windows.Forms.Button();
            this.txtUserNumber = new System.Windows.Forms.TextBox();
            this.AnswerProgressbar = new System.Windows.Forms.ProgressBar();
            this.AnswerGroupBox.SuspendLayout();
            this.AnswerStatus.SuspendLayout();
            this.SuspendLayout();
            // 
            // btnCreateUser
            // 
            this.btnCreateUser.Location = new System.Drawing.Point(12, 61);
            this.btnCreateUser.Name = "btnCreateUser";
            this.btnCreateUser.Size = new System.Drawing.Size(140, 45);
            this.btnCreateUser.TabIndex = 0;
            this.btnCreateUser.Text = "CreateUser";
            this.btnCreateUser.UseVisualStyleBackColor = true;
            this.btnCreateUser.Click += new System.EventHandler(this.btnCreateUser_Click);
            // 
            // RequestResultListBox
            // 
            this.RequestResultListBox.FormattingEnabled = true;
            this.RequestResultListBox.Location = new System.Drawing.Point(12, 112);
            this.RequestResultListBox.Name = "RequestResultListBox";
            this.RequestResultListBox.Size = new System.Drawing.Size(272, 303);
            this.RequestResultListBox.TabIndex = 2;
            // 
            // AnswerGroupBox
            // 
            this.AnswerGroupBox.Controls.Add(this.AnswerProgressbar);
            this.AnswerGroupBox.Controls.Add(this.btnGenerate);
            this.AnswerGroupBox.Controls.Add(this.txtNoPercent);
            this.AnswerGroupBox.Controls.Add(this.txtYesPercent);
            this.AnswerGroupBox.Controls.Add(this.label4);
            this.AnswerGroupBox.Controls.Add(this.label3);
            this.AnswerGroupBox.Controls.Add(this.label2);
            this.AnswerGroupBox.Controls.Add(this.txtNumberOfAnswers);
            this.AnswerGroupBox.Controls.Add(this.AnswerStatus);
            this.AnswerGroupBox.Location = new System.Drawing.Point(290, 12);
            this.AnswerGroupBox.Name = "AnswerGroupBox";
            this.AnswerGroupBox.Size = new System.Drawing.Size(899, 400);
            this.AnswerGroupBox.TabIndex = 3;
            this.AnswerGroupBox.TabStop = false;
            this.AnswerGroupBox.Text = "Answer";
            // 
            // btnGenerate
            // 
            this.btnGenerate.Location = new System.Drawing.Point(23, 135);
            this.btnGenerate.Name = "btnGenerate";
            this.btnGenerate.Size = new System.Drawing.Size(235, 33);
            this.btnGenerate.TabIndex = 7;
            this.btnGenerate.Text = "Generate";
            this.btnGenerate.UseVisualStyleBackColor = true;
            this.btnGenerate.Click += new System.EventHandler(this.btnGenerate_Click);
            // 
            // txtNoPercent
            // 
            this.txtNoPercent.Location = new System.Drawing.Point(158, 100);
            this.txtNoPercent.Name = "txtNoPercent";
            this.txtNoPercent.Size = new System.Drawing.Size(100, 20);
            this.txtNoPercent.TabIndex = 6;
            // 
            // txtYesPercent
            // 
            this.txtYesPercent.Location = new System.Drawing.Point(158, 65);
            this.txtYesPercent.Name = "txtYesPercent";
            this.txtYesPercent.Size = new System.Drawing.Size(100, 20);
            this.txtYesPercent.TabIndex = 5;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(82, 103);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(67, 13);
            this.label4.TabIndex = 4;
            this.label4.Text = "No Percent :";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(78, 68);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(71, 13);
            this.label3.TabIndex = 3;
            this.label3.Text = "Yes Percent :";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(20, 28);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(129, 13);
            this.label2.TabIndex = 2;
            this.label2.Text = "Total Number Of Answer :";
            // 
            // txtNumberOfAnswers
            // 
            this.txtNumberOfAnswers.Location = new System.Drawing.Point(158, 25);
            this.txtNumberOfAnswers.Name = "txtNumberOfAnswers";
            this.txtNumberOfAnswers.Size = new System.Drawing.Size(100, 20);
            this.txtNumberOfAnswers.TabIndex = 1;
            // 
            // AnswerStatus
            // 
            this.AnswerStatus.Controls.Add(this.ckbDislike);
            this.AnswerStatus.Controls.Add(this.ckbLike);
            this.AnswerStatus.Controls.Add(this.label1);
            this.AnswerStatus.Controls.Add(this.txtQuestionID);
            this.AnswerStatus.Controls.Add(this.ckbNo);
            this.AnswerStatus.Controls.Add(this.ckbYes);
            this.AnswerStatus.Location = new System.Drawing.Point(693, 19);
            this.AnswerStatus.Name = "AnswerStatus";
            this.AnswerStatus.Size = new System.Drawing.Size(200, 375);
            this.AnswerStatus.TabIndex = 0;
            this.AnswerStatus.TabStop = false;
            this.AnswerStatus.Text = "AnswerStatus";
            // 
            // ckbDislike
            // 
            this.ckbDislike.AutoSize = true;
            this.ckbDislike.Location = new System.Drawing.Point(68, 209);
            this.ckbDislike.Name = "ckbDislike";
            this.ckbDislike.Size = new System.Drawing.Size(57, 17);
            this.ckbDislike.TabIndex = 5;
            this.ckbDislike.Text = "Dislike";
            this.ckbDislike.UseVisualStyleBackColor = true;
            // 
            // ckbLike
            // 
            this.ckbLike.AutoSize = true;
            this.ckbLike.Location = new System.Drawing.Point(68, 169);
            this.ckbLike.Name = "ckbLike";
            this.ckbLike.Size = new System.Drawing.Size(46, 17);
            this.ckbLike.TabIndex = 4;
            this.ckbLike.Text = "Like";
            this.ckbLike.UseVisualStyleBackColor = true;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(6, 49);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(60, 13);
            this.label1.TabIndex = 3;
            this.label1.Text = "QuestionID";
            // 
            // txtQuestionID
            // 
            this.txtQuestionID.Location = new System.Drawing.Point(68, 46);
            this.txtQuestionID.Name = "txtQuestionID";
            this.txtQuestionID.Size = new System.Drawing.Size(100, 20);
            this.txtQuestionID.TabIndex = 2;
            // 
            // ckbNo
            // 
            this.ckbNo.AutoSize = true;
            this.ckbNo.Location = new System.Drawing.Point(68, 132);
            this.ckbNo.Name = "ckbNo";
            this.ckbNo.Size = new System.Drawing.Size(40, 17);
            this.ckbNo.TabIndex = 1;
            this.ckbNo.Text = "No";
            this.ckbNo.UseVisualStyleBackColor = true;
            // 
            // ckbYes
            // 
            this.ckbYes.AutoSize = true;
            this.ckbYes.Location = new System.Drawing.Point(68, 94);
            this.ckbYes.Name = "ckbYes";
            this.ckbYes.Size = new System.Drawing.Size(44, 17);
            this.ckbYes.TabIndex = 0;
            this.ckbYes.Text = "Yes";
            this.ckbYes.UseVisualStyleBackColor = true;
            // 
            // btnLoadUser
            // 
            this.btnLoadUser.Location = new System.Drawing.Point(158, 61);
            this.btnLoadUser.Name = "btnLoadUser";
            this.btnLoadUser.Size = new System.Drawing.Size(126, 45);
            this.btnLoadUser.TabIndex = 4;
            this.btnLoadUser.Text = "LoadUser";
            this.btnLoadUser.UseVisualStyleBackColor = true;
            // 
            // txtUserNumber
            // 
            this.txtUserNumber.Location = new System.Drawing.Point(12, 12);
            this.txtUserNumber.Multiline = true;
            this.txtUserNumber.Name = "txtUserNumber";
            this.txtUserNumber.Size = new System.Drawing.Size(272, 45);
            this.txtUserNumber.TabIndex = 8;
            this.txtUserNumber.Text = "Total Number of Users";
            this.txtUserNumber.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            // 
            // AnswerProgressbar
            // 
            this.AnswerProgressbar.Location = new System.Drawing.Point(23, 174);
            this.AnswerProgressbar.Name = "AnswerProgressbar";
            this.AnswerProgressbar.Size = new System.Drawing.Size(235, 23);
            this.AnswerProgressbar.TabIndex = 8;
            // 
            // FrmMain
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1201, 424);
            this.Controls.Add(this.txtUserNumber);
            this.Controls.Add(this.btnLoadUser);
            this.Controls.Add(this.AnswerGroupBox);
            this.Controls.Add(this.RequestResultListBox);
            this.Controls.Add(this.btnCreateUser);
            this.MaximizeBox = false;
            this.Name = "FrmMain";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "FrmMain";
            this.Load += new System.EventHandler(this.Frm_Load);
            this.AnswerGroupBox.ResumeLayout(false);
            this.AnswerGroupBox.PerformLayout();
            this.AnswerStatus.ResumeLayout(false);
            this.AnswerStatus.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button btnCreateUser;
        private System.Windows.Forms.ListBox RequestResultListBox;
        private System.Windows.Forms.GroupBox AnswerGroupBox;
        private System.Windows.Forms.Button btnGenerate;
        private System.Windows.Forms.TextBox txtNoPercent;
        private System.Windows.Forms.TextBox txtYesPercent;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox txtNumberOfAnswers;
        private System.Windows.Forms.GroupBox AnswerStatus;
        private System.Windows.Forms.CheckBox ckbDislike;
        private System.Windows.Forms.CheckBox ckbLike;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox txtQuestionID;
        private System.Windows.Forms.CheckBox ckbNo;
        private System.Windows.Forms.CheckBox ckbYes;
        private System.Windows.Forms.Button btnLoadUser;
        private System.Windows.Forms.TextBox txtUserNumber;
        private System.Windows.Forms.ProgressBar AnswerProgressbar;
    }
}

