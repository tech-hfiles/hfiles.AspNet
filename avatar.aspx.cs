using MySql.Data.MySqlClient;
using MySqlX.XDevAPI.Common;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hfiles
{
    public partial class avatar : System.Web.UI.Page
    {
        #region Variable
        string cs = ConfigurationManager.ConnectionStrings["signage"].ConnectionString;
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
           
            if (!IsPostBack)
            {
                getReports();
            }
        }

        protected void lbtnAddReport_Click(object sender, EventArgs e)
        {
            mp1.Show();
        }
        protected void okLinkButton_Click(object sender, EventArgs e)
        {
            mp1.Hide();
        }

        protected void getReports()
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

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string reporturl = "", Extension1, fileName1, dt1;

            if (imageFileUpload1.HasFile)
            {
                Extension1 = Path.GetExtension(imageFileUpload1.PostedFile.FileName);
                fileName1 = Path.GetFileName(imageFileUpload1.PostedFile.FileName);
                dt1 = DateTime.Now.ToString("MM_dd_yyyy_hh_mm_ss_fff");
                imageFileUpload1.PostedFile.SaveAs(Server.MapPath("~/upload/report/") + txtReportName.Text.Trim().ToString().Replace("'", "").Replace(" ", "").Replace("+", "_").Replace("/", "_").Replace("(", "").Replace(")", "").Replace("&", "_") + dt1 + Extension1);
                reporturl = txtReportName.Text.Trim().ToString().Replace("'", "").Replace(" ", "").Replace("+", "_").Replace("/", "_").Replace("(", "").Replace(")", "").Replace("&", "_") + dt1 + Extension1;
            }

            int UserId = DAL.validateInt(1); //DAL.validateInt(Session[""]);
            string reportname = txtReportName.Text;
            int reportId = DAL.validateInt(ddlReports.SelectedValue);
            int msg = AddReport(UserId, reportname, reporturl, reportId);

            if (msg > 0)
            {
                lblMsg.Text = "Report added successfully";
                clear();
            }
            else
            {
                lblMsg.Text = "some error occured, please try again.";
            }
        }

        protected void clear()
        {
            txtReportName.Text = string.Empty;
            ddlReports.ClearSelection();
        }
        public int AddReport(int UserId, string reportname, string reporturl, int reportId)
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
                        cmd.Parameters.AddWithValue("_UserId", UserId);
                        cmd.Parameters.AddWithValue("_reportname", reportname);
                        cmd.Parameters.AddWithValue("_reporturl", reporturl); 
                        cmd.Parameters.AddWithValue("_reportId", reportId);
                        cmd.Parameters.AddWithValue("_SpType", "C");
                        cmd.Parameters.AddWithValue("_Result", SqlDbType.Int);
                        cmd.Parameters["_Result"].Direction = ParameterDirection.Output;
                        cmd.ExecuteNonQuery();
                        int retVal = Convert.ToInt32(cmd.Parameters["_Result"].Value);
                        result = DAL.validateInt(retVal);
                    }
                }
            }
            catch (Exception Ex)
            {
                result = 0;
            }
            return result;
        }
    }
}