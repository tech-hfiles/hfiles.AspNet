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


        //protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        //{
        //    lbldeletereport.Text = Convert.ToString(GridView1.DataKeys[e.RowIndex].Value.ToString());

        //    MySqlConnection connection = new MySqlConnection(cs);
        //    connection.Open();
        //    MySqlCommand cmd = new MySqlCommand("USP_DeleteReport", connection);
        //    cmd.CommandType = CommandType.StoredProcedure;
        //    cmd.Parameters.AddWithValue("p_Id", lbldeletereport.Text);
        //    //cmd.Parameters.AddWithValue("p_Id", lbldeletereport.Text);

        //    cmd.ExecuteNonQuery();
        //    connection.Close();

        //    ScriptManager.RegisterClientScriptBlock(
        //            this,
        //            this.GetType(),
        //            "alert",
        //            "alert('Report deleted successfully'); document.location.href='AllReports123';",
        //            true
        //        );


        //    //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "alert('Report deleted successfully');docoment.location.href='"+("AllReports123") +"'", true);
        //}




        //private DataTable MergeDataTables(DataTable dt1, DataTable dt2)
        //{
        //    // Create a new DataTable
        //    DataTable mergedTable = new DataTable();

        //    // Add columns from dt1 to mergedTable
        //    foreach (DataColumn column in dt1.Columns)
        //    {
        //        mergedTable.Columns.Add(new DataColumn(column.ColumnName, column.DataType));
        //    }

        //    // Add columns from dt2 to mergedTable
        //    foreach (DataColumn column in dt2.Columns)
        //    {
        //        if (!mergedTable.Columns.Contains(column.ColumnName))
        //        {
        //            mergedTable.Columns.Add(new DataColumn(column.ColumnName, column.DataType));
        //        }
        //    }

        //    // Create a HashSet to track added userids
        //    HashSet<string> userIdSet = new HashSet<string>();

        //    // Merge rows from dt1
        //    foreach (DataRow row1 in dt1.Rows)
        //    {
        //        string userId = row1["user_id"].ToString();
        //        if (!userIdSet.Contains(userId))
        //        {
        //            DataRow newRow = mergedTable.Rows.Add();
        //            foreach (DataColumn column in dt1.Columns)
        //            {
        //                newRow[column.ColumnName] = row1[column.ColumnName];
        //            }
        //            userIdSet.Add(userId);
        //        }
        //    }

        //    // Merge rows from dt2
        //    foreach (DataRow row2 in dt2.Rows)
        //    {
        //        string userId = row2["user_id"].ToString();
        //        if (!userIdSet.Contains(userId))
        //        {
        //            DataRow newRow = mergedTable.Rows.Add();
        //            foreach (DataColumn column in dt2.Columns)
        //            {
        //                newRow[column.ColumnName] = row2[column.ColumnName];
        //            }
        //            userIdSet.Add(userId);
        //        }
        //    }

        //    return mergedTable;
        //}

        //protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        //{
        //    popup.Visible = true;

        //    if (e.CommandName == "EditRow")
        //    {
        //        try
        //        {
        //            int memberId = Convert.ToInt32(Session["memberId"]);
        //            int user_referenceId = Convert.ToInt32(Session["user_reference"]);

        //            // Example logic for visibility of the CheckBoxList
        //            ddlMembers2.Visible = !(user_referenceId > 0 && memberId > 0 &&

        //                 Session["user_reference_email"].ToString() == Session["user_email"].ToString());

        //            ddlMembers2.ClearSelection();
        //            lblNoMember.Text = string.Empty;

        //            // Extract the report ID from the CommandArgument
        //            int reportId = Convert.ToInt32(e.CommandArgument);
        //            Session["ReportUniqueId"] = reportId;

        //            // Show modal
        //            //mp1.Show();

        //            int RId = DAL.validateInt(Request.QueryString["rid"]);
        //            int UserId = DAL.validateInt(Session["Userid"].ToString());

        //            // Fetch and bind member list
        //            using (MySqlConnection con = new MySqlConnection(cs))
        //            {
        //                con.Open();
        //                using (MySqlCommand cmd = new MySqlCommand("usp_getmember", con))
        //                {
        //                    cmd.CommandType = CommandType.StoredProcedure;
        //                    cmd.Parameters.AddWithValue("_UserId", UserId);
        //                    cmd.Parameters.AddWithValue("_MemberId", 0);
        //                    cmd.Parameters.AddWithValue("_SpType", "E");
        //                    cmd.Parameters.AddWithValue("_ReportId", RId);
        //                    cmd.Parameters.AddWithValue("_RId", reportId);

        //                    MySqlDataAdapter da = new MySqlDataAdapter(cmd);
        //                    DataTable dt = new DataTable();
        //                    da.Fill(dt);

        //                    if (dt != null && dt.Rows.Count > 0)
        //                    {
        //                        DataTable mergedTable = MergeDataTables(Session["dtMemberList"] as DataTable, dt);

        //                        // Filter only independent members
        //                        var filteredRows = mergedTable.AsEnumerable().Where(row =>
        //                        {
        //                            var isDependentValue = row["IsDependent"];
        //                            return isDependentValue != DBNull.Value && int.TryParse(isDependentValue.ToString(), out int isDependent) && isDependent == 0;
        //                        });

        //                        mergedTable = filteredRows.Any() ? filteredRows.CopyToDataTable() : mergedTable.Clone();

        //                        ddlMembers2.DataSource = mergedTable;
        //                        ddlMembers2.DataTextField = "user_FirstName";
        //                        ddlMembers2.DataValueField = "user_Id";
        //                        ddlMembers2.DataBind();

        //                        // Pre-select members based on report ID
        //                        List<string> selectedMembers = dt.AsEnumerable()
        //                                                         .Select(row => row["user_Id"].ToString())
        //                                                         .ToList();

        //                        //foreach (ListItem item in ddlMembers2.Items)
        //                        //{
        //                        //    if (selectedMembers.Contains(item.Value))
        //                        //    {
        //                        //        item.Selected = true;
        //                        //    }
        //                        //}
        //                        //mp1.Show();
        //                    }
        //                    else
        //                    {
        //                        ddlMembers2.Items.Clear();
        //                        lblNoMember.Text = "No Members";
        //                    }
        //                }
        //            }

        //            // Populate additional fields
        //            getReportName(reportId);
        //        }
        //        catch (Exception ex)
        //        {
        //            // Handle exceptions
        //            Console.WriteLine(ex.Message);
        //        }
        //    }
        //}

        //protected void getReportName(int Id)
        //{


        //    // string reportname = txtReportName.Text;
        //    txtReportName.Text = "";
        //    lbtnSave.CommandArgument = "";


        //    MySqlConnection con = new MySqlConnection(cs);




        //    con.Open();


        //    string query = "SELECT ReportId, Id, ReportName FROM user_reports where Id =" + Id;



        //    MySqlCommand cmd = new MySqlCommand(query, con);
        //    //         cmd.Parameters.AddWithValue("@Id", Id);


        //    MySqlDataReader dr = cmd.ExecuteReader();

        //    while (dr.Read())
        //    {
        //        txtReportName.Text = dr["ReportName"].ToString();
        //        lbtnSave.CommandArgument = Convert.ToString(Id);
        //    }


        //    con.Close();





        //}

        //protected void lbtnSave_Click(object sender, EventArgs e)
        //{
        //    int RId = DAL.validateInt(Request.QueryString["rid"]);
        //    int memberId = Convert.ToInt32(Session["memberId"]);
        //    List<int> selectedIds = new List<int>();

        //    //foreach (ListItem item in ddlMembers2.Items)
        //    //{
        //    //    if (item.Selected)
        //    //    {
        //    //        selectedIds.Add(Convert.ToInt32(item.Value));
        //    //    }
        //    //}
        //    string memberIdList = string.Join(",", selectedIds);
        //    //int memberId = Convert.ToInt32(ddlMembers2.SelectedItem.Value);
        //    int result = 0;
        //    try
        //    {
        //        //int age= Convert.ToInt32(Session["MemberAge"].ToString());
        //        int age = 0;

        //        using (MySqlConnection con = new MySqlConnection(cs))
        //        {
        //            con.Open();
        //            using (MySqlCommand cmd = new MySqlCommand("usp_addreportwithaccess", con))
        //            {
        //                //if (memberId > 0)
        //                if (Session["memberRelation"] == null)
        //                {
        //                    Session["memberRelation"] = "Self";
        //                }



        //                if (Session["memberRelation"].ToString() == "Self" || Session["memberRelation"].ToString() == "Son" || Session["memberRelation"].ToString() == "daughter" || Session["memberRelation"].ToString() == "cat" || Session["memberRelation"].ToString() == "Dog" || Session["memberRelation"].ToString() == "GrandFather" || Session["memberRelation"].ToString() == "GrandMother" || Session["memberRelation"].ToString() == "Uncle" || Session["memberRelation"].ToString() == "Aunt" || Session["memberRelation"].ToString() == "Son" && age < 17 || age > 70)
        //                {
        //                    cmd.CommandType = CommandType.StoredProcedure;
        //                    cmd.Parameters.AddWithValue("_UserId", int.Parse(Session["Userid"].ToString()));
        //                    cmd.Parameters.AddWithValue("_reportname", "");
        //                    cmd.Parameters.AddWithValue("_reporturl", "");
        //                    cmd.Parameters.AddWithValue("_reportId", DAL.validateInt(RId));
        //                    // cmd.Parameters.AddWithValue("_memberId", memberId);
        //                    cmd.Parameters.AddWithValue("_memberId", memberIdList);
        //                    cmd.Parameters.AddWithValue("_rId", Convert.ToInt32(Session["ReportUniqueId"].ToString()));
        //                    cmd.Parameters.AddWithValue("_SpType", "U");
        //                    cmd.Parameters.AddWithValue("_UploadType", "");
        //                    cmd.Parameters.AddWithValue("_FileSize", 0);
        //                    cmd.Parameters.AddWithValue("_Result", SqlDbType.Int);
        //                    cmd.Parameters["_Result"].Direction = ParameterDirection.Output;
        //                    cmd.ExecuteNonQuery();
        //                    int retVal = Convert.ToInt32(cmd.Parameters["_Result"].Value);
        //                    result = DAL.validateInt(retVal);
        //                    ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", " toastr.success('Report Updated successfully');", true);
        //                    //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Report Updated Successfully')", true);
        //                    //ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "swal("Report Added Successfully");", true);
        //                    Session["memberId"] = 0;
        //                }
        //                else if (memberId == int.Parse(Session["Userid"].ToString()))
        //                {
        //                    //using (MySqlCommand cmd = new MySqlCommand("usp_addreport", con))
        //                    //{
        //                    cmd.CommandType = CommandType.StoredProcedure;
        //                    cmd.Parameters.AddWithValue("_UserId", int.Parse(Session["Userid"].ToString()));
        //                    cmd.Parameters.AddWithValue("_reportname", "");
        //                    cmd.Parameters.AddWithValue("_reporturl", "");
        //                    cmd.Parameters.AddWithValue("_reportId", DAL.validateInt(RId));
        //                    // cmd.Parameters.AddWithValue("_memberId", memberId);
        //                    cmd.Parameters.AddWithValue("_memberId", memberIdList);
        //                    cmd.Parameters.AddWithValue("_rId", Convert.ToInt32(Session["ReportUniqueId"].ToString()));
        //                    cmd.Parameters.AddWithValue("_SpType", "U");
        //                    cmd.Parameters.AddWithValue("_UploadType", "");
        //                    cmd.Parameters.AddWithValue("_FileSize", 0);
        //                    cmd.Parameters.AddWithValue("_Result", SqlDbType.Int);
        //                    cmd.Parameters["_Result"].Direction = ParameterDirection.Output;
        //                    cmd.ExecuteNonQuery();
        //                    int retVal = Convert.ToInt32(cmd.Parameters["_Result"].Value);
        //                    result = DAL.validateInt(retVal);
        //                    ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", " toastr.success('Report Updated successfully');", true);
        //                    //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Report Updated Successfully')", true);
        //                    //ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "swal("Report Added Successfully");", true);
        //                }
        //                else
        //                {
        //                    //using (MySqlCommand cmd = new MySqlCommand("usp_addreport", con))
        //                    //{
        //                    cmd.CommandType = CommandType.StoredProcedure;
        //                    cmd.Parameters.AddWithValue("_UserId", int.Parse(Session["Userid"].ToString()));
        //                    cmd.Parameters.AddWithValue("_reportname", "");
        //                    cmd.Parameters.AddWithValue("_reporturl", "");
        //                    cmd.Parameters.AddWithValue("_reportId", DAL.validateInt(RId));
        //                    // cmd.Parameters.AddWithValue("_memberId", memberId);
        //                    cmd.Parameters.AddWithValue("_memberId", memberIdList);
        //                    cmd.Parameters.AddWithValue("_rId", Convert.ToInt32(Session["ReportUniqueId"].ToString()));
        //                    cmd.Parameters.AddWithValue("_SpType", "U");
        //                    cmd.Parameters.AddWithValue("_UploadType", "");
        //                    cmd.Parameters.AddWithValue("_FileSize", 0);
        //                    cmd.Parameters.AddWithValue("_Result", SqlDbType.Int);
        //                    cmd.Parameters["_Result"].Direction = ParameterDirection.Output;
        //                    cmd.ExecuteNonQuery();
        //                    int retVal = Convert.ToInt32(cmd.Parameters["_Result"].Value);
        //                    result = DAL.validateInt(retVal);
        //                    // ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", " toastr.success('Report Updated successfully');", true);
        //                    //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Report Updated Successfully')", true);
        //                    //else
        //                    //{
        //                    //    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('You don't have permission to add reports for this member')", true);
        //                    //}
        //                }
        //            }
        //        }
        //    }
        //    catch (Exception Ex)
        //    {
        //        result = 0;
        //    }
        //    //return result;
        //    //getReportNameupdate();


        //    try
        //    {


        //        LinkButton lbtnimg = (LinkButton)sender;
        //        string commandArgument = lbtnimg.CommandArgument;

        //        //int Id = DAL.validateInt(lbtnimg.CommandArgument.ToString());
        //        Console.WriteLine($"CommandArgument: {commandArgument}");

        //        int _Id = DAL.validateInt(commandArgument);

        //        //int reportId = 340;

        //        // Call the method
        //        int updatedId = GetReportNameUpdate(sender, _Id);

        //        // Optionally, handle the returned ID or display a success message
        //        ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", " toastr.success('Report Name Updated');", true);

        //    }
        //    catch (Exception ex)
        //    {
        //        ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", " toastr.fail('ReportName Updated fail');", true);

        //    }
        //}

        //public int GetReportNameUpdate(object sender, int Id)
        //{
        //    try
        //    {
        //        LinkButton lbtnimg = (LinkButton)(sender);
        //        string commandArgument = lbtnimg.CommandArgument;

        //        Console.WriteLine($"CommandArgument: {commandArgument}");

        //        //int _Id = DAL.validateInt(lbtnimg.CommandArgument.ToString());




        //        //LinkButton lbtn = (LinkButton)sender;
        //        //string commandArgument = lbtn.CommandArgument;

        //        int id = Id;
        //        string reportName = txtReportName.Text;

        //        using (MySqlConnection con = new MySqlConnection(cs))
        //        {


        //            using (MySqlCommand cmd = new MySqlCommand("GetReportNameByUserId", con))
        //            {
        //                cmd.CommandType = CommandType.StoredProcedure;
        //                cmd.Parameters.AddWithValue("@p_ID", id);
        //                cmd.Parameters.AddWithValue("@p_ReportName", reportName);
        //                cmd.Parameters["@p_ReportName"].MySqlDbType = MySqlDbType.VarChar;
        //                cmd.Parameters["@p_ReportName"].Size = 255;

        //                con.Open();
        //                cmd.ExecuteNonQuery();
        //                con.Close();
        //            }
        //        }
        //        return Id;
        //    }
        //    catch (Exception ex)
        //    {
        //        Console.WriteLine($"Error: {ex.Message}");
        //        return Id;
        //    }

        //}




        //protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        //{
        //    if (e.Row.RowType == DataControlRowType.DataRow)
        //    {
        //        // Find the placeholder control for the link
        //        PlaceHolder phLink = (PlaceHolder)e.Row.FindControl("phLink");

        //        if (phLink != null)
        //        {
        //            // Create the hyperlink
        //            HyperLink link = new HyperLink
        //            {
        //                NavigateUrl = ResolveUrl(string.Format("~/upload/report/{0}", DataBinder.Eval(e.Row.DataItem, "ReportUrl"))),
        //                Target = "_blank",
        //                CssClass = "btn btn-sm btn-primary",
        //                Text = "View File"
        //            };

        //            // Add the link to the placeholder
        //            phLink.Controls.Add(link);
        //        }
        //    }
        //}

        //protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        //{
        //    if (e.CommandName == "ViewFile")
        //    {
        //        int rowIndex = Convert.ToInt32(e.CommandArgument);
        //        GridViewRow row = GridView1.Rows[rowIndex];

        //        // Assuming "FolderUrl" is a column in your data source representing the folder path
        //        string folderUrl = DataBinder.Eval(row.DataItem, "FolderUrl").ToString();
        //        string reportUrl = e.CommandArgument.ToString(); // ReportUrl is passed as CommandArgument

        //        // Create the full URL for the link
        //        string fullUrl = ResolveUrl(string.Format("{0}/upload/report/{1}", folderUrl, reportUrl));

        //        // Open the URL in a new window
        //        Response.Redirect(fullUrl, true);
        //    }
        //}

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
                        else
                        {
                            // Log an error message if no valid file path is found
                            ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('No valid report found.');", true);
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

                // Configure SMTP client
                SmtpClient smtpClient = new SmtpClient("smtp.gmail.com"); // Replace with your SMTP server
                smtpClient.Port = 587; // Use appropriate port
                smtpClient.Credentials = new NetworkCredential("Hfiles.in@gmail.com", "qpjdigykglmnuxlt");
                smtpClient.EnableSsl = true;

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
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "alert", $"alert('Error sending email: {ex.Message}');", true);
            }
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