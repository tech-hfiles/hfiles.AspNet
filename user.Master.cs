using MySql.Data.MySqlClient;
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
    public partial class user : System.Web.UI.MasterPage
    {
        string connectionString = ConfigurationManager.ConnectionStrings["signage"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Userid"] is null)
            {
                if (Session["JournalPath"]!=null)
                {
                    //getbasicdetails();
                }
                else
                {
                    Response.Redirect("~/login.aspx");
                }
                //Response.Redirect("~/login.aspx");
            }
            else
            {
                //sesion user_membernumber replaced by username
                if (Session["username"] != null)
                {
                    memberLabel.Text = Session["username"].ToString();
                    memberId.Text = Session["user_membernumber"].ToString();
                    if (Session["userpic"] != null && !string.IsNullOrEmpty(Session["userpic"].ToString()))
                    {
                        profile.ImageUrl = "~/upload/" + Session["userpic"].ToString();
                    }
                    else
                    {
                        profile.ImageUrl = "../My Data/default-user-profile.png";
                    }
                        
                }
            }
            

        }

        public void getbasicdetails(int id)
        {
            using (MySqlConnection connection = new MySqlConnection(connectionString))
            {
                connection.Open();
                using (MySqlCommand command = new MySqlCommand("getUserDetails", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    // Add parameters to the command
                    command.Parameters.AddWithValue("_Id", id);
                    using (MySqlDataReader reader = command.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            profile.ImageUrl = "~/upload/" + reader["user_image"].ToString();
                        }
                    }
                    command.ExecuteNonQuery();
                    connection.Close();

                }
            }
        }
        protected void logout_Click(object sender, ImageClickEventArgs e)
        {
            Session.Clear();
            Response.Redirect("~/login.aspx");
        }

        protected void logoutImageButton_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("~/login.aspx");
        }

        protected void logoutButton_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("~/login.aspx");
        }

        protected void logoutLink_Load(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("~/login.aspx");
        }
    }
}