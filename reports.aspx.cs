using MySql.Data.MySqlClient;
using Org.BouncyCastle.Utilities;
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
                if (Request.QueryString["rid"] != null)
                {
                    int RId = DAL.validateInt(Request.QueryString["rid"]);
                    if (RId > 0)
                    {
                        //int UserId = DAL.validateInt(Session["Userid"].ToString());
                        int UserId = int.Parse(Session["Userid"].ToString());
                        Reports(UserId, RId);
                    }
                }
                //Session[""];
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
                            //tcount.InnerHtml = dt.Rows.Count.ToString();
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

                            //ddlReports.DataSource = dt;
                            //ddlReports.DataTextField = "Name";
                            //ddlReports.DataValueField = "Id";
                            //ddlReports.DataBind();

                            //ddlReports.Items.Insert(0, new ListItem("Select Report", "0"));
                        }
                        else
                        {
                            //ddlReports.Items.Insert(0, new ListItem("No Reports", "0"));
                        }

                    }
                }

            }
            catch (Exception Ex)
            {


            }
        }

        protected void SearchInput_TextChanged(object sender, EventArgs e)
        {
            int RId = DAL.validateInt(Request.QueryString["rid"]);
            DataTable dt;

            try
            {
                using (MySqlConnection con = new MySqlConnection(cs))
                {
                    con.Open();
                    using (MySqlCommand cmd = new MySqlCommand("usp_addreport", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("_UserId", DAL.validateInt(Session["Userid"].ToString()));
                        cmd.Parameters.AddWithValue("_reportname", "");
                        cmd.Parameters.AddWithValue("_reporturl", "");
                        cmd.Parameters.AddWithValue("_reportId", DAL.validateInt(RId));
                        cmd.Parameters.AddWithValue("_SpType", "R");
                        cmd.Parameters.AddWithValue("_Result", SqlDbType.Int);
                        cmd.Parameters["_Result"].Direction = ParameterDirection.Output;
                        MySqlDataAdapter da = new MySqlDataAdapter(cmd);
                        dt = new DataTable();
                        da.Fill(dt);
                        if (dt != null && dt.Rows.Count > 0)
                        {
                            //tcount.InnerHtml = dt.Rows.Count.ToString();
                            string searchTerm = SearchInput.Text;

                            // Filter the DataTable based on the search term.
                            DataTable filteredData = new DataTable();
                            filteredData = dt.Clone(); // Clone the structure of the original DataTable.

                            foreach (DataRow row in dt.Rows)
                            {
                                if (row["reportname"].ToString().Contains(searchTerm))
                                {
                                    filteredData.ImportRow(row);
                                }
                            }

                            // Bind the filtered DataTable to the Repeater.
                            rptReports.DataSource = filteredData;
                            rptReports.DataBind();
                        }
                        else
                        {
                            rptReports.DataSource = dt;
                            rptReports.DataBind();
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
