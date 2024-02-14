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
    protected void Page_Load(object sender, EventArgs e)
    {
      user_members();
      requests();
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
          icon = "assets/select.png";
          message = "Member Removed Successfully!";
          string script = "<script type=\"text/javascript\"> launch_toast('" + message + "','\"+icon+\"'); </script>";
          ClientScript.RegisterStartupScript(this.GetType(), "reportalert", script);
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
          this.rptRequests.DataSource = (object)dataTable;
          this.rptRequests.DataBind();
        }
      }
    }

    protected void acceptBtn_Click(object sender, EventArgs e)
    {
      int int16 = (int)Convert.ToInt16((sender as ImageButton).CommandArgument);
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
          icon = "assets/select.png";
          message = "Request Accepted !";
          string script = "<script type=\"text/javascript\"> launch_toast('" + message + "','"+icon+"'); </script>";
          ClientScript.RegisterStartupScript(this.GetType(), "requestalert", script);
          System.Web.UI.ScriptManager.RegisterClientScriptBlock((Page)this, this.GetType(), "alertMessage", "alert('Request Accepted')", true);
        }
      }
    }
    protected void friendrequests_RowDataBound(object sender, GridViewRowEventArgs e)
    {
    }
    protected void rejectBtn_Click(object sender, EventArgs e)
    {
      int value = (int)Convert.ToInt16((sender as ImageButton).CommandArgument);
      using (MySqlConnection connection = new MySqlConnection(this.cs))
      {
        connection.Open();
        using (MySqlCommand mySqlCommand = new MySqlCommand("usp_acceptRequest", connection))
        {
          mySqlCommand.CommandType = CommandType.StoredProcedure;
          mySqlCommand.Parameters.AddWithValue("_user_id", (object)DAL.validateInt(this.Session["Userid"]));
          mySqlCommand.Parameters.AddWithValue("_requestedid", value);
          mySqlCommand.Parameters.AddWithValue("_accepted", (object)0);
          mySqlCommand.Parameters.AddWithValue("_rejected", (object)2);
          mySqlCommand.ExecuteNonQuery();
          connection.Close();
          icon = "assets/not-select-red.png";
          message = "Request Rejected!";
          string script = "<script type=\"text/javascript\"> launch_toast('" + message + "','"+icon+"'); </script>";
          ClientScript.RegisterStartupScript(this.GetType(), "reportalert", script);
          System.Web.UI.ScriptManager.RegisterClientScriptBlock((Page)this, this.GetType(), "alertMessage", "alert('Request Rejected')", true);
        }
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
      
      icon = "assets/select.png";
      message = "Request Sent to Member!";
      string script = "<script type=\"text/javascript\"> launch_toast('" + message + "','" + icon + "'); </script>";
      ClientScript.RegisterStartupScript(this.GetType(), "reportalert", script);
      ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Request Sent to Member !')", true);


    }
  }
}