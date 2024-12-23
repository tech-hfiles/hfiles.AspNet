using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using MySql.Data.MySqlClient;
using Microsoft.Graph.Models;
using System.Security.Cryptography;
using Org.BouncyCastle.Utilities;
using System.Drawing;
using System.Net.Mail;
using System.Net.Mime;
using System.Net;
using System.Web.UI.HtmlControls;
using System.IO;
using System.Xml.Linq;
using static System.Net.WebRequestMethods;
using MimeKit;
using System.Web.Mail;
using System.Web.Services.Description;
using MimeKit.Text;
using MimeKit.Utils;
using MySqlX.XDevAPI;
using System.Web.SessionState;
using System.Text.RegularExpressions;
using System.Diagnostics;
using System.Runtime.InteropServices.ComTypes;
using Org.BouncyCastle.Asn1.Cmp;
using System.Text;
using MailMessage = System.Net.Mail.MailMessage;
using Attachment = System.Net.Mail.Attachment;
using Newtonsoft.Json.Linq;
using System.Web.Caching;



namespace hfiles
{
    public partial class AllReports123 : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["signage"].ConnectionString;
        private int RId;
        private object mp1;
        DataTable dtMemberList = new DataTable();
        private string fileName;
        private SqlConnection con;
        private object ReportId;
        private object UserId;
        private LinkButton sender;
        private object dr;
        private object Id;
        private object token;
        private string baseUrl;
        private int reportId;
        private string subject;
        private string body;
        private object lnk;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

               // popup.Visible = false;

                GridBind();


            }

        }
        public void GridBind()
        {
            int UserId = DAL.validateInt(Session["Userid"].ToString());

            MySqlConnection connection = new MySqlConnection(cs);
            connection.Open();
            MySqlCommand cmd = new MySqlCommand("USP_GetAllReports", connection);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("p_UserId", UserId);

            MySqlDataReader reader = cmd.ExecuteReader();
            GridView1.DataSource = reader;
            GridView1.DataBind();
            connection.Close();
        }


        

        protected void sharewhatsapp_Click(object sender, EventArgs e)
        {
            string fileUrl = string.Empty;

            // Check if the sender is a LinkButton
           
                // Iterate through the GridView rows to find selected CheckBox
                foreach (GridViewRow row in GridView1.Rows)
                {
                    CheckBox chkSelect = (CheckBox)row.FindControl("chkSelect");
                    if (chkSelect != null && chkSelect.Checked)
                    {
                        HiddenField hfReportId = (HiddenField)row.FindControl("hfReportUrl");
                        if (hfReportId != null && int.TryParse(hfReportId.Value, out int reportId))
                        {
                            // Retrieve the file path from the database
                            fileUrl = GetReportUrlFromDatabase(reportId);
                            if (!string.IsNullOrEmpty(fileUrl))
                            {
                                break; // Stop after finding the first valid report link
                            }
                        }
                    }
                }
            

            Debug.WriteLine($"File URL: {fileUrl}");

            // If no file link is found, show an alert
            if (string.IsNullOrEmpty(fileUrl))
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Please select a report or click a valid link.');", true);
                return;
            }

            // Generate WhatsApp share URL
            string whatsappMessage = fileUrl;
            string whatsappUrl = GenerateWhatsAppUrl(whatsappMessage);

            // Redirect to WhatsApp
            Response.Redirect(whatsappUrl);






        }
        private string GetReportUrlFromDatabase(int reportId)
        {
            string filePath = string.Empty;

            // Define connection string (replace with your actual connection string)
            try
            {

                using (MySqlConnection conn = new MySqlConnection(cs))
                {
                    using (MySqlCommand cmd = new MySqlCommand("GetReportFilePath", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        cmd.Parameters.AddWithValue("_Id", reportId);

                        conn.Open();
                        var result = cmd.ExecuteScalar();
                        if (result != null)
                        {
                            filePath = result.ToString();
                        }
                        else
                        {
                            Console.WriteLine($"No result returned for ReportId: {reportId}");
                        }
                    }
                }
            }

            catch (Exception ex)
            {
                // Log exception details for debugging
                Console.WriteLine($"Error: {ex.Message}");
            }

            return string.IsNullOrEmpty(filePath) ? string.Empty : "https://localhost:44335" + filePath;
        }

        private string GenerateWhatsAppUrl(string filePath)
        {


            DateTime utcNow = DateTime.UtcNow;

            // Define the IST timezone
            TimeZoneInfo istTimeZone = TimeZoneInfo.FindSystemTimeZoneById("India Standard Time");

            // Convert UTC to IST
            DateTime indiaTime = TimeZoneInfo.ConvertTimeFromUtc(utcNow, istTimeZone).AddMinutes(1);



            Guid tokenId = Guid.NewGuid();

            var tokenData = new { FilePath = filePath, Expiry = indiaTime };

            // Storing data in Cache using tokenId as key
            HttpContext.Current.Cache.Insert(
                tokenId.ToString(),      // Key
                tokenData,               // Value
                null,                    // Dependencies (none in this case)
                indiaTime.AddMinutes(30), // Absolute Expiry Time
                Cache.NoSlidingExpiration, // No sliding expiration
                CacheItemPriority.Normal, // Cache item priority
                null);
            string signedUrl = $"https://localhost:44335/ContentDeliver.aspx?token={tokenId}";
            // Callback (if needed)
            // Store token data using tokenId as key (e.g., in MemoryCache, Database, etc.)



            // Return the WhatsApp-ready link
            return "https://wa.me/?text=" + HttpUtility.UrlEncode(signedUrl);
        }
        //private string GenerateWhatsAppUrl(string fileUrl)
        //{
        //    try
        //    {
        //        string encodedUrl = HttpUtility.UrlEncode(fileUrl);
        //        return $"https://wa.me/?text={encodedUrl}";
        //    }
        //    catch (Exception ex)
        //    {
        //        // Log any encoding errors for debugging
        //        Console.WriteLine($"Error encoding URL: {ex.Message}");
        //        return string.Empty;
        //    }
        //}

        protected void lnkViewFile_Click(object sender, EventArgs e)
        {
            LinkButton lnkViewFile = sender as LinkButton;
            if (lnkViewFile != null && !string.IsNullOrEmpty(lnkViewFile.CommandArgument))
            {
                int reportId = int.Parse(lnkViewFile.CommandArgument);
                string filePath = GetReportUrlFromDatabaseviewfile(reportId);

                // Handle case where no file link is found
                if (string.IsNullOrEmpty(filePath))
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('No valid report found.');", true);
                    return;
                }

                // Open the file directly in a new browser tab or window
                Response.Redirect(filePath);
            }
            else
            {
                // Log error if CommandArgument is invalid
                Console.WriteLine("Invalid CommandArgument for lnkViewFile");
            }
        }
        private string GetReportUrlFromDatabaseviewfile(int reportId)
        {
            string filePath = string.Empty;

            try
            {
                // Define connection string (replace with your actual connection string)
                

                using (MySqlConnection conn = new MySqlConnection(cs))
                {
                    using (MySqlCommand cmd = new MySqlCommand("GetReportFilePath", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("_Id", reportId);

                        conn.Open();
                        var result = cmd.ExecuteScalar(); // Execute the stored procedure

                        if (result != null)
                        {
                            filePath = result.ToString(); // Retrieve the FullPath directly
                        }
                        else
                        {
                            // Log an error if no result is returned
                            Console.WriteLine($"Error: No result returned for ReportId: {reportId}");
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                // Log exception details for debugging
                Console.WriteLine($"Error: {ex.Message}");
            }

            return filePath; // Return the direct file path
        }

        protected void shareEmail_Click(object sender, EventArgs e)
        {
            string fileUrl = string.Empty;
            //string recipientEmail = "kamleshram562@gmail.com";

            // Check for selected CheckBox in the GridView
            foreach (GridViewRow row in GridView1.Rows)
            {
                CheckBox chkSelect = (CheckBox)row.FindControl("chkSelect");
                if (chkSelect != null && chkSelect.Checked)
                {
                    HiddenField hfReportId = (HiddenField)row.FindControl("hfReportUrl");
                    if (hfReportId != null && int.TryParse(hfReportId.Value, out int reportId))
                    {
                        // Retrieve the file URL from the database
                        fileUrl = GetReportUrlFromDatabaseEmail(reportId);
                        if (!string.IsNullOrEmpty(fileUrl))
                        {
                            break; // Stop after finding the first selected report link
                        }
                    }
                }
            }

            // If no file link is found, show an alert
            if (string.IsNullOrEmpty(fileUrl))
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Please select a report to share.');", true);
                return;
            }

           
                // Set up email
                // MailMessage mail = new MailMessage();
                // mail.From = new MailAddress("Hfiles.in@gmail.com"); 
                //// mail.To.Add("kamleshram562@gmail.com"); 
                // mail.Subject = "Report Link";
                // mail.Body =  fileUrl;
                // mail.IsBodyHtml = false;


                // // Configure SMTP client
                // SmtpClient smtpClient = new SmtpClient("smtp.gmail.com"); // Replace with your SMTP server
                // smtpClient.Port = 587; // Use appropriate port
                // smtpClient.Credentials = new NetworkCredential("Hfiles.in@gmail.com", "qpjdigykglmnuxlt");
                // smtpClient.EnableSsl = true;

                // // Send email
                // smtpClient.Send(mail);

                string subject = "Report Link";
                string body = fileUrl;

            // Generate a mailto URL
            string gmailUrl = $"https://mail.google.com/mail/?view=cm&fs=1&to=&su={Uri.EscapeDataString(subject)}&body={Uri.EscapeDataString(body)}";

            // Use a script to open the user's default email client
            string script = $"window.open('{gmailUrl}', '_blank');";
            ScriptManager.RegisterStartupScript(this, GetType(), "openGmail", script, true);


            //string mailtoUrl = $"mailto:?subject={Uri.EscapeDataString(subject)}&body={Uri.EscapeDataString(body)}";

            //// Use a script to open the user's default email client
            //string script = $"window.open('{mailtoUrl}', '_blank');";
            //ScriptManager.RegisterStartupScript(this, GetType(), "openEmailClient", script, true);

            // Trigger the script to open Gmail
            //ScriptManager.RegisterStartupScript(this, GetType(), "openGmail", script, true);



        }

            private string GetReportUrlFromDatabaseEmail(int reportId)
            {  
                string filePath = string.Empty;

                try
                {
                    // Define connection string (replace with your actual connection string)
               

                    using (MySqlConnection conn = new MySqlConnection(cs))
                    {
                        using (MySqlCommand cmd = new MySqlCommand("GetReportFilePath", conn))
                        {
                            cmd.CommandType = CommandType.StoredProcedure;
                            cmd.Parameters.AddWithValue("_Id", reportId);

                            conn.Open();
                            var result = cmd.ExecuteScalar(); // Execute the stored procedure

                            if (result != null)
                            {
                                filePath = result.ToString(); // Retrieve the FullPath directly
                                filePath = Path.Combine(Server.MapPath("~/upload/report/"), filePath); // Convert to full local path
                            }
                            else
                            {
                                // Log an error if no result is returned
                                Console.WriteLine($"Error: No result returned for ReportId: {reportId}");
                            }
                        }
                    }
                }
                catch (Exception ex)
                {
                    // Log exception details for debugging
                    Console.WriteLine($"Error: {ex.Message}");
                }

               //return filePath; // Return the direct file path
              return string.IsNullOrEmpty(filePath) ? string.Empty : "https://hfiles.in" + filePath;

            }

        private bool SendFileLinksViaEmail(List<string> fileUrls)
        {
            try
            {
                // Assuming you have a configured SmtpClient for sending emails
                SmtpClient smtpClient = new SmtpClient("your-smtp-server", 587)
                {
                    Credentials = new NetworkCredential("your-email@example.com", "your-password"),
                    EnableSsl = true
                };

                MailMessage mail = new MailMessage
                {
                    From = new MailAddress("your-email@example.com"),
                    Subject = "Reports Links Shared",
                    Body = "Here are the links to the requested reports:\n" + string.Join("\n", fileUrls),
                    IsBodyHtml = false,
                };

                mail.To.Add("recipient@example.com"); // Replace with actual recipient email

                smtpClient.Send(mail);
                return true;
            }
            catch (Exception ex)
            {
                // Log the exception details
                Console.WriteLine($"Error sending email: {ex.Message}");
                return false;
            }
        }
    }
}