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
    public partial class samanta : System.Web.UI.Page
    {
        #region Variable
        string cs = ConfigurationManager.ConnectionStrings["signage"].ConnectionString;
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Userid"] != null)
                {
                    bindData(DAL.validateInt(Session["Userid"].ToString()));
                }
                else
                {
                    Response.Redirect("~/login.aspx");
                }
            }
        }

        protected void bindData(int user_id)
        {
            //usp_commonproductvariation
            //string sptype = "BIND";

            using (MySqlConnection con = new MySqlConnection(cs))
            {
                con.Open();
                using (MySqlCommand cmd = new MySqlCommand("usp_getuserdetailsbyId", con))
                {


                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("_user_id", DAL.validateInt(user_id));
                    //cmd.Parameters.AddWithValue("_SpType", sptype);
                    //cmd.Parameters.Add("_Result", MySqlDbType.Int32).Direction = ParameterDirection.Output;


                    MySqlDataAdapter da = new MySqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    if (dt != null && dt.Rows.Count > 0)
                    {
                        lblUniqueId.Text = dt.Rows[0]["user_membernumber"].ToString();
                    }
                    else
                    {
                        
                    }


                }
            }

        }
    }
}