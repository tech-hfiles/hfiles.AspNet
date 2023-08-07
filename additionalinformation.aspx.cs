using MySql.Data.MySqlClient;
using System;
using System.Configuration;
using System.Data;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hfiles
{
  public partial class additionalinformation : System.Web.UI.Page
  {
    #region variable
    string cs = ConfigurationManager.ConnectionStrings["signage"].ConnectionString, img, ext;

    
    #endregion
    //#region event
    protected void Page_Load(object sender, EventArgs e)
    {
      if (!IsPostBack)
      {
        //Response.Write("<script>alert('Data saved successfully.')</script>");
        //AdditionalDiv.Visible = true;
        //medicalHistoryDiv.Visible = false;
        //BindData("R");
      }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
      try
      {
        addSurgery("C");
        updateUserDetails();
        clear();
        Response.Write("<script>alert('Data saved successfully.')</script>");
      }
      catch (Exception Ex)
      {

      }
    }
    private void BindData(string sptype)
    {
      //using (MySqlConnection con = new MySqlConnection(cs))
      //{
      //  con.Open();
      //  using (MySqlCommand cmd = new MySqlCommand("usp_banner", con))
      //  {
      //    cmd.CommandType = CommandType.StoredProcedure;
      //    cmd.Parameters.AddWithValue("_Id", DAL.validateInt(hfId.Value));
      //    cmd.Parameters.AddWithValue("_Banner", img);
      //    cmd.Parameters.AddWithValue("_DisOrder", aa.validateInt(txtDisOrder.Text));
      //    cmd.Parameters.AddWithValue("_Url", txtUrl.Text);
      //    cmd.Parameters.AddWithValue("_Title", txtTitle.Text);
      //    cmd.Parameters.AddWithValue("_Description", txtDescription.Text);
      //    cmd.Parameters.AddWithValue("_IsMobile", DAL.validateInt(ddlType.SelectedValue));
      //    cmd.Parameters.AddWithValue("_CategoryId", DAL.validateInt(ddlCategory.SelectedValue));
      //    cmd.Parameters.AddWithValue("_SpType", sptype);
      //    cmd.Parameters.Add("_Result", MySqlDbType.Int32).Direction = ParameterDirection.Output;
      //    if (sptype.Equals("C") || sptype.Equals("U") || sptype.Equals("D"))
      //    {
      //      cmd.ExecuteNonQuery();
      //      if (sptype.Equals("C") || sptype.Equals("U"))
      //        hfId.Value = cmd.Parameters["_Result"].Value.ToString();
      //    }
      //    else if (sptype.Equals("R"))
      //    {
      //      MySqlDataAdapter da = new MySqlDataAdapter(cmd);
      //      DataTable dt = new DataTable();
      //      da.Fill(dt);
      //      rptBanner.DataSource = dt;
      //      rptBanner.DataBind();
      //    }
      //    else if (sptype.Equals("E"))
      //    {
      //      MySqlDataReader dr = cmd.ExecuteReader();
      //      if (dr.Read())
      //      {
      //        if (dr["Banner"] != DBNull.Value)
      //        {
      //          imgBanner.Visible = true;
      //          imgBanner.ToolTip = dr["Banner"].ToString();
      //          imgBanner.ImageUrl = "~/upload/banner/" + dr["Banner"].ToString();
      //          rfvBannerimg.Enabled = false;
      //        }
      //        txtDisOrder.Text = dr["DisOrder"].ToString();
      //        txtUrl.Text = dr["Url"].ToString();
      //        txtTitle.Text = dr["Title"].ToString();
      //        txtDescription.Text = dr["Description"].ToString();
      //        ddlCategory.SelectedValue = dr["CategoryId"].ToString();
      //        ddlType.SelectedValue = dr["IsMobile"].ToString();
      //      }
      //    }
      //  }
      //}
    }

    private void addSurgery(string sptype)
    {
      using (MySqlConnection con = new MySqlConnection(cs))
      {
        con.Open();
        using (MySqlCommand cmd = new MySqlCommand("adduser_surgery", con))
        {
          cmd.CommandType = CommandType.StoredProcedure;
          cmd.Parameters.AddWithValue("_user_id", DAL.validateInt(1)); //Session["Userid"];
          cmd.Parameters.AddWithValue("_user_surgery_details", txtSurgeries.Value);
          cmd.Parameters.AddWithValue("_user_surgery_year", yearpicker1.SelectedValue);
          cmd.Parameters.AddWithValue("_SpType", sptype);
          cmd.Parameters.Add("_Result", MySqlDbType.Int32).Direction = ParameterDirection.Output;
          if (sptype.Equals("C") || sptype.Equals("U") || sptype.Equals("D"))
          {
            cmd.ExecuteNonQuery();
            //if (sptype.Equals("C") || sptype.Equals("U"))
            // hfId.Value = cmd.Parameters["_Result"].Value.ToString();
          }

        }
      }
    }

    private void updateUserDetails()
    {
      using (MySqlConnection con = new MySqlConnection(cs))
      {
        con.Open();
        using (MySqlCommand cmd = new MySqlCommand("updateuser", con))
        {
          cmd.CommandType = CommandType.StoredProcedure;
          cmd.Parameters.AddWithValue("_user_id", DAL.validateInt(1)); //Session["Userid"];
          cmd.Parameters.AddWithValue("_user_height", heightfeetTextBox.Value + "." + heightinchTextBox.Value);
          cmd.Parameters.AddWithValue("_user_weight", weightTextBox.Value);
          cmd.Parameters.AddWithValue("_user_smoke", hfDoyouSmoke.Value);
          cmd.Parameters.AddWithValue("_user_alcohol", hfDoyouConsumeAlcohol.Value);
          cmd.ExecuteNonQuery();
          //if (sptype.Equals("C") || sptype.Equals("U"))
          // hfId.Value = cmd.Parameters["_Result"].Value.ToString();
        }
      }
    }
    protected void clear()
    {
      heightfeetTextBox.Value = heightinchTextBox.Value = weightTextBox.Value = hfDoyouSmoke.Value = hfDoyouConsumeAlcohol.Value = txtSurgeries.Value = yearpicker1.SelectedValue = String.Empty;
      yearpicker1.ClearSelection();

    }
    //#endregion
  }
}