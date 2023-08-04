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
    public partial class reports : System.Web.UI.Page
    {
        #region Variable
        string cs = ConfigurationManager.ConnectionStrings["signage"].ConnectionString;
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                getReportMaster();
                //Reports(1); //Session[""];
            }
        }

        public void Reports(int UserId, int reportId)
        {
            int result = 0;
            try
            {
                using (MySqlConnection con = new MySqlConnection(cs))
                {
                    con.Open();
                    using (MySqlCommand cmd = new MySqlCommand("usp_addreport", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("_UserId", DAL.validateInt(UserId));
                        cmd.Parameters.AddWithValue("_reportname", "");
                        cmd.Parameters.AddWithValue("_reporturl", "");
                        cmd.Parameters.AddWithValue("_reportId", DAL.validateInt(reportId));
                        cmd.Parameters.AddWithValue("_SpType", "R");
                        cmd.Parameters.AddWithValue("_Result", SqlDbType.Int);
                        cmd.Parameters["_Result"].Direction = ParameterDirection.Output;
                        MySqlDataAdapter da = new MySqlDataAdapter(cmd);
                        DataTable dt = new DataTable();
                        da.Fill(dt);
                        if (dt != null && dt.Rows.Count > 0)
                        {
                            rptReports.DataSource = dt;
                            rptReports.DataBind();
                        }
                        else
                        {
                            rptReports.DataSource = null;
                            rptReports.DataBind();
                        }
                    }
                }
            }
            catch (Exception Ex)
            {
            }
        }

        protected void ddlReports_SelectedIndexChanged(object sender, EventArgs e)
        {
            int UserId = 1;
            int reportId = DAL.validateInt(ddlReports.SelectedValue);
            Reports(UserId, reportId);
        }

        protected void getReportMaster()
        {
            try
            {
                using (MySqlConnection con = new MySqlConnection(cs))
                {
                    con.Open();
                    using (MySqlCommand cmd = new MySqlCommand("usp_getreportmaster", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.ExecuteNonQuery();

                        MySqlDataAdapter da = new MySqlDataAdapter(cmd);
                        DataTable dt = new DataTable();
                        da.Fill(dt);
                        if (dt != null && dt.Rows.Count > 0)
                        {

                            ddlReports.DataSource = dt;
                            ddlReports.DataTextField = "Name";
                            ddlReports.DataValueField = "Id";
                            ddlReports.DataBind();

                            ddlReports.Items.Insert(0, new ListItem("Select Report", "0"));
                        }
                        else
                        {
                            ddlReports.Items.Insert(0, new ListItem("No Reports", "0"));
                        }

                    }
                }

            }
            catch (Exception Ex)
            {


            }
        }
    }
}