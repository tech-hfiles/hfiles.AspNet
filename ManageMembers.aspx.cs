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
        protected void Page_Load(object sender, EventArgs e)
        {
            user_members();
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
                    MySqlDataAdapter da = new MySqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    gvMembers.DataSource = dt;
                    gvMembers.DataBind();

                }
            }
        }

        protected void lbtnRemove_Click(object sender, EventArgs e)
        {
            LinkButton lnk = sender as LinkButton;
            int value = Convert.ToInt16(lnk.CommandArgument);
            RemoveMember(value);
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
                    cmd.ExecuteNonQuery();
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Member Removed Successfully')", true);
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
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Request Sent to Member !')", true);
            
        
        }
    }
}