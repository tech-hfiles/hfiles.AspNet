using MailKit;
using MySql.Data.MySqlClient;
using MySqlX.XDevAPI.Common;
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
    public partial class ManageMembers : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["signage"].ConnectionString;
        string message, icon = "";
        int Requestcount = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            user_members();
            requests();

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
            int value = Convert.ToInt16(lnk.CommandArgument);
            RemoveMember(value);

            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", " toastr.success('Member Removed Successfully');", true);
        }

        protected void RemoveMember(int MemberId)
        {
            using (MySqlConnection con = new MySqlConnection(cs))
            {
                con.Open();
                using (MySqlCommand cmd = new MySqlCommand("usp_removemember", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("_UserId", DAL.validateInt(MemberId)); //Session["Userid"];
                    cmd.Parameters.AddWithValue("_UserRedId", DAL.validateInt(Session["Userid"])); //Session["Userid"];
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

            // Redirect to addmember.aspx with the user ID as a parameter
            Response.Redirect($"addmember.aspx?UserId={userId}");
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
        protected void acceptBtn_Click(object sender, EventArgs e)
        {
            int int16 = (int)Convert.ToInt16((sender as LinkButton).CommandArgument);
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
    }
}