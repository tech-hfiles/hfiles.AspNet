using MimeKit;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hfiles
{
    public partial class FeedBack : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["signage"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void submitButton_Click(object sender, EventArgs e)
        {
            string username = Session["username"].ToString();
            string useremail = Session["user_email"].ToString();
            string usercontact = Session["contact"].ToString();

            string userId = Session["Userid"].ToString();
            string feedbackmail = ConfigurationManager.AppSettings["feedbackmail"].ToString();

            //sendMailLogic
            AddFeedback(feedbackarea.Value);
            string Subject = "Feedback:Hfiles";
            string body = $"<p style=\"text-align:justify\">Hi Team,</p><br><p style=\"text-align:justify\">User Name : "+username+" </p>\r\n<p style=\"text-align:justify\">User Email : "+useremail+" </p>\r\n<p style=\"text-align:justify\">User Mobile No : "+usercontact+"</p>\r\n<p style=\"text-align:justify\">User Feedback : "+feedbackarea.Value+"</p>\r\n<br>\r\n<p style=\"text-align:justify\">Thank you,</p>\r\n<p style=\"text-align:justify\">Team HFiles Development</p>";
            SendMail(Subject, body, feedbackmail);

            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Thank you for your feedback.')", true);
            //Response.Redirect("Dashboard.aspx");
            feedbackarea.Value = "";
        }
        private void AddFeedback(string Feedback)
        {
            using (MySqlConnection con = new MySqlConnection(cs))
            {
                con.Open();
                using (MySqlCommand cmd = new MySqlCommand("usp_userfeedback", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("_UserId", DAL.validateInt(Session["Userid"])); //Session["Userid"];
                    cmd.Parameters.AddWithValue("_FeedBack", Feedback);
                    cmd.ExecuteNonQuery();
                }
            }
        }
        public static void SendMail(string Subject, string messageBody, string ToEmail, string attachmentFilePath = "")
        {
            string fromMail = ConfigurationManager.AppSettings["careermailUserId"].ToString();
            string mailPassword = ConfigurationManager.AppSettings["careermailPassword"].ToString();
            int mailPort = Convert.ToInt32(ConfigurationManager.AppSettings["mailPort"]);
            string mailServer = ConfigurationManager.AppSettings["mailServer"].ToString();
            var email = new MimeMessage();
            email.From.Add(new MailboxAddress("H-Files", fromMail));
            email.To.Add(new MailboxAddress("H-FIles-User", ToEmail));
            email.Subject = Subject;
            var body = new TextPart("html")
            {
                Text = messageBody
            };
            var multipart = new Multipart("mixed");
            multipart.Add(body);

            //var attachment = new MimeKit.MimePart("application", "pdf")
            //{
            //    Content = new MimeContent(System.IO.File.OpenRead(attachmentFilePath), ContentEncoding.Default),
            //    ContentDisposition = new MimeKit.ContentDisposition(MimeKit.ContentDisposition.Attachment),
            //    ContentTransferEncoding = ContentEncoding.Base64,
            //    //FileName = Path.GetFileName(attachmentFilePath)
            //    FileName = attachmentFilePath
            //};
            //multipart.Add(attachment);
            email.Body = multipart;
            using (var smtp = new MailKit.Net.Smtp.SmtpClient())
            {
                smtp.Connect(mailServer, mailPort, true);
                smtp.Authenticate(fromMail, mailPassword);
                smtp.Send(email);
                smtp.Disconnect(true);
            }
        }

    }
}