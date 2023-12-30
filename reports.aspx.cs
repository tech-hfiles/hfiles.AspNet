using MySql.Data.MySqlClient;
using Org.BouncyCastle.Utilities;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Net.Mail;
using System.Net.Mime;
using System.Net;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Xml.Linq;
using static System.Net.WebRequestMethods;
using MimeKit;
using System.Web.Mail;
using System.Web.Services.Description;
using MimeKit.Text;
using MimeKit.Utils;

namespace hfiles
{
    public partial class reports : System.Web.UI.Page
    {
        #region Variable
        string cs = ConfigurationManager.ConnectionStrings["signage"].ConnectionString;
        string reporturl;
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            int RId = DAL.validateInt(Request.QueryString["rid"]);

            if (!IsPostBack)
            {
                getReportType(RId);
                getReportMaster();
                if (Request.QueryString["rid"] != null)
                {
                    //int RId = DAL.validateInt(Request.QueryString["rid"]);
                    if (RId > 0)
                    {
                        //int UserId = DAL.validateInt(Session["Userid"].ToString());
                        int UserId = int.Parse(Session["Userid"].ToString());
                        //Reports(UserId, RId);
                        UserReports(UserId, RId);
                    }
                }
                //Session[""];
            }
        }
        public void getReportType(int RId)
        {
            try
            {
                using (MySqlConnection con = new MySqlConnection(cs))
                {
                    con.Open();
                    using (MySqlCommand cmd = new MySqlCommand("usp_GetReportType", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("_reportId", DAL.validateInt(RId));
                        cmd.Parameters.AddWithValue("_SpType", "R");
                        cmd.Parameters.AddWithValue("_Result", SqlDbType.Int);
                        cmd.Parameters["_Result"].Direction = ParameterDirection.Output;

                        MySqlDataReader sdr = cmd.ExecuteReader();
                        while (sdr.Read())
                        {
                            string reporttype = sdr["Name"].ToString();
                            //lbltype.Text = reporttype;
                            lblReportType.Text = reporttype;
                        }
                        con.Close();
                    }
                }
            }
            catch (Exception Ex)
            {
            }
        }

        public void Reports(int UserId, int reportId)
        {
            int memberId = Convert.ToInt32(Session["memberId"]);
            int result = 0;
            try
            {
                using (MySqlConnection con = new MySqlConnection(cs))
                {
                    con.Open();
                    using (MySqlCommand cmd = new MySqlCommand("usp_addreport", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("_UserId", DAL.validateInt(UserId));
                        cmd.Parameters.AddWithValue("_reportname", "");
                        cmd.Parameters.AddWithValue("_reporturl", "");
                        cmd.Parameters.AddWithValue("_reportId", DAL.validateInt(reportId));
                        cmd.Parameters.AddWithValue("_memberId", DAL.validateInt(memberId));
                        cmd.Parameters.AddWithValue("_SpType", "R");
                        cmd.Parameters.AddWithValue("_Result", SqlDbType.Int);
                        cmd.Parameters["_Result"].Direction = ParameterDirection.Output;
                        MySqlDataAdapter da = new MySqlDataAdapter(cmd);
                        DataTable dt = new DataTable();
                        da.Fill(dt);
                        if (dt != null && dt.Rows.Count > 0)
                        {
                            //tcount.InnerHtml = dt.Rows.Count.ToString();
                            rptReports.DataSource = dt;
                            rptReports.DataBind();
                            divUpload_Doc.Visible = false;
                        }
                        else
                        {
                            divUpload_Doc.Visible = true;
                            rptReports.DataSource = null;
                            rptReports.DataBind();

                        }
                    }
                }
            }
            catch (Exception Ex)
            {
            }
        }
        public void UserReports(int UserId, int ReportId)
        {
            int result = 0;
            try
            {
                int memberId = Convert.ToInt32(Session["memberId"]);
                if (memberId > 0)
                {
                    using (MySqlConnection con = new MySqlConnection(cs))
                    {
                        con.Open();
                        using (MySqlCommand cmd = new MySqlCommand("usp_getreport", con))
                        {
                            cmd.CommandType = CommandType.StoredProcedure;
                            cmd.Parameters.AddWithValue("_UserId", DAL.validateInt(memberId));
                            cmd.Parameters.AddWithValue("_reportId", DAL.validateInt(ReportId));

                            MySqlDataAdapter da = new MySqlDataAdapter(cmd);
                            DataTable dt = new DataTable();
                            da.Fill(dt);
                            if (dt != null && dt.Rows.Count > 0)
                            {
                                //if (memberId != Convert.ToInt32(Session["Userid"].ToString()))
                                //{
                                   
                                //}
                                //tcount.InnerHtml = dt.Rows.Count.ToString();
                                rptReports.DataSource = dt;
                                rptReports.DataBind();
                                divUpload_Doc.Visible = false;
                                MySqlDataReader sdr = cmd.ExecuteReader();
                                while (sdr.Read())
                                {
                                    reporturl = sdr["ReportUrl"].ToString();
                                    Session["reporturl"] = reporturl;
                                }
                            }
                            else
                            {
                                divUpload_Doc.Visible = true;
                                rptReports.DataSource = null;
                                rptReports.DataBind();

                            }
                        }
                    }
                }
                else
                {
                    using (MySqlConnection con = new MySqlConnection(cs))
                    {
                        con.Open();
                        using (MySqlCommand cmd = new MySqlCommand("usp_getreport", con))
                        {
                            cmd.CommandType = CommandType.StoredProcedure;
                            cmd.Parameters.AddWithValue("_UserId", DAL.validateInt(UserId));
                            cmd.Parameters.AddWithValue("_reportId", DAL.validateInt(ReportId));

                            MySqlDataAdapter da = new MySqlDataAdapter(cmd);
                            DataTable dt = new DataTable();
                            da.Fill(dt);
                            if (dt != null && dt.Rows.Count > 0)
                            {
                                //tcount.InnerHtml = dt.Rows.Count.ToString();
                                rptReports.DataSource = dt;
                                rptReports.DataBind();
                                divUpload_Doc.Visible = false;
                                MySqlDataReader sdr = cmd.ExecuteReader();
                                while (sdr.Read())
                                {
                                    reporturl = sdr["ReportUrl"].ToString();
                                    Session["reporturl"] = reporturl;
                                }
                            }
                            else
                            {
                                divUpload_Doc.Visible = true;
                                rptReports.DataSource = null;
                                rptReports.DataBind();

                            }
                        }
                    }
                }
                Session["memberId"] = 0;
            }
            catch (Exception Ex)
            {
            }
        }
        protected void getReportMaster()
        {
            try
            {
                using (MySqlConnection con = new MySqlConnection(cs))
                {
                    con.Open();
                    using (MySqlCommand cmd = new MySqlCommand("usp_getreportmaster", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.ExecuteNonQuery();

                        MySqlDataAdapter da = new MySqlDataAdapter(cmd);
                        DataTable dt = new DataTable();
                        da.Fill(dt);
                        if (dt != null && dt.Rows.Count > 0)
                        {

                            //ddlReports.DataSource = dt;
                            //ddlReports.DataTextField = "Name";
                            //ddlReports.DataValueField = "Id";
                            //ddlReports.DataBind();

                            //ddlReports.Items.Insert(0, new ListItem("Select Report", "0"));
                        }
                        else
                        {
                            //ddlReports.Items.Insert(0, new ListItem("No Reports", "0"));
                        }

                    }
                }

            }
            catch (Exception Ex)
            {

            }
        }

        protected void SearchInput_TextChanged(object sender, EventArgs e)
        {
            int RId = DAL.validateInt(Request.QueryString["rid"]);
            DataTable dt;

            try
            {
                using (MySqlConnection con = new MySqlConnection(cs))
                {
                    con.Open();
                    using (MySqlCommand cmd = new MySqlCommand("usp_addreport", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("_UserId", DAL.validateInt(Session["Userid"].ToString()));
                        cmd.Parameters.AddWithValue("_reportname", "");
                        cmd.Parameters.AddWithValue("_reporturl", "");
                        cmd.Parameters.AddWithValue("_reportId", DAL.validateInt(RId));
                        cmd.Parameters.AddWithValue("_SpType", "R");
                        cmd.Parameters.AddWithValue("_Result", SqlDbType.Int);
                        cmd.Parameters["_Result"].Direction = ParameterDirection.Output;
                        MySqlDataAdapter da = new MySqlDataAdapter(cmd);
                        dt = new DataTable();
                        da.Fill(dt);
                        if (dt != null && dt.Rows.Count > 0)
                        {
                            //tcount.InnerHtml = dt.Rows.Count.ToString();
                            string searchTerm = SearchInput.Text;

                            // Filter the DataTable based on the search term.
                            DataTable filteredData = new DataTable();
                            filteredData = dt.Clone(); // Clone the structure of the original DataTable.

                            foreach (DataRow row in dt.Rows)
                            {
                                if (row["reportname"].ToString().Contains(searchTerm))
                                {
                                    filteredData.ImportRow(row);
                                }
                            }

                            // Bind the filtered DataTable to the Repeater.
                            rptReports.DataSource = filteredData;
                            rptReports.DataBind();
                        }
                        else
                        {
                            rptReports.DataSource = dt;
                            rptReports.DataBind();
                        }
                    }
                }
            }
            catch (Exception Ex)
            {
            }
        }

        protected void lbtnremove_Click(object sender, EventArgs e)
        {
            int RId = DAL.validateInt(Request.QueryString["rid"]);
            LinkButton lbtnimg = (LinkButton)(sender);

            string commandArgument = lbtnimg.CommandArgument;
            //string[] values = commandArgument.Split('|');

            //int ReportId = 0;
            //int Id = 0;


            //if (values.Length == 2)
            //{
            //    string RId = values[0];
            //    string UId = values[1];
            //    Session["U"]
            //    int ReportId = Convert.ToInt32(RId);
            //    int Id = Convert.ToInt32(UId);
            //}

            //int ReportId = DAL.validateInt(lbtnimg.CommandArgument.ToString());
            int Id = DAL.validateInt(lbtnimg.CommandArgument.ToString());
            int UserId = DAL.validateInt(Session["Userid"].ToString());//
            using (MySqlConnection connection = new MySqlConnection(cs))
            {
                connection.Open();
                using (MySqlCommand cmd = new MySqlCommand("removeReport", connection))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("_UserId", UserId);
                    cmd.Parameters.AddWithValue("_Id", Id);
                    cmd.Parameters.AddWithValue("_Result", SqlDbType.Int);
                    cmd.Parameters["_Result"].Direction = ParameterDirection.Output;
                    cmd.ExecuteNonQuery();
                    int retVal = Convert.ToInt32(cmd.Parameters["_Result"].Value);

                    if (retVal == 1)
                    {
                        //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Report deleted successfully')", true);
                        //Reports(UserId, RId);
                        string script = "<script type=\"text/javascript\"> launch_toast('Done'); </script>";
                        ClientScript.RegisterStartupScript(this.GetType(), "reportalert", script);
                        //lbtn_GetClickedCategoryData(DAL.validateInt(Session["CatId"]));
                        //Session["CatId"] = null;
                    }
                    else
                    {
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please try again')", true);
                    }
                }
            }

        }

        protected void lbtnShare_Click(object sender, EventArgs e)
        {
            LinkButton lnk = sender as LinkButton;
            int reportId = Convert.ToInt16(lnk.CommandArgument);
            //int reportId = Convert.ToInt32(Session["memberId"]);
            //nt UserId = Convert.ToInt32(Session["Userid"].ToString());
            //int reportId = Convert.ToInt32(Session["memberId"]);
            using (MySqlConnection con = new MySqlConnection(cs))
            {
                con.Open();

                using (MySqlCommand cmd = new MySqlCommand("usp_addreport", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("_UserId", DAL.validateInt(Session["Userid"].ToString()));
                    cmd.Parameters.AddWithValue("_reportname", "");
                    cmd.Parameters.AddWithValue("_reporturl", "");
                    cmd.Parameters.AddWithValue("_reportId", DAL.validateInt(reportId));
                    cmd.Parameters.AddWithValue("_memberId", 0);
                    cmd.Parameters.AddWithValue("_SpType", "R");
                    cmd.Parameters.AddWithValue("_Result", SqlDbType.Int);
                    cmd.Parameters["_Result"].Direction = ParameterDirection.Output;
                    MySqlDataAdapter da = new MySqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    if (dt != null && dt.Rows.Count > 0)
                    {
                        MySqlDataReader sdr = cmd.ExecuteReader();
                        while (sdr.Read())
                        {
                            string message3 = sdr["ReportUrl"].ToString();
                            string whatsappLink2 = "https://wa.me/?text=" + Uri.EscapeDataString(message3);
                            Response.Redirect(whatsappLink2);

                        }
                        //string message1 = dt.ToString();

                        //string whatsappLink1 = "https://wa.me/?text=" + Uri.EscapeDataString(message1);
                        //Response.Redirect(whatsappLink1);
                    }
                    else
                    {
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Report Not Found')", true);

                    }
                }
            }
            string message = "Check out this cool content: " + Request.Url.AbsoluteUri;

            string whatsappLink = "https://wa.me/?text=" + Uri.EscapeDataString(message);
            Response.Redirect(whatsappLink);
        }


        protected void SendEmailWithAttachment()
        {
            // Replace these values with your SMTP server details
            string smtpServer = "your-smtp-server.com";
            int smtpPort = 587;
            string smtpUsername = "your-username";
            string smtpPassword = "your-password";

            // Sender and recipient email addresses
            string senderEmail = "chetan@digitaledgetech.in";
            string recipientEmail = "chetanpattan01@gmail.com";

            // Create the email message
            System.Net.Mail.MailMessage mailMessage = new System.Net.Mail.MailMessage(senderEmail, recipientEmail);
            mailMessage.Subject = "Subject of the email";
            mailMessage.Body = "Body of the email";

            var bodybuilder = new BodyBuilder();
            //bodybuilder.HtmlBody = ;

            // Attach the PDF file
            string pdfFilePath = Server.MapPath("~/path-to-your-pdf/your-file.pdf");
            Attachment attachment = new Attachment(pdfFilePath, MediaTypeNames.Application.Pdf);
            System.Net.Mime.ContentDisposition disposition = attachment.ContentDisposition;
            disposition.CreationDate = System.IO.File.GetCreationTime(pdfFilePath);
            disposition.ModificationDate = System.IO.File.GetLastWriteTime(pdfFilePath);
            disposition.ReadDate = System.IO.File.GetLastAccessTime(pdfFilePath);
            mailMessage.Attachments.Add(attachment);

            // Configure the SMTP client
            SmtpClient smtpClient = new SmtpClient(smtpServer, smtpPort);
            smtpClient.Credentials = new NetworkCredential(smtpUsername, smtpPassword);
            smtpClient.EnableSsl = true;

            try
            {
                // Send the email
                smtpClient.Send(mailMessage);
                // Optionally, display a success message or redirect to another page
                Response.Write("Email sent successfully!");
            }
            catch (Exception ex)
            {
                // Handle exceptions, e.g., display an error message
                Response.Write("Error sending email: " + ex.Message);
            }
        }

        //protected void lbtnShareMail_Click(object sender, EventArgs e)
        //{
        //    reporturl = Session["reporturl"].ToString();
        //    System.Net.Mail.MailMessage mailMessage = new System.Net.Mail.MailMessage();
        //    string url = Request.Url.AbsoluteUri;
        //    string email = "chetan@digitaledgetech.in";
        //    string subject = "HFiles - Report";
        //    string body = $"<p style=\"text-align: justify\">Thank You For Using HFiles.</p>\r\n\r\n<p style=\"text-align: justify\">Thanks,&nbsp;</p><p style=\"text-align: justify\">Team Health Files.</p>";
        //    //string pdfFilePath = Server.MapPath("~/");
        //    //Attachment attachment = new Attachment(pdfFilePath, MediaTypeNames.Application.Pdf);
        //    //mailMessage.Attachments.Add(attachment);
        //    string attachmentFilePath = Server.MapPath("~/upload/report/" + Session["reporturl"].ToString());
        //    //string attachmentFilePath = "http://68.178.164.174//upload/report/ "+ reporturl;

        //    SendMail(subject, body, email, attachmentFilePath);
        //    DAL.SendCareerMail(subject, body, email);
        //    //DAL.SendMailPDF(subject, body, email, pdfFilePath);
        //    //SendEmailWithAttachment();
        //}


        public static void SendMail(string Subject, string messageBody, string ToEmail, string attachmentFilePath)
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

            var attachment = new MimeKit.MimePart("application", "pdf")
            {
                Content = new MimeContent(System.IO.File.OpenRead(attachmentFilePath), ContentEncoding.Default),
                ContentDisposition = new MimeKit.ContentDisposition(MimeKit.ContentDisposition.Attachment),
                ContentTransferEncoding = ContentEncoding.Base64,
                //FileName = Path.GetFileName(attachmentFilePath)
                FileName = attachmentFilePath
            };
            multipart.Add(attachment);
            email.Body = multipart;
            using (var smtp = new MailKit.Net.Smtp.SmtpClient())
            {
                smtp.Connect(mailServer, mailPort, true);
                smtp.Authenticate(fromMail, mailPassword);
                smtp.Send(email);
                smtp.Disconnect(true);
            }
        }        


        //public static void SendMail(string Subject, string messageBody, string ToEmail, string attachmentFilePath)
        //{
        //    string fromMail = ConfigurationManager.AppSettings["careermailUserId"].ToString();
        //    string mailPassword = ConfigurationManager.AppSettings["careermailPassword"].ToString();
        //    int mailPort = Convert.ToInt32(ConfigurationManager.AppSettings["mailPort"]);
        //    string mailServer = ConfigurationManager.AppSettings["mailServer"].ToString();
        //    var email = new MimeMessage();
        //    email.From.Add(new MailboxAddress("H-Files", fromMail));
        //    email.To.Add(new MailboxAddress("H-FIles-User", ToEmail));
        //    email.Subject = Subject;
        //    var body = new TextPart("html")
        //    {
        //        Text = messageBody
        //    };
        //    var multipart = new Multipart("mixed");
        //    multipart.Add(body);

        //    var attachment = new MimeKit.MimePart("application", "pdf")
        //    {
        //        Content = new MimeContent(System.IO.File.OpenRead(attachmentFilePath), ContentEncoding.Default),
        //        ContentDisposition = new MimeKit.ContentDisposition(MimeKit.ContentDisposition.Attachment),
        //        ContentTransferEncoding = ContentEncoding.Base64,
        //        //FileName = Path.GetFileName(attachmentFilePath)
        //        FileName = attachmentFilePath
        //    };
        //    multipart.Add(attachment);
        //    email.Body = multipart;
        //    using (var smtp = new MailKit.Net.Smtp.SmtpClient())
        //    {
        //        smtp.Connect(mailServer, mailPort, true);
        //        smtp.Authenticate(fromMail, mailPassword);
        //        smtp.Send(email);
        //        smtp.Disconnect(true);
        //    }
        //}

        //new code form kuldeep
        protected void btnShareEmail_Command(object sender, CommandEventArgs e)
        {
            try
            {
                // Define the email details
                string subject = "View Report";
                //string body = "Hi, You might find this interesting: " + Request.Url.AbsoluteUri;
                string body = "Hi, View Report ";

                // Construct the email message
                System.Net.Mail.MailMessage message = new System.Net.Mail.MailMessage();
                message.Subject = subject;
                message.Body = body;
                message.IsBodyHtml = false; // Set to true if your body contains HTML

                // Add attachment
                //string documentPath = @"D:\Chetan\GitHub\HFiles\upload\report\11_01_2023_01_06_11_239.png";
                string documentPath = Server.MapPath("~/upload/report\\11_01_2023_01_06_11_239.png");
                //string documentPath = "http://68.178.164.174//upload/report/112_19_2023_02_04_21_002.jpeg";
                if (System.IO.File.Exists(documentPath))
                {
                    Attachment attachment = new Attachment(documentPath);
                    message.Attachments.Add(attachment);
                }
                else
                {
                    // Handle the case where the document doesn't exist
                    // You may want to display an error message or take appropriate action
                    Response.Write("The specified document does not exist.");
                    return;
                }

                // Construct the email link
                string emailLink = "mailto:?subject=" + Uri.EscapeDataString(subject) + "&body=" + Uri.EscapeDataString(message.Body);
                string emailLink1 = "mailto:?subject=" + Uri.EscapeDataString(subject) + "&body=" + documentPath;

                // Redirect to default email client
                Response.Redirect(emailLink);
            }
            catch (Exception ex)
            {
                // Handle exceptions, log, or display an error message
                Response.Write("An error occurred: " + ex.Message);
            }
        }

       protected void lbtnShareMail_Click1(object sender, EventArgs e)
        {
            reporturl = Session["reporturl"].ToString();
            System.Net.Mail.MailMessage mailMessage = new System.Net.Mail.MailMessage();
            string url = Request.Url.AbsoluteUri;
            string email = "chetan@digitaledgetech.in";
            string subject = "HFiles - Report";
            string body = $"<p style=\"text-align: justify\">Thank You For Using HFiles.</p>\r\n\r\n<p style=\"text-align: justify\">Thanks,&nbsp;</p><p style=\"text-align: justify\">Team Health Files.</p>";
            //string pdfFilePath = Server.MapPath("~/");
            //Attachment attachment = new Attachment(pdfFilePath, MediaTypeNames.Application.Pdf);
            //mailMessage.Attachments.Add(attachment);
            string attachmentFilePath = Server.MapPath("~/upload/report/" + Session["reporturl"].ToString());
            //string attachmentFilePath = "http://68.178.164.174//upload/report/ "+ reporturl;

            SendMail(subject, body, email, attachmentFilePath);
            DAL.SendCareerMail(subject, body, email);
            //DAL.SendMailPDF(subject, body, email, pdfFilePath);
            //SendEmailWithAttachment();
        }
    }

}
