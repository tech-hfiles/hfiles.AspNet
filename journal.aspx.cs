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
    public partial class journal : System.Web.UI.Page
    {
        MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["signage"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnsve_Click(object sender, ImageClickEventArgs e)
        {
            ImageButton btnsave = (ImageButton)sender; // Get a reference to the clicked ImageButton
            string blogId = btnsave.CommandArgument;

            DataTable dt = new DataTable();
            MySqlParameter[] p = { new MySqlParameter("_BlogId","" ),
            new MySqlParameter("_CategoryId", "") };
            dt = DAL.ExecuteQuery("usp_addBookmark", CommandType.StoredProcedure, p);
            if(dt.Rows.Count > 0 )
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Bookmark Added Successfully')", true);
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Bookmark Not Saved')", true);
            }
        }

        protected void LbtnArticle_Click(object sender, EventArgs e)
        {
            LinkButton lnk = sender as LinkButton;
            int value = Convert.ToInt16(lnk.CommandArgument);
            GetBlogsById(value);
        }

        protected void LbtnVideo_Click(object sender, EventArgs e)
        {
            LinkButton lnk = sender as LinkButton;
            int value = Convert.ToInt16(lnk.CommandArgument);
            GetBlogsById(value);
        }

        protected void LbtnAudio_Click(object sender, EventArgs e)
        {
            LinkButton lnk = sender as LinkButton;
            int value = Convert.ToInt16(lnk.CommandArgument);
            GetBlogsById(value);
        }

        public void GetBlogsById(int Id)
        {
            //DataSet ds = null;
            //try
            //{
            //    if (con.State == ConnectionState.Closed)
            //    {
            //        con.Open();
            //    }
            //MySqlCommand cmd = new MySqlCommand("USP_GetBlogsById", con);

            DataTable dt = new DataTable();
            MySqlParameter[] p = { new MySqlParameter("CategoryId", DAL.validateInt(Id)) };
            dt = DAL.ExecuteQuery("USP_GetBlogsById", CommandType.StoredProcedure, p);

            if (dt.Rows.Count > 0)
            {
                //RepeaterVideo.DataSource = dt;
                //RepeaterVideo.DataBind();
                //RepeaterArticle.DataSource = dt;
                //RepeaterArticle.DataBind();
                //RepeaterAudio.DataSource = dt;
                //RepeaterAudio.DataBind();
                if (Id == 1)
                {
                    RepeaterArticle.DataSource = dt;
                    RepeaterArticle.DataBind();
                    RepeaterVideo.Visible = false;
                    RepeaterArticle.Visible = true;
                    RepeaterAudio.Visible = false;
                    Label msglabel = this.FindControl("Label1") as Label;

                    //msglabel.Text = "Article Data Not Available";

                }
                else if (Id == 2)
                {
                    RepeaterVideo.DataSource = dt;
                    RepeaterVideo.DataBind();
                    RepeaterVideo.Visible = true;
                    RepeaterArticle.Visible = false;
                    RepeaterAudio.Visible = false;

                }
                else
                {
                    RepeaterAudio.DataSource = dt;
                    RepeaterAudio.DataBind();
                    RepeaterVideo.Visible = false;
                    RepeaterArticle.Visible = false;
                    RepeaterAudio.Visible = true;
                }

            }
            else
            {
                Button button = this.FindControl("Button1") as Button;
                button.Text = "Save";
                Label msglabel = this.FindControl("Label1") as Label;
                msglabel.Text = "Data Not Available";
            }
            //cmd.CommandType = CommandType.StoredProcedure;
            //MySqlDataAdapter da = new MySqlDataAdapter();
            //da.SelectCommand = cmd;
            //ds = new DataSet();
            //da.Fill(ds);


        }
        //catch (Exception ex)
        //{
        //    //ds = null;
        //    throw ex;
        //}
        //finally
        //{
        //    con.Close();
        //}
        //return ds;


    }

}
