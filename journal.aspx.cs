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

        protected void LbtnArticle_Click(object sender, EventArgs e)
        {
           LinkButton lnk =sender as LinkButton;
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
          try
          {
            if (con.State == ConnectionState.Closed)
            {
              con.Open();
            }
            MySqlCommand cmd = new MySqlCommand("USP_GetBlogsById", con);
            cmd.CommandType = CommandType.StoredProcedure;
        //MySqlDataAdapter da = new MySqlDataAdapter();
        //da.SelectCommand = cmd;
        //ds = new DataSet();
        //da.Fill(ds);
        RepeaterVideo.DataSource= cmd.ExecuteReader();
        RepeaterVideo.DataBind();
        RepeaterArticle.DataSource = cmd.ExecuteReader();
        RepeaterArticle.DataBind();
        RepeaterAudio.DataSource = cmd.ExecuteReader();
        RepeaterAudio.DataBind();
      }
          catch (Exception ex)
          {
            //ds = null;
            throw ex;
          }
          finally
          {
            con.Close();
          }
          //return ds;


    }
    
  }
}