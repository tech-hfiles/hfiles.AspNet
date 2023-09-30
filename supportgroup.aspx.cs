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

        protected void v_pills_home_tab_Click(object sender, EventArgs e)
        {
            LinkButton lbtn = (LinkButton)(sender);
            //h1HeadingLatestQuestion.InnerHtml = lbtn.Text;
            int CatId = DAL.validateInt(lbtn.CommandArgument.ToString());
            lbtn_GetClickedCategoryData(CatId);
        }
        protected void lbtn_GetClickedCategoryData(int CatId)
        {
            using (MySqlConnection connection = new MySqlConnection(cs))
            {
                using (MySqlCommand cmd = new MySqlCommand("getquestionandrelatedpost", connection))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("_CatId", CatId);
                    connection.Open();

                    using (MySqlDataAdapter sda = new MySqlDataAdapter(cmd))
                    {
                        DataSet ds = new DataSet();
                        sda.Fill(ds);
                        if (ds.Tables.Count > 1)
                        {
                            DataTable dtpost = new DataTable();
                            dtpost = ds.Tables[0];
                            if (dtpost != null && dtpost.Rows.Count > 0)
                            {
                                h1HeadingLatestQuestion.InnerHtml = dtpost.Rows[0]["Content"].ToString();
                                hfPostId.Value = dtpost.Rows[0]["PostId"].ToString();
                                hfDiscussionId.Value = dtpost.Rows[0]["DiscussionId"].ToString();
                            }
                            else
                            {
                                h1HeadingLatestQuestion.InnerHtml = "";
                                hfPostId.Value = "0";
                                hfDiscussionId.Value = "0";
                            }

                            DataTable dtforumpost = new DataTable();
                            dtforumpost = ds.Tables[1];
                            if (dtforumpost != null && dtforumpost.Rows.Count > 0)
                            {
                                RepeaterPosts.DataSource = dtforumpost;
                                RepeaterPosts.DataBind();
                            }
                            else
                            {
                                RepeaterPosts.DataSource = null;
                                RepeaterPosts.DataBind();
                            }
                        }
                        else
                        {
                            h1HeadingLatestQuestion.InnerHtml = "";
                            RepeaterPosts.DataSource = null;
                            RepeaterPosts.DataBind();

                            h1HeadingLatestQuestion.InnerHtml = "";
                            hfPostId.Value = "0";
                            hfDiscussionId.Value = "0";
                        }
                    }
                }
            }

        }
        protected void submitImageButton_Click(object sender, ImageClickEventArgs e)
        {
            int user_id = Convert.ToInt32(Session["Userid"]); // You would typically get this from the user's session
            string postText = TextBoxPost.Text;
            int PostId = DAL.validateInt(hfPostId.Value);
            int DiscussionId = DAL.validateInt(hfDiscussionId.Value);
            using (MySqlConnection connection = new MySqlConnection(cs))
            {
                using (MySqlCommand cmd = new MySqlCommand("insert_forum_post", connection))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@_post_id", PostId);// Convert.ToInt32(Session["postid"]));
                    cmd.Parameters.AddWithValue("@_user_id", user_id);
                    cmd.Parameters.AddWithValue("@_Posttext", postText);
                    cmd.Parameters.AddWithValue("@_type", "C");

                    connection.Open();
                    cmd.ExecuteNonQuery();
                    TextBoxPost.Text = "";
                }
            }
            int CatId = DAL.validateInt(hfDiscussionId.Value);
            lbtn_GetClickedCategoryData(CatId);
            //BindForumPosts();

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