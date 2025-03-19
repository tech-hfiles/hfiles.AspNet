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
                    whatsstring += HttpUtility.UrlEncode(obj.GenerateWhatsAppUrlFP(fileurl));
                    return whatsstring;
                }
                else
                {
                    string subject = "Report Link";
                    string body = obj.GenerateWhatsAppUrlFP(fileurl);
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


        //protected void sharewhatsapp_Click(object sender, EventArgs e)
        //{
        //    string whatsstring = "https://wa.me/?text=";
        //    int maxReports = 10; // Set the maximum number of reports
        //    int reportCount = 0;
        //    List<string> selectedReports = new List<string>();

        //    // Iterate through the GridView rows to find selected CheckBox
        //    foreach (GridViewRow row in GridView1.Rows)
        //    {
        //        if (reportCount >= maxReports)
        //        {
        //            break; // Stop adding more reports after reaching the limit
        //        }

        //        CheckBox chkSelect = (CheckBox)row.FindControl("chkSelect");

        //        if (chkSelect != null && chkSelect.Checked)
        //        {
        //            string reportName = row.Cells[1].Text;
        //            string reportType = row.Cells[2].Text;

        //            HiddenField hfReportId = (HiddenField)row.FindControl("hfReportUrl");
        //            if (hfReportId != null && int.TryParse(hfReportId.Value, out int reportId))
        //            {
        //                // Retrieve the file path from the database
        //                string fileUrl = GetReportUrlFromDatabase(reportId);
        //                if (!string.IsNullOrEmpty(fileUrl))
        //                {
        //                    string whatsappMessage = fileUrl;
        //                    string whatsappUrl = HttpUtility.UrlEncode(GenerateWhatsAppUrlFP(whatsappMessage));
        //                    whatsstring += $"{reportName}({reportType}) - {whatsappUrl}";


        //                    reportCount++;
        //                }
        //            }
        //        }
        //    }

        //    // If no reports were selected, show an alert
        //    if (whatsstring.Length == 0)
        //    {
        //        ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Please select at least one report.');setTimeout(function() { location.reload(); }, 1000);", true);
        //        return;
        //    }

        //    // Concatenate the reports with new lines (%0A for WhatsApp URL encoding)

        //    string script = $"window.open('{whatsstring}', '_blank');setTimeout(function() {{ location.reload(); }}, 1000);";
        //    ScriptManager.RegisterStartupScript(this, GetType(), "openWhatsApp", script, true);
        //    // Redirect to WhatsApp
        //    //  Response.Redirect(whatsstring);
        //}

        protected void sharewhatsapp_Click(object sender, EventArgs e)
        {
            string baseWhatsAppUrl = "https://wa.me/?text=";
            List<int> selectedReportIds = new List<int>();

            // Iterate through the GridView rows to find selected CheckBox
            foreach (GridViewRow row in GridView1.Rows)
            {
                CheckBox chkSelect = (CheckBox)row.FindControl("chkSelect");

                if (chkSelect != null && chkSelect.Checked)
                {
                    HiddenField hfReportId = (HiddenField)row.FindControl("hfReportUrl");
                    if (hfReportId != null && int.TryParse(hfReportId.Value, out int reportId))
                    {
                        selectedReportIds.Add(reportId);
                    }
                }
            }

            // If no reports were selected, show an alert
            if (selectedReportIds.Count == 0)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Please select at least one report.');setTimeout(function() { location.reload(); }, 1000);", true);
                return;
            }

            // Generate a single shared report link
            string reportPageUrl = "https://hfiles.in/ShareReports.aspx?reports=" + string.Join(",", selectedReportIds);
            string encodedMessage = HttpUtility.UrlEncode("View your reports here: " + reportPageUrl);
            string fullWhatsAppUrl = baseWhatsAppUrl + encodedMessage;

            // Open WhatsApp in a new tab
            string script = $"window.open('{fullWhatsAppUrl}', '_blank');setTimeout(function() {{ location.reload(); }}, 1000);";
            ScriptManager.RegisterStartupScript(this, GetType(), "openWhatsApp", script, true);
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


        public string GenerateWhatsAppUrl(List<string> reportList)
        {


            DateTime utcNow = DateTime.UtcNow;

            // Define the IST timezone
            TimeZoneInfo istTimeZone = TimeZoneInfo.FindSystemTimeZoneById("India Standard Time");

            // Convert UTC to IST
            DateTime indiaTime = TimeZoneInfo.ConvertTimeFromUtc(utcNow, istTimeZone).AddMinutes(60);



            Guid tokenId = Guid.NewGuid();

            var tokenData = new { FilePath = reportList, Expiry = indiaTime };

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
        public string GenerateWhatsAppUrlFP(string filePath)
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



        //protected void shareEmail_Click(object sender, EventArgs e)
        //{
        //    int maxReports = 10; // Maximum reports allowed
        //    int reportCount = 0;
        //    string emailstring = "";
        //    List<string> selectedReports = new List<string>();

        //    // Iterate through GridView rows to find selected CheckBox
        //    foreach (GridViewRow row in GridView1.Rows)
        //    {
        //        if (reportCount >= maxReports)
        //        {
        //            break; // Stop after reaching the limit
        //        }

        //        CheckBox chkSelect = (CheckBox)row.FindControl("chkSelect");

        //        if (chkSelect != null && chkSelect.Checked)
        //        {
        //            string reportName = row.Cells[1].Text;
        //            string reportType = row.Cells[2].Text;

        //            HiddenField hfReportId = (HiddenField)row.FindControl("hfReportUrl");
        //            if (hfReportId != null && int.TryParse(hfReportId.Value, out int reportId))
        //            {
        //                // Retrieve the file URL from the database
        //                string fileUrl = GetReportUrlFromDatabaseEmail(reportId);
        //                if (!string.IsNullOrEmpty(fileUrl))
        //                {


        //                    string whatsappMessage = fileUrl;
        //                    string whatsappUrl = GenerateWhatsAppUrlFP(whatsappMessage);
        //                    emailstring += $"{reportName}({reportType}) - {whatsappUrl}";
        //                    reportCount++;
        //                }
        //            }
        //        }
        //    }

        //    // If no reports were selected, show an alert
        //    if (emailstring.Length == 0)
        //    {
        //        ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Please select at least one report.');setTimeout(function() { location.reload(); }, 1000);", true);
        //        return;
        //    }

        //    // Format the email body with new lines
        //    string subject = "Report Links";
        //    string body = emailstring; // \n for new lines in email body


        //    // Open WhatsApp link

        //    // Generate a universal mailto URL (works for all email clients)
        //    string gmailUrl = $"https://mail.google.com/mail/?view=cm&fs=1&to=&su={Uri.EscapeDataString(subject)}&body={Uri.EscapeDataString(body)}";

        //    // Open email client in a new tab
        //    string script = $"window.open('{gmailUrl}', '_blank');setTimeout(function() {{ location.reload(); }}, 1000);";
        //    ScriptManager.RegisterStartupScript(this, GetType(), "openEmail", script, true);
        //}

        protected void shareEmail_Click(object sender, EventArgs e)
        {
            List<int> selectedReportIds = new List<int>();

            // Iterate through the GridView rows to find selected CheckBox
            foreach (GridViewRow row in GridView1.Rows)
            {
                CheckBox chkSelect = (CheckBox)row.FindControl("chkSelect");

                if (chkSelect != null && chkSelect.Checked)
                {
                    HiddenField hfReportId = (HiddenField)row.FindControl("hfReportUrl");
                    if (hfReportId != null && int.TryParse(hfReportId.Value, out int reportId))
                    {
                        selectedReportIds.Add(reportId);
                    }
                }
            }

            // If no reports were selected, show an alert
            if (selectedReportIds.Count == 0)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Please select at least one report.');setTimeout(function() { location.reload(); }, 1000);", true);
                return;
            }

            // Generate a single shared report link
            string reportPageUrl = "https://hfiles.in/ShareReports.aspx?reports=" + string.Join(",", selectedReportIds);
            string encodedMessage = "View your reports here: " + reportPageUrl;

            // Generate a universal mailto URL (works for all email clients)
            string gmailUrl = $"https://mail.google.com/mail/?view=cm&fs=1&to=&su={Uri.EscapeDataString("Report Links")}&body={Uri.EscapeDataString(encodedMessage)}";
            // Open email client in a new tab
            string script = $"window.open('{gmailUrl}', '_blank');setTimeout(function() {{ location.reload(); }}, 1000);";
            ScriptManager.RegisterStartupScript(this, GetType(), "openEmail", script, true);
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