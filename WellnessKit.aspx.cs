using MySql.Data.MySqlClient;
using System;
using System.Configuration;
using System.Data;
using System.IO;
using System.Web.UI.WebControls;

namespace hfiles
{
    public partial class Clinics : System.Web.UI.Page
    {
        #region DB
        string cs = ConfigurationManager.ConnectionStrings["signage"].ConnectionString;
        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGrid();
            }
        }

        private void BindGrid()
        {
            using (MySqlConnection conn = new MySqlConnection(cs))
            {
                string query = "SELECT id, clinic, image, address, offer, Category FROM uat_user.dental_clinics";

                MySqlDataAdapter da = new MySqlDataAdapter(query, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);

                gvClinics.DataSource = dt;
                gvClinics.DataBind();
            }
        }

        protected void gvClinics_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvClinics.PageIndex = e.NewPageIndex;
            BindGrid();
        }

        protected void gvClinics_Sorting(object sender, GridViewSortEventArgs e)
        {
            DataTable dt = (DataTable)gvClinics.DataSource;
            if (dt != null)
            {
                DataView dv = dt.DefaultView;
                dv.Sort = e.SortExpression + " " + GetSortDirection(e.SortExpression);
                gvClinics.DataSource = dv;
                gvClinics.DataBind();
            }
        }

        private string GetSortDirection(string sortExpression)
        {
            string sortDirection = "ASC";
            string lastSortExpression = ViewState["SortExpression"] as string;

            if (lastSortExpression == sortExpression)
            {
                string lastDirection = ViewState["SortDirection"] as string;
                sortDirection = lastDirection == "ASC" ? "DESC" : "ASC";
            }

            ViewState["SortExpression"] = sortExpression;
            ViewState["SortDirection"] = sortDirection;
            return sortDirection;
        }

        protected void gvClinics_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvClinics.EditIndex = e.NewEditIndex;
            BindGrid();
        }

        protected void gvClinics_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int id = Convert.ToInt32(gvClinics.DataKeys[e.RowIndex].Value);

            string clinicName = ((TextBox)gvClinics.Rows[e.RowIndex].FindControl("txtClinic")).Text;
            string address = ((TextBox)gvClinics.Rows[e.RowIndex].FindControl("txtAddress")).Text;
            string offer = ((TextBox)gvClinics.Rows[e.RowIndex].FindControl("txtOffer")).Text;

            DropDownList ddlCategory = (DropDownList)gvClinics.Rows[e.RowIndex].FindControl("ddlCategory");
            string category = ddlCategory.SelectedValue;

            FileUpload fuLogo = (FileUpload)gvClinics.Rows[e.RowIndex].FindControl("fuLogo");
            string imagePath = "";

            if (fuLogo.HasFile)
            {
                string filename = Guid.NewGuid().ToString() + Path.GetExtension(fuLogo.FileName);
                imagePath = "~/ClinicLogo/" + filename;
                fuLogo.SaveAs(Server.MapPath(imagePath));
            }
            else
            {
                using (MySqlConnection conn = new MySqlConnection(cs))
                {
                    string query = "SELECT image FROM uat_user.dental_clinics WHERE id = @id";
                    MySqlCommand cmd = new MySqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@id", id);

                    conn.Open();
                    var result = cmd.ExecuteScalar();
                    imagePath = result != DBNull.Value ? result.ToString() : "";
                    conn.Close();
                }
            }
            using (MySqlConnection conn = new MySqlConnection(cs))
            {
                string query = "UPDATE uat_user.dental_clinics SET clinic = @clinic, image = @image, address = @address, offer = @offer, Category = @category WHERE id = @id";

                MySqlCommand cmd = new MySqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@clinic", clinicName);
                cmd.Parameters.AddWithValue("@image", imagePath);
                cmd.Parameters.AddWithValue("@address", address);
                cmd.Parameters.AddWithValue("@offer", offer);
                cmd.Parameters.AddWithValue("@category", category);
                cmd.Parameters.AddWithValue("@id", id);

                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }

            gvClinics.EditIndex = -1;
            BindGrid();
        }

        protected void gvClinics_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvClinics.EditIndex = -1;
            BindGrid();
        }
    }
}
