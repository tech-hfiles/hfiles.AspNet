using AjaxControlToolkit.HTMLEditor.ToolbarButton;
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
    public partial class supportgroup : System.Web.UI.Page
    {
        #region variable
        string cs = ConfigurationManager.ConnectionStrings["signage"].ConnectionString, img, ext;

        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void submitImageButton_Click(object sender, ImageClickEventArgs e)
        {
            int user_id = Convert.ToInt32(Session["Userid"]); // You would typically get this from the user's session
            string postText = TextBoxPost.Text;

            using (MySqlConnection connection = new MySqlConnection(cs))
            {
                using (MySqlCommand cmd = new MySqlCommand("insert_forum_post", connection))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@_post_id", 1);// Convert.ToInt32(Session["postid"]));
                    cmd.Parameters.AddWithValue("@_user_id", user_id);
                    cmd.Parameters.AddWithValue("@_Posttext", postText);
                    cmd.Parameters.AddWithValue("@_type", "C");

                    connection.Open();
                    cmd.ExecuteNonQuery();
                }
            }

            BindForumPosts();

        }
        private void BindForumPosts()
        {
            using (MySqlConnection connection = new MySqlConnection(cs))
            {
                using (MySqlCommand cmd = new MySqlCommand("insert_forum_post", connection))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@_post_id", 1);// Convert.ToInt32(Session["postid"]));
                    cmd.Parameters.AddWithValue("@_user_id", 0);
                    cmd.Parameters.AddWithValue("@_Posttext", "");
                    cmd.Parameters.AddWithValue("@_type", "R");

                    connection.Open();

                    using (MySqlDataAdapter sda = new MySqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        RepeaterPosts.DataSource = dt;
                        RepeaterPosts.DataBind();
                    }
                }
            }
        }
    }
}