using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hfiles
{
  public partial class changepassword : System.Web.UI.Page
  {
    #region variable
    string cs = ConfigurationManager.ConnectionStrings["signage"].ConnectionString, img, ext;
    //AdminAction aa = new AdminAction();
    string message, icon;
    #endregion
    #region event
    string oldpassword = "";
    protected void Page_Load(object sender, EventArgs e)
    {
      if (!IsPostBack)
      {
        if (Session["Userid"] != null)
        {
          CleanUp();
        }
        else
        {
          Response.Redirect("~/login.aspx");
        }

      }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
      BindData("U");
      //ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", "alert('saved successfully')", true);
    }
    #endregion
    #region function
    private void CleanUp()
    {
      txtConfirmPassword.Text = txtNewPassword.Text = txtOldPassword.Text = String.Empty;
      btnSave.Text = "Change Password";
    }
    private void BindData(string sptype)
    {

      int UserId = Convert.ToInt32(Session["Userid"].ToString());
      getpassword(UserId);
      using (MySqlConnection con = new MySqlConnection(cs))
      {
        con.Open();
        using (MySqlCommand cmd = new MySqlCommand("usp_changepassword", con))
        {
          cmd.CommandType = CommandType.StoredProcedure;
          cmd.Parameters.AddWithValue("_UserId", UserId);
          cmd.Parameters.AddWithValue("_OldPassword", txtOldPassword.Text);
          cmd.Parameters.AddWithValue("_NewPassword", txtNewPassword.Text);
          cmd.Parameters.Add("_Result", MySqlDbType.Int32).Direction = ParameterDirection.Output;
          cmd.ExecuteNonQuery();

          if (oldpassword == txtOldPassword.Text)
          {
            if (DAL.validateInt(cmd.Parameters["_Result"].Value.ToString()) == 1)
            {
              CleanUp();
              message = "Password Changed Successfully!";
              icon = "assets/select.png";
              string script = "<script type=\"text/javascript\"> launch_toast('" + message + "','" + icon + "'); </script>";
              ClientScript.RegisterStartupScript(this.GetType(), "reportalert", script);
              //Response.Write("<script>alert('Password Changed Successfully.')</script>");
            }
          }
          else
          {
            icon = "assets/not-select-red.png";
            message = "Please Check Old Password !";
            string script = "<script type=\"text/javascript\"> launch_toast('" + message + "','" + icon + "'); </script>";
            ClientScript.RegisterStartupScript(this.GetType(), "reportalert", script);
            //Response.Write("<script>alert('Please Check Old Password.')</script>");
          }
          //FormsAuthentication.RedirectFromLoginPage(txtOldPassword.Text + " " + txtPassword.Text, false);

          //else
          //{

          //}
        }
      }
    }

    public void getpassword(int id)
    {
      int UserId = Convert.ToInt32(Session["Userid"].ToString());

      using (MySqlConnection connection = new MySqlConnection(cs))
      {
        connection.Open();
        using (MySqlCommand command = new MySqlCommand("getUserPassword", connection))
        {
          command.CommandType = CommandType.StoredProcedure;
          // Add parameters to the command
          command.Parameters.AddWithValue("_Id", UserId);
          using (MySqlDataReader reader = command.ExecuteReader())
          {
            if (reader.Read())
            {
              oldpassword = reader["user_password"].ToString();
            }
          }
          command.ExecuteNonQuery();
          connection.Close();


        }
      }
    }
    #endregion
  }
}