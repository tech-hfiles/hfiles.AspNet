using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Configuration;
using MySql.Data.MySqlClient;
using Microsoft.Graph.Models;
using System.Web.Caching;

namespace hfiles
{
    public partial class ShareReports : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["signage"].ConnectionString;
        private string whatsstring;
        private object reportName;
        private object reportType;
        private int reportCount;
        private int reportId;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string reportIdsParam = Request.QueryString["reports"];
                if (!string.IsNullOrEmpty(reportIdsParam))
                {
                    List<int> reportIds = reportIdsParam.Split(',').Select(int.Parse).ToList();
                    BindReports(reportIds);
                }
            }
        }
        private void BindReports(List<int> reportIds)
        {
            DataTable dt = GetReportsFromDatabase(reportIds);
            GridViewReports.DataSource = dt;
            GridViewReports.DataBind();
        }

        private DataTable GetReportsFromDatabase(List<int> reportIds)
        {
            DataTable dt = new DataTable();
            using (MySqlConnection con = new MySqlConnection(cs))
            {
                using (MySqlCommand cmd = new MySqlCommand("usp_GetlinkReportDetails", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure; // Specify it's a stored procedure

                    // Pass the list of report IDs as a comma-separated string
                    string reportIdList = string.Join(",", reportIds);
                    cmd.Parameters.AddWithValue("reportIds", reportIdList);

                    using (MySqlDataAdapter da = new MySqlDataAdapter(cmd))
                    {
                        da.Fill(dt);
                    }
                }
            }
            return dt;
        }

        protected void lnkDownload_Click(object sender, EventArgs e)
        {
            LinkButton lnkDownload = (LinkButton)sender;
            string[] args = lnkDownload.CommandArgument.Split('|');

            if (args.Length < 4) return; // Ensure we have all values

            string reportUrl = args[0];  // Report URL should be "ContentDeliver.aspx?token=xxxxx"
            string reportName = args[1];
            string reportType = args[2];
            string Id = args[3];

            string whatsappUrl = "";
            if (!string.IsNullOrEmpty(reportUrl))
            {

                string fileUrl = GetReportUrlFromDatabase(Id);

                if (!string.IsNullOrEmpty(fileUrl))
                {
                    string whatsappMessage = fileUrl;
                    whatsappUrl = GenerateWhatsAppUrl(whatsappMessage);

                    // Open both the report and WhatsApp in new tabs
                    string script = $"window.open('{whatsappUrl}', '_blank');";
                    ScriptManager.RegisterStartupScript(this, GetType(), "openReport", script, true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Report URL is missing.');", true);
                }

               





            }

        }

        private string GetReportUrlFromDatabase(string reportId)
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
        public string GenerateWhatsAppUrl(string reportList)
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
            string signedUrl = $"https://hfiles.in/ContentDeliver.aspx?token={tokenId}";
            // Callback (if needed)
            // Store token data using tokenId as key (e.g., in MemoryCache, Database, etc.)



            // Return the WhatsApp-ready link
            return signedUrl;
        }

    }
}