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
using MailKit.Search;

namespace hfiles
{
    public partial class AllReports : System.Web.UI.Page
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
        private static readonly string TempDirectory = HttpContext.Current.Server.MapPath("~/TempPDFs/");

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // popup.Visible = false;

                GridBind();
                getMembersList();


            }

        }
        public void GridBind()
        {

            if (Session["UserID"] != null)
            {
                int UserId = DAL.validateInt(Session["Userid"].ToString());
                using (MySqlConnection con = new MySqlConnection(cs))
                {
                    con.Open();
                    using (MySqlCommand cmd = new MySqlCommand("usp_getmember", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("_UserId", UserId);
                        cmd.Parameters.AddWithValue("_MemberId", 0);
                        cmd.Parameters.AddWithValue("_SpType", "LS");
                        cmd.Parameters.AddWithValue("_ReportId", 0);
                        cmd.Parameters.AddWithValue("_RId", 0);
                        cmd.ExecuteNonQuery();
                        MySqlDataAdapter da = new MySqlDataAdapter(cmd);
                        DataTable dt = new DataTable();
                        da.Fill(dt);
                        if (dt != null && dt.Rows.Count > 0)
                        {
                            Dropmembers.DataSource = dt;
                            Dropmembers.DataTextField = "user_FirstName";
                            Dropmembers.DataValueField = "user_Id";
                            Dropmembers.DataBind();
                            List<string> p_membersId = new List<string>();
                            foreach (DataRow row in dt.Rows)
                            {
                                p_membersId.Add(row["user_Id"].ToString());
                            }

                            // Store p_membersId directly in the session
                            Session["MemberIds"] = p_membersId;
                        }
                    }
                }


                if (Session["UserID"] != null)
                {
                   

                   
                    List<string> p_membersId = (List<string>)Session["MemberIds"];

                
                    if (p_membersId == null || p_membersId.Count == 0)
                    {
                       
                       
                        return;
                    }

                    string memberIdsString = string.Join(",", p_membersId);

                  
                    Session["UserId"] = UserId;
                    Session["MemberIds"] = p_membersId;

                   
                    using (MySqlConnection connection = new MySqlConnection(cs))
                    {
                        connection.Open();

                        // Prepare the stored procedure command
                        using (MySqlCommand cmd = new MySqlCommand("USP_GetAllReports", connection))
                        {
                            cmd.CommandType = CommandType.StoredProcedure;
                            cmd.Parameters.AddWithValue("p_UserId", UserId);
                            if (memberIdsString.Length == 5)
                            {
                                cmd.Parameters.AddWithValue("p_membersId", memberIdsString);
                            }
                            else
                            {
                                string selectedUserId = Dropmembers.SelectedValue;
                                string searchQuery = SearchInput.Text;
                                cmd.Parameters.AddWithValue("p_membersId", selectedUserId);
                                cmd.Parameters.AddWithValue("p_SearchQuery", searchQuery);
                            }
                            using (MySqlDataReader reader = cmd.ExecuteReader())
                            {
                                if(reader.HasRows == true)
                                {
                                    GridView1.DataSource = reader;
                                    GridView1.DataBind();
                                }
                                else
                                {
                                    gridLabel.Visible=true;
                                    gridLabel.Text = "No Data Found!";
                                }
                            }
                        }
                    }

                }
                else
                {
                    Response.Redirect("Login.aspx");
                }


            }
        }


        protected void getMembersList()
        {
            if (Session["UserID"] != null)
            {
                int UserId = DAL.validateInt(Session["Userid"].ToString());

                using (MySqlConnection con = new MySqlConnection(cs))
                {
                    con.Open();
                    using (MySqlCommand cmd = new MySqlCommand("usp_getmember", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("_UserId", UserId);
                        cmd.Parameters.AddWithValue("_MemberId", 0);
                        cmd.Parameters.AddWithValue("_SpType", "LS");
                        cmd.Parameters.AddWithValue("_ReportId", 0);
                        cmd.Parameters.AddWithValue("_RId", 0);
                        MySqlDataAdapter da = new MySqlDataAdapter(cmd);
                        DataTable dt = new DataTable();
                        da.Fill(dt);

                        if (dt.Rows.Count > 0)
                        {
                            Dropmembers.DataSource = dt;
                            Dropmembers.DataTextField = "user_FirstName";
                            Dropmembers.DataValueField = "user_Id";
                            Dropmembers.DataBind();
                        }

                        // Ensure the "All" option is always present at the top
                        System.Web.UI.WebControls.ListItem allItem = new System.Web.UI.WebControls.ListItem("All", "0");

                        // Check if the "All" item is already in the dropdown
                        if (Dropmembers.Items.FindByValue("0") == null)
                        {
                            Dropmembers.Items.Insert(0, allItem);  // Insert the "All" item at the top
                        }
                    }
                }
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }

        protected void Dropmembers_SelectedIndexChanged(object sender, EventArgs e)
        {
            string selectedName = Dropmembers.SelectedValue;
            string searchQuery = SearchInput.Text;

            // If "All" is selected, call GridBind
            if (selectedName == "0")
            {
                GridBind();  // Call the GridBind method when "All" is selected
            }
            else
            {
                int UserId = DAL.validateInt(Session["Userid"].ToString());

                using (MySqlConnection connection = new MySqlConnection(cs))
                {
                    connection.Open();

                    // Prepare the stored procedure command
                    using (MySqlCommand cmd = new MySqlCommand("USP_GetAllReports", connection))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("p_UserId", selectedName);
                        cmd.Parameters.AddWithValue("p_membersId", selectedName);
                        cmd.Parameters.AddWithValue("p_SearchQuery", searchQuery);
                        using (MySqlDataReader reader = cmd.ExecuteReader())
                        {
                            GridView1.DataSource = reader;
                            GridView1.DataBind();
                        }
                    }
                }
            }
           
        }



        //protected void Dropmembers_SelectedIndexChanged1(object sender, EventArgs e)
        //{
        //    int UserId = DAL.validateInt(Session["Userid"].ToString());
        //    string selectedUserId = Dropmembers.SelectedValue; // Get selected user ID

        //    if (!string.IsNullOrEmpty(selectedUserId))
        //    {
        //        using (MySqlConnection con = new MySqlConnection(cs))
        //        {
        //            con.Open();
        //            using (MySqlCommand cmd = new MySqlCommand("USP_GetAllReports", con))
        //            {
        //                cmd.CommandType = CommandType.StoredProcedure;
        //                cmd.Parameters.AddWithValue("p_UserId", UserId);
        //                cmd.Parameters.AddWithValue("p_membersId", selectedUserId);  // Filter by selected user

        //                using (MySqlDataReader reader = cmd.ExecuteReader())
        //                {
        //                    DataTable dt = new DataTable();
        //                    dt.Load(reader);
        //                    GridView1.DataSource = dt;
        //                    GridView1.DataBind();
        //                }
        //            }
        //        }
        //    }
        //}








        protected void SearchInput_TextChanged(object sender, EventArgs e)
        {
            if (Session["UserID"] != null)
            {
                int UserId = DAL.validateInt(Session["Userid"].ToString());
                List<string> p_membersId = (List<string>)Session["MemberIds"];

                if (p_membersId == null || p_membersId.Count == 0)
                {
                    Response.Write("No members found.");
                    return;
                }

                string memberIdsString = string.Join(",", p_membersId);
                string searchQuery = SearchInput.Text.Trim(); // Get search text

                Session["UserId"] = UserId;
                Session["MemberIds"] = p_membersId;

                using (MySqlConnection connection = new MySqlConnection(cs))
                {
                    connection.Open();

                    using (MySqlCommand cmd = new MySqlCommand("USP_GetAllReports", connection))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("p_UserId", UserId);

                        // Check if a member is selected
                        string selectedUserId = Dropmembers.SelectedValue;
                        cmd.Parameters.AddWithValue("p_membersId", selectedUserId == "0" ? memberIdsString : selectedUserId);

                        // Pass search query
                        cmd.Parameters.AddWithValue("p_SearchQuery", searchQuery);

                        using (MySqlDataReader reader = cmd.ExecuteReader())
                        {
                            GridView1.DataSource = reader;
                            GridView1.DataBind();
                        }
                    }
                }
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }



        [System.Web.Services.WebMethod]
        public static string ShareFileAsLink(string base64PDF, string shareTo)
        {

            try
            {
                string whatsstring = "https://wa.me/?text=";
                string gmailUrl = "https://mail.google.com/mail/?view=cm&fs=1&to=&su=";
                // Convert Base64 string to byte array
                byte[] pdfBytes = Convert.FromBase64String(base64PDF);

                // Generate unique file name
                string fileName = Guid.NewGuid().ToString() + ".pdf";
                string filePath = Path.Combine(TempDirectory, fileName);

                // Save the file to server
                System.IO.File.WriteAllBytes(filePath, pdfBytes);

                // Schedule file deletion after 1 hour
                ScheduleFileDeletion(filePath);

                // Return the relative file path (for reference or download link)
                string fileurl = $"/TempPDFs/{fileName}";
                AllReports obj = new AllReports();
                if (shareTo == "WhatsApp")
                {
                    whatsstring += HttpUtility.UrlEncode(obj.GenerateWhatsAppUrl(fileurl));
                    return whatsstring;
                }
                else
                {
                    string subject = "Report Link";
                    string body = obj.GenerateWhatsAppUrl(fileurl);
                    gmailUrl += $"{Uri.EscapeDataString(subject)}&body={Uri.EscapeDataString(body)}";
                    return gmailUrl;
                }
            }
            catch (Exception ex)
            {
                string logPath = HttpContext.Current.Server.MapPath("~/Logs/ErrorLog.txt");
                string errorDetails = $"Message: {ex.Message}\nStackTrace: {ex.StackTrace}\nInnerException: {ex.InnerException?.Message}";
                System.IO.File.AppendAllText(logPath, errorDetails);

                // Throw full error for debugging
                throw new Exception("Error saving PDF to the server.", ex);
            }
        }

        private static void ScheduleFileDeletion(string filePath)
        {
            // Use a Task to schedule file deletion
            System.Threading.Tasks.Task.Delay(TimeSpan.FromHours(1)).ContinueWith(_ =>
            {
                try
                {
                    if (System.IO.File.Exists(filePath))
                        System.IO.File.Delete(filePath);
                }
                catch (Exception ex)
                {
                    // Log error (e.g., unable to delete file)
                    // Example: Log to a file or monitoring system
                }
            });
        }


        protected void sharewhatsapp_Click(object sender, EventArgs e)
        {
            string fileUrl = string.Empty;
            string whatsstring = "https://wa.me/?text=";
            // Check if the sender is a LinkButton

            // Iterate through the GridView rows to find selected CheckBox
            foreach (GridViewRow row in GridView1.Rows)
            {
                CheckBox chkSelect = (CheckBox)row.FindControl("chkSelect");
                string reportName = row.Cells[1].Text;
                string reportType = row.Cells[2].Text;

                if (chkSelect != null && chkSelect.Checked)
                {
                    HiddenField hfReportId = (HiddenField)row.FindControl("hfReportUrl");
                    if (hfReportId != null && int.TryParse(hfReportId.Value, out int reportId))
                    {
                        // Retrieve the file path from the database
                        fileUrl = GetReportUrlFromDatabase(reportId);
                        //if (!string.IsNullOrEmpty(fileUrl))
                        //{
                        //    break; // Stop after finding the first valid report link
                        //}
                        string whatsappMessage = fileUrl;
                        string whatsappUrl = HttpUtility.UrlEncode(GenerateWhatsAppUrl(whatsappMessage));
                        whatsstring += $"{reportName}({reportType}) - {whatsappUrl}";
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


            // Redirect to WhatsApp
            Response.Redirect(whatsstring);








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

            return string.IsNullOrEmpty(filePath) ? string.Empty : "https://hfiles.in" + filePath;
        }

        public string GenerateWhatsAppUrl(string filePath)
        {


            DateTime utcNow = DateTime.UtcNow;

            // Define the IST timezone
            TimeZoneInfo istTimeZone = TimeZoneInfo.FindSystemTimeZoneById("India Standard Time");

            // Convert UTC to IST
            DateTime indiaTime = TimeZoneInfo.ConvertTimeFromUtc(utcNow, istTimeZone).AddMinutes(60);



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
            string signedUrl = $"https://hfiles.in/ContentDeliver.aspx?token={tokenId} \n";
            // Callback (if needed)
            // Store token data using tokenId as key (e.g., in MemoryCache, Database, etc.)



            // Return the WhatsApp-ready link
            return signedUrl;
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
            string emailstring = "";
            //string recipientEmail = "kamleshram562@gmail.com";

            // Check for selected CheckBox in the GridView
            foreach (GridViewRow row in GridView1.Rows)
            {
                CheckBox chkSelect = (CheckBox)row.FindControl("chkSelect");
                string reportName = row.Cells[1].Text;
                string reportType = row.Cells[2].Text;
                if (chkSelect != null && chkSelect.Checked)
                {
                    HiddenField hfReportId = (HiddenField)row.FindControl("hfReportUrl");
                    if (hfReportId != null && int.TryParse(hfReportId.Value, out int reportId))
                    {
                        // Retrieve the file URL from the database
                        fileUrl = GetReportUrlFromDatabaseEmail(reportId);
                        //if (!string.IsNullOrEmpty(fileUrl))
                        //{
                        //    break; // Stop after finding the first selected report link
                        //}
                        string whatsappMessage = fileUrl;
                        string whatsappUrl = GenerateWhatsAppUrl(whatsappMessage);
                        emailstring += $"{reportName}({reportType}) - {whatsappUrl}";
                    }
                }
            }

            // If no file link is found, show an alert
            if (string.IsNullOrEmpty(emailstring))
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
            string body = emailstring;

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

        protected void lbtnremove_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            GridViewRow row = (GridViewRow)btn.NamingContainer;

            int reportId = Convert.ToInt32(GridView1.DataKeys[row.RowIndex].Value);

            DeleteReport(reportId);

            
            GridView1.DeleteRow(row.RowIndex);

            GridBind();
        }
        private void DeleteReport(int reportId)
        {
            string query = "DELETE FROM user_reports WHERE Id = @Id";
            using (MySqlConnection conn = new MySqlConnection(cs))
            {
                using (MySqlCommand cmd = new MySqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Id", reportId);
                    conn.Open();
                    cmd.ExecuteNonQuery();
                }
            }
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", " toastr.success('Report deleted successfully');", true);
        }
    }

}