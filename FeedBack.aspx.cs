using MimeKit;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
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
            submitButton.Enabled = false;
            var feedbackData = feedbackarea.Value;
            //sendMailLogic
            AddFeedback(feedbackData);
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "toastr.success('Thank you for your feedback.')", true);
            //Response.Redirect("Dashboard.aspx");
            feedbackarea.Value = "";
            submitButton.Enabled = true;
            string username = Session["username"].ToString();
            string useremail = Session["user_email"].ToString();
            string usercontact = Session["contact"].ToString();
            string userId = Session["Userid"].ToString();
            string feedbackmail = ConfigurationManager.AppSettings["careermailUserId"].ToString();
            string Subject = "Feedback:Hfiles";
            string body = $"<p style=\"text-align:justify\">Hi Team,</p><br><p style=\"text-align:justify\">User Name : " + username + " </p>\r\n<p style=\"text-align:justify\">User Email : " + useremail + " </p>\r\n<p style=\"text-align:justify\">User Mobile No : " + usercontact + "</p>\r\n<p style=\"text-align:justify\">User Feedback : " + feedbackData + "</p>\r\n<br>\r\n<p style=\"text-align:justify\">Thank you,</p>\r\n<p style=\"text-align:justify\">Team HFiles Development</p>";
            Task.Run(() => SendMail(Subject, body, feedbackmail));
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
        public async static Task SendMail(string Subject, string messageBody, string ToEmail, string attachmentFilePath = "")
        {
            string fromMail = ConfigurationManager.AppSettings["careermailUserId"].ToString();
            string mailPassword = ConfigurationManager.AppSettings["careermailPassword"].ToString();
            int mailPort = Convert.ToInt32(ConfigurationManager.AppSettings["mailPort"]);
            string mailServer = ConfigurationManager.AppSettings["mailServer"].ToString();

            var email = new MimeMessage();
            email.From.Add(new MailboxAddress("H-Files", fromMail));
            email.To.Add(new MailboxAddress("H-Files-User", ToEmail));
            email.Subject = Subject;

            var body = new TextPart("html")
            {
                Text = messageBody
            };

            var multipart = new Multipart("mixed") { body };

            // If an attachment file path is provided, add the attachment
            if (!string.IsNullOrWhiteSpace(attachmentFilePath))
            {
                var attachment = new MimeKit.MimePart("application", "octet-stream")
                {
                    Content = new MimeContent(System.IO.File.OpenRead(attachmentFilePath), ContentEncoding.Default),
                    ContentDisposition = new ContentDisposition(ContentDisposition.Attachment),
                    ContentTransferEncoding = ContentEncoding.Base64,
                    FileName = Path.GetFileName(attachmentFilePath)
                };
                multipart.Add(attachment);
            }

            email.Body = multipart;

            try
            {
                using (var smtp = new MailKit.Net.Smtp.SmtpClient())
                {
                    await smtp.ConnectAsync(mailServer, mailPort, true);
                    await smtp.AuthenticateAsync(fromMail, mailPassword);
                    await smtp.SendAsync(email);
                    await smtp.DisconnectAsync(true);
                }
            }
            catch (Exception ex)
            {
                // Log the exception
                // Example: Logger.LogError("Email sending failed", ex);
                throw; // Optionally re-throw or handle the exception as needed
            }
        }

    }
}