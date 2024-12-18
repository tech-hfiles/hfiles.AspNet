using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace hfiles
{
    public partial class AllReports : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["signage"].ConnectionString;


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GridBind();
            }
        }
        public void GridBind()
        {
            int UserId = DAL.validateInt(Session["Userid"].ToString());

            MySqlConnection connection = new MySqlConnection(cs);
            connection.Open();
            MySqlCommand cmd = new MySqlCommand("USP_GetAllReports", connection);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("p_UserId", UserId);

            MySqlDataReader reader = cmd.ExecuteReader();
            GridView1.DataSource = reader;
            GridView1.DataBind();
            connection.Close();
        }

    }
}