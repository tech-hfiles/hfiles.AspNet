using Google.Protobuf.WellKnownTypes;
using MySql.Data.MySqlClient;
using MySqlX.XDevAPI.Common;
using Org.BouncyCastle.Cms;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.EnterpriseServices;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hfiles
{
  public partial class journal : System.Web.UI.Page
  {

    #region Variable
    string cs = ConfigurationManager.ConnectionStrings["signage"].ConnectionString;
    #endregion
    MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["signage"].ConnectionString);
    string userId;
    
    protected void Page_Load(object sender, EventArgs e)
    {
      //userId = Session["user_membernumber"].ToString();
     
      if (!IsPostBack)
      {
        hfIsBookmarked.Value = "0";
        btnBookmarked.Visible = true;
        btnNotBookmarked.Visible = false;
        if (Session["Userid"] is null)
        {
          Response.Redirect("~/samanta.aspx");
        }
        else
        {
          GetBlogsById(1);
        }

      }
      //BindRepeaterArticle();
    }
    //protected void btnsave_Click(object sender, ImageClickEventArgs e)
    //{
    //  userId = Session["Userid"].ToString();

    //  try
    //  {
    //    ImageButton btnsave = (ImageButton)sender; // Get a reference to the clicked ImageButton

    //    string commandArgument = btnsave.CommandArgument;
    //    string[] values = commandArgument.Split('|');

    //    if (values.Length == 2)
    //    {
    //      LinkButton lnk = sender as LinkButton;
    //      int value = Convert.ToInt32(lnk.CommandArgument);
    //      GetBlogsById(value);
    //      string blogId = values[0];
    //      string categoryId = values[1];

    //      DataTable dt = new DataTable();
    //      MySqlParameter[] p = { new MySqlParameter("_BlogId","" ),
    //        new MySqlParameter("_CategoryId", "") };
    //      dt = DAL.ExecuteQuery("usp_addBookmark", CommandType.StoredProcedure, p);
    //      if (dt.Rows.Count > 0)
    //      {
    //        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Bookmark Added Successfully')", true);
    //      }
    //      else
    //      {
    //        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Bookmark Not Saved')", true);
    //      }
    //    }
    //  }
    //  catch (Exception ex)
    //  {
    //  }
    //}
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

    private void Blogs(int blogid)
    {
      int id = Convert.ToInt32(Request.QueryString["blogid"]);
      if (id == 37)
      {
        Response.Redirect("blogDetails5.html");
      }
      else if
     (id == 38)
      {
        Response.Redirect("blogDetails1.html");
      }
      else if
      (id == 39)
      {
        Response.Redirect("blogDetails2.html");
      }
      else if
      (id == 40)
      {
        Response.Redirect("blogDetails3.html");
      }
      else if
      (id == 41)
      {
        Response.Redirect("blogDetails4.html");
      }

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
      MySqlParameter[] p = {
        new MySqlParameter("_CategoryId", DAL.validateInt(Id)) ,
        new MySqlParameter("Isbookmarked", DAL.validateInt(hfIsBookmarked.Value))
      };
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
          int bid = Convert.ToInt32(Request.QueryString["blogid"]);
          Blogs(bid);

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
        if (Id == 1)
        {
          RepeaterArticle.DataSource = null;
          RepeaterArticle.DataBind();
          RepeaterVideo.Visible = false;
          RepeaterArticle.Visible = true;
          RepeaterAudio.Visible = false;
          Label msglabel = this.FindControl("Label1") as Label;


          //msglabel.Text = "Article Data Not Available";

        }
        else if (Id == 2)
        {
          RepeaterVideo.DataSource = null;
          RepeaterVideo.DataBind();
          RepeaterVideo.Visible = true;
          RepeaterArticle.Visible = false;
          RepeaterAudio.Visible = false;

        }
        else
        {
          RepeaterAudio.DataSource = null;
          RepeaterAudio.DataBind();
          RepeaterVideo.Visible = false;
          RepeaterArticle.Visible = false;
          RepeaterAudio.Visible = true;
        }

        Label1.Text = "Data Not Available";
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



    protected void lbRemove_Command(object sender, CommandEventArgs e)
    {
      Response.Redirect("samanta.aspx");

    }



    protected void btnsave_Click(object sender, ImageClickEventArgs e)
    {
      userId = Session["Userid"].ToString();

      try
      {
        ImageButton btnsave = (ImageButton)sender; // Get a reference to the clicked ImageButton

        string commandArgument = btnsave.CommandArgument;
        string[] values = commandArgument.Split('|');

        if (values.Length == 2)
        {
          string blogId = values[0];
          string categoryId = values[1];

          int result = 0;
          using (MySqlConnection con = new MySqlConnection(cs))
          {
            con.Open();
            using (MySqlCommand cmd = new MySqlCommand("usp_addBookmark", con))
            {
              cmd.CommandType = CommandType.StoredProcedure;
              cmd.Parameters.AddWithValue("_BlogId", blogId);
              cmd.Parameters.AddWithValue("_CategoryId", categoryId);
              cmd.Parameters.AddWithValue("_UserId", userId);
              cmd.Parameters.Add("_Result", MySqlDbType.Int32).Direction = ParameterDirection.Output;
              cmd.ExecuteNonQuery();
              result = DAL.validateInt(cmd.Parameters["_Result"].Value.ToString());
              if (result == 1)
              {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Bookmark Added Successfully')", true);
              }
              else if (result == 2)
              {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Bookmark Removed Successfully')", true);

              }
              GetBlogsById(DAL.validateInt(categoryId));
              //Response.Redirect("~/journal.aspx");
            }

          }
        }
      }
      catch (Exception ex)
      {

      }
    }

    protected void btnBookmarked_Click(object sender, ImageClickEventArgs e)
    {
      hfIsBookmarked.Value = "1";
      btnBookmarked.Visible = false;
      btnNotBookmarked.Visible = true;
      GetBlogsById(1);
    }

    protected void btnNotBookmarked_Click(object sender, ImageClickEventArgs e)
    {
      hfIsBookmarked.Value = "0";
      btnBookmarked.Visible = true;
      btnNotBookmarked.Visible = false;
      GetBlogsById(1);
    }
  }
}