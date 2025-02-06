using MailKit;
using Microsoft.Graph.Models;
using Microsoft.Graph.Models.Security;
using MySql.Data.MySqlClient;
using MySqlX.XDevAPI.Common;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;






namespace hfiles
{
    public partial class ManageMembers : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["signage"].ConnectionString;
        string message, icon = "";
        int Requestcount = 0;
        private object Id;
        private object newIsActive;
       // private string txtEmail;
       // private string txtMobile;
        private string hfUserId;
        private object commandArgument;
        private object Profileupload;
        private string Extension1;
        private string fileName1;
        private string dt1;
        private string filePath;

        protected void Page_Load(object sender, EventArgs e)
        {
            user_members();
            requests();
            if (!IsPostBack)
            {
                // Bind data to the repeater
                //gvMembers1.DataSource = GetUserData();
                gvMembers1.DataBind();
            }

            if (Session["showToastr"] != null && (bool)Session["showToastr"])
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "showToastr", "showToastr('success', 'Updated successfully');", true);
                Session["showToastr"] = null; // Clear the flag
            }
            //Label masterPageLabel = Master.FindControl("ReqCount") as Label;

            //if (masterPageLabel != null)
            //{
            //    masterPageLabel.Text = Requestcount.ToString();

            //    string labelText = masterPageLabel.Text;
            //}
        }

        protected void user_members()
        {
            using (MySqlConnection con = new MySqlConnection(cs))
            {
                con.Open();
                using (MySqlCommand cmd = new MySqlCommand("usp_getmember", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("_UserId", DAL.validateInt(Session["Userid"])); //Session["Userid"];
                    cmd.Parameters.AddWithValue("_MemberId", 0); //Session["Userid"];
                    cmd.Parameters.AddWithValue("_SpType", "LS"); //Session["Userid"];
                    cmd.Parameters.AddWithValue("_ReportId", 0); //Session["Userid"];
                    cmd.Parameters.AddWithValue("_RId", 0); //Session["Userid"];
                                                            // cmd.Parameters.AddWithValue("_AccessMappingId", 0); //Session["Userid"];
                    MySqlDataAdapter da = new MySqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    gvMembers1.DataSource = dt;
                    gvMembers1.DataBind();
                    ViewState["usermemberlist"] = dt;

                    Label ReqCount = Master.FindControl("ReqCount") as Label;
                    ReqCount.Text = dt != null && dt.Rows.Count > 0 ? dt.Rows.Count.ToString() : "0";
                }
            }
        }

      





        protected void lbtnRemove_Click(object sender, EventArgs e)
        {
            LinkButton lnk = sender as LinkButton;
            //int value = Convert.ToInt16(lnk.CommandArgument);

            string commandArgument = lnk.CommandArgument;
            string[] values = commandArgument.Split('|');

            //var memberid = linkButton.CommandArgument.ToString();
            string memberid = "";
            string relation = "";
            string DependentUserId = "";
            string Dependent_User_Reference = "";
            
            string IdName = lnk.CommandArgument;

            string[] IdNamevalues = IdName.Split('|');
            if (IdNamevalues.Length == 4)
            {
                memberid = values[0];
                relation = values[1];
                DependentUserId = values[2];
                Dependent_User_Reference = values[3];
               
            }

            RemoveMember(DAL.validateInt(memberid), DAL.validateInt(Dependent_User_Reference), DAL.validateInt(DependentUserId));



            //ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", " toastr.success('Member Removed Successfully');", true);
           ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "toastr.success('Member Removed Successfully');location.reload();", true);


           

        }

        protected void RemoveMember(int MemberId, int Dependent_User_Reference, int DependentUserId)
        {
            //if (DependentUserId> 0)
            //{
            //    MemberId = Dependent_User_Reference;
            //}
            using (MySqlConnection con = new MySqlConnection(cs))
            {
                con.Open();
                using (MySqlCommand cmd = new MySqlCommand("usp_removemember", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("_UserId", DAL.validateInt(MemberId)); //Session["Userid"];
                    var _user = DAL.validateInt(Session["Userid"]);
                    cmd.Parameters.AddWithValue("_UserRedId", _user); //Session["Userid"];
                    cmd.Parameters.AddWithValue("_DependentUserId", Dependent_User_Reference); //Session["Userid"];
                 
                    cmd.ExecuteNonQuery();
                    //icon = "assets/select.png";
                    //message = "Member Removed Successfully!";
                    //string script = "<script type=\"text/javascript\"> launch_toast('" + message + "','\"+icon+\"'); </script>";
                    //ClientScript.RegisterStartupScript(this.GetType(), "reportalert", script);
                    //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Member Removed Successfully')", true);

                }
                user_members();
            }
        }

        protected void gvMembers_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // Get the index of the current row
                int rowIndex = e.Row.RowIndex + 1;

                // Find the Label control in the first column of the GridView
                Label lblSerialNumber = (Label)e.Row.FindControl("lblSerialNumber");

                // Set the text of the Label to the serial number
                if (lblSerialNumber != null)
                {
                    lblSerialNumber.Text = rowIndex.ToString();
                }
            }
        }

        protected void LbtnEdit_Click(object sender, EventArgs e)
        {
            LinkButton lbtnRemove = (LinkButton)sender;
            string userId = lbtnRemove.CommandArgument;

            // Redirect to AddMembers.aspx with the user ID as a parameter
            Response.Redirect($"AddMembers.aspx?UserId={userId}");
        }
        protected void requests()
        {
            using (MySqlConnection connection = new MySqlConnection(this.cs))
            {
                connection.Open();
                using (MySqlCommand selectCommand = new MySqlCommand("usp_getallRequests", connection))
                {
                    selectCommand.CommandType = CommandType.StoredProcedure;
                    selectCommand.Parameters.AddWithValue("_user_id", (object)DAL.validateInt(this.Session["Userid"]));
                    MySqlDataAdapter mySqlDataAdapter = new MySqlDataAdapter(selectCommand);
                    DataTable dataTable = new DataTable();
                    mySqlDataAdapter.Fill(dataTable);
                    Requestcount = dataTable.Rows.Count;
                    this.rptRequests.DataSource = dataTable;
                    this.rptRequests.DataBind();
                    Label masterPageLabel = Master.FindControl("ReqCount") as Label;

                    if (masterPageLabel != null)
                    {
                        masterPageLabel.Text = Requestcount.ToString();

                        string labelText = masterPageLabel.Text;
                    }
                }
            }
            // return Requestcount;
        }

        [System.Web.Services.WebMethod]
        public static int GetNotifiedRequest()
        {
            // Assuming you cannot access `Session` in a static context
            // The caller should pass the `UserId` if needed, or refactor accordingly.
            return new ManageMembers().notifiedRequests();
        }

        private int notifiedRequests()
        {
            DataTable dt = new DataTable();
            int result1 = 0;
            try
            {
                using (var connection = new MySqlConnection(cs))
                {
                    connection.Open();
                    using (var cmd = new MySqlCommand("usp_getnotifiedRequests", connection))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@_user_id", DAL.validateInt(Session["Userid"]));
                        MySqlDataAdapter mySqlDataAdapter = new MySqlDataAdapter(cmd);
                        DataTable dataTable = new DataTable();
                        mySqlDataAdapter.Fill(dataTable);
                        result1 = dataTable.Rows.Count;

                    }
                }
            }
            catch (Exception ex)
            {
                // Log the exception if required
               // Response.Write("Error : " + ex.Message);
                //return JsonConvert.SerializeObject(new { Error = ex.Message });
            }
            if (result1 > 0)
            {
                // Convert DataTable to JSON and return
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('You have receive Member Request..')", true);
            }
            return result1;

        }
        protected void acceptBtn_Click(object sender, EventArgs e)
        {
            LinkButton lbtn = sender as LinkButton;
            int int16 = (int)Convert.ToInt16((sender as LinkButton).CommandArgument);
            RepeaterItem rv = lbtn.NamingContainer as RepeaterItem;

            HiddenField hfDependentUserId = rv.FindControl("hfDependentUserId") as HiddenField;

            using (MySqlConnection connection = new MySqlConnection(this.cs))
            {
                connection.Open();
                using (MySqlCommand mySqlCommand = new MySqlCommand("usp_acceptRequest", connection))
                {
                    mySqlCommand.CommandType = CommandType.StoredProcedure;
                    mySqlCommand.Parameters.AddWithValue("_user_id", (object)DAL.validateInt(this.Session["Userid"]));
                    mySqlCommand.Parameters.AddWithValue("_requestedid", (object)int16);
                    mySqlCommand.Parameters.AddWithValue("_accepted", (object)1);
                    mySqlCommand.Parameters.AddWithValue("_rejected", (object)0);
                    mySqlCommand.Parameters.AddWithValue("_dependentUserId", DAL.validateInt(hfDependentUserId.Value)); 
                    mySqlCommand.ExecuteNonQuery();
                    connection.Close();
                    //icon = "assets/select.png";
                    //message = "Request Accepted !";
                    //string script = "<script type=\"text/javascript\"> launch_toast('" + message + "','" + icon + "'); </script>";
                    //ClientScript.RegisterStartupScript(this.GetType(), "requestalert", script);
                    //System.Web.UI.ScriptManager.RegisterClientScriptBlock((Page)this, this.GetType(), "alertMessage", "alert('Request Accepted')", true);

                    ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", " toastr.success('Request Accepted');", true);
                }
            }
            requests();
            user_members();
        }
        protected void friendrequests_RowDataBound(object sender, GridViewRowEventArgs e)
        {
        }
        protected void rejectBtn_Click(object sender, EventArgs e)
        {
            int value = (int)Convert.ToInt16((sender as LinkButton).CommandArgument);
            using (MySqlConnection connection = new MySqlConnection(this.cs))
            {
                connection.Open();
                using (MySqlCommand mySqlCommand = new MySqlCommand("usp_acceptRequest", connection))
                {
                    mySqlCommand.CommandType = CommandType.StoredProcedure;
                    mySqlCommand.Parameters.AddWithValue("_user_id", (object)DAL.validateInt(this.Session["Userid"]));
                    mySqlCommand.Parameters.AddWithValue("_requestedid", value);
                    mySqlCommand.Parameters.AddWithValue("_accepted", (object)0);
                    mySqlCommand.Parameters.AddWithValue("_rejected", (object)1);
                    mySqlCommand.ExecuteNonQuery();
                    connection.Close();
                    //icon = "assets/not-select-red.png";
                    //message = "Request Rejected!";
                    //string script = "<script type=\"text/javascript\"> launch_toast('" + message + "','" + icon + "'); </script>";
                    //ClientScript.RegisterStartupScript(this.GetType(), "reportalert", script);
                    //System.Web.UI.ScriptManager.RegisterClientScriptBlock((Page)this, this.GetType(), "alertMessage", "alert('Request Rejected')", true);

                    ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", " toastr.success('Request Rejected');", true);
                }
            }
            user_members();
            requests();
        }
        protected void SearchInput_TextChanged(object sender, EventArgs e)
        {

            try
            {
                DataTable dt;
                using (MySqlConnection con = new MySqlConnection(cs))
                {
                    con.Open();
                    using (MySqlCommand cmd = new MySqlCommand("usp_getallRequests", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("_user_id", (object)DAL.validateInt(this.Session["Userid"]));
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

                            //foreach (DataRow row in dt.Rows) 
                            foreach (DataRow row in dt.Rows)
                            {
                                string firstName = row["user_firstname"].ToString().ToLower();
                                string lastName = row["user_lastname"].ToString().ToLower();
                                if (firstName.Contains(searchTerm) || lastName.Contains(searchTerm))
                                {
                                    filteredData.ImportRow(row);
                                }
                            }

                            // Bind the filtered DataTable to the Repeater.
                            rptRequests.DataSource = filteredData;
                            rptRequests.DataBind();
                        }
                        else
                        {
                            rptRequests.DataSource = dt;
                            rptRequests.DataBind();
                        }
                    }
                }
            }
            catch (Exception Ex)
            {
            }

            try
            {
                DataTable dt = new DataTable();
                if (ViewState["usermemberlist"] != null)
                {
                    dt = (DataTable)ViewState["usermemberlist"];
                }
                if (dt != null && dt.Rows.Count > 0)
                {
                    //tcount.InnerHtml = dt.Rows.Count.ToString();
                    string searchTerm = SearchInput.Text;

                    // Filter the DataTable based on the search term.
                    DataTable filteredData = new DataTable();
                    filteredData = dt.Clone(); // Clone the structure of the original DataTable.

                    //foreach (DataRow row in dt.Rows) 
                    foreach (DataRow row in dt.Rows)
                    {
                        string firstName = row["user_firstname"].ToString().ToLower();
                        string lastName = row["user_lastname"].ToString().ToLower();
                        if (firstName.Contains(searchTerm) || lastName.Contains(searchTerm))
                        {
                            filteredData.ImportRow(row);
                        }
                    }

                    // Bind the filtered DataTable to the Repeater.
                    gvMembers1.DataSource = filteredData;
                    gvMembers1.DataBind();
                }
                else
                {
                    gvMembers1.DataSource = dt;
                    gvMembers1.DataBind();
                }
            }
            catch (Exception)
            {

                throw;
            }
        }

        protected void btnAddMember_Click(object sender, EventArgs e)
        {
            //if (result == 1)
            //{
            //    string email = emailTextBox.Value.ToString();
            //    //string subject = "# Verification code";
            //    string subject = "Welcome to HFiles";
            //    string body = $"<p style=\"text-align: justify;\">Dear {firstnameTextBox.Value},&nbsp;</p>\r\n<p style=\"text-align: justify;\"> {Session["username"].ToString()} has added you to HFiles Portal,&nbsp;</p>\r\n<p style=\"text-align: justify;\">Please verify your Email Id to complete signup process.&nbsp;</p>\r\n<p style=\"text-align: justify;\">Use below link to verify your Email Id.&nbsp;<br> http://68.178.164.174//membersignup.aspx</p> <p style=\"text-align: justify;\">&nbsp;</p>";
            //    //Use below password for sigining up { membershippasword}

            //    DAL.SendCareerMail(subject, body, email);
            //    Response.Write("<script>alert('Memeber added successfully.')</script>");
            //    Response.Redirect("avatar.aspx");
            //}

            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", " toastr.success('Request Sent to Member');", true);
            //icon = "assets/select.png";
            //message = "Request Sent to Member!";
            //string script = "<script type=\"text/javascript\"> launch_toast('" + message + "','" + icon + "'); </script>";
            //ClientScript.RegisterStartupScript(this.GetType(), "reportalert", script);
            //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Request Sent to Member !')", true);


        }


       
        protected void editBtn_Click(object sender, EventArgs e)
        {
            LinkButton editButton = (LinkButton)sender;
            string userId = editButton.CommandArgument;
            ViewState["UserId"] = userId;

            // hfUserId.Value = userId;

            GetUserDetails(userId);

           // ScriptManager.RegisterStartupScript(this, this.GetType(), "showModal", "$('#editUserModal').modal('show');", true);

        }

      
        protected void GetUserDetails(string userId)
        {
            txtEmail.Text = "";
            txtMobile.Text = "";



            using (MySqlConnection connection = new MySqlConnection(cs))
            {
                connection.Open();
                string query = "SELECT user_email, user_contact FROM user_details WHERE user_id ="+userId;
                using (MySqlCommand cmd = new MySqlCommand(query, connection))
                {
                   
                    MySqlDataReader reader = cmd.ExecuteReader();
                    
                        while (reader.Read())
                        {

                        txtEmail.Text = reader["user_email"].ToString();
                            txtMobile.Text = reader["user_contact"].ToString();
                           ScriptManager.RegisterStartupScript(this, this.GetType(), "showModal", "$('#editUserModal').modal('show');", true);

                       }
                    
                }
            }
            
        }

       
        protected void lbtnSave_Click(object sender, EventArgs e)
        {
            try
            {
                string email = txtEmail.Text;
                string mobile = txtMobile.Text;
                string userId = ViewState["UserId"] as string;

              
                UpdateUserDetails(userId, email, mobile);

                FileUpload fileUpload = Panel1.FindControl("Profileupload") as FileUpload;

                if (fileUpload != null && fileUpload.HasFile)
                {
                    string filename = Path.GetFileName(fileUpload.FileName);
                    string filepath = Server.MapPath("~/upload/") + filename;

                 
                    fileUpload.SaveAs(filepath);

                  
                    UpdateUserProfileImage(userId, filename);
                }

                //ScriptManager.RegisterStartupScript(this, this.GetType(), "showToastr", "showToastr('success', 'Updated successfully');", true);

                Session["showToastr"] = true;
                Response.Redirect(Request.Url.AbsoluteUri);


            }
            catch (Exception ex)
            {
                // Display error message
                ScriptManager.RegisterStartupScript(this, this.GetType(), "showToastr", "showToastr('error', 'Update failed');", true);
            }
        }

        private void UpdateUserDetails(string userId, string email, string mobile)
        {
            using (MySqlConnection con = new MySqlConnection(cs))
            {
                string query = "UPDATE user_details SET user_email = @Email, user_contact = @Mobile WHERE user_id = @UserID";
                using (MySqlCommand cmd = new MySqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@UserID", userId);
                    cmd.Parameters.AddWithValue("@Email", email);
                    cmd.Parameters.AddWithValue("@Mobile", mobile);

                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
        }

       
       
        private void UpdateUserProfileImage(string userId, string filename)
        {
            string filePath = filename;

            // Example: SQL query to update the database
            string query = "UPDATE user_details SET user_image = @ImagePath WHERE user_id = @UserId";
            using (MySqlConnection conn = new MySqlConnection(cs))
            {
                using (MySqlCommand cmd = new MySqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@ImagePath", filePath);
                    cmd.Parameters.AddWithValue("@UserId", userId);
                    conn.Open();
                    cmd.ExecuteNonQuery();
                }
            }
        }
      
    }
}