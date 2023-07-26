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
                //AdditionalDiv.Visible = true;
                //medicalHistoryDiv.Visible = false;
                //BindData("R");
            }
        }
        //protected void btnSave_Click(object sender, EventArgs e)
        //{
        //  if (DAL.validateInt(hfId.Value) > 0)
        //  {
        //    if (fuBanner.HasFile)
        //    {
        //      img = Guid.NewGuid().ToString().Replace("-", "") + Path.GetExtension(fuBanner.PostedFile.FileName);
        //      fuBanner.SaveAs(Server.MapPath("~/upload/banner/" + img));
        //    }
        //    else
        //      img = imgBanner.ToolTip;
        //    BindData("U");
        //  }
        //  else
        //  {
        //    if (fuBanner.HasFile)
        //    {
        //      img = Guid.NewGuid().ToString().Replace("-", "") + Path.GetExtension(fuBanner.PostedFile.FileName);
        //      fuBanner.SaveAs(Server.MapPath("~/upload/banner/" + img));
        //    }
        //    BindData("C");
        //  }
        //  CleanUp();
        //  BindData("R");
        //  ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", "alert('saved successfully')", true);
        //}
        //protected void lbtnEdit_Click(object sender, EventArgs e)
        //{
        //  LinkButton lnk = sender as LinkButton;
        //  hfId.Value = lnk.CommandArgument;
        //  BindData("E");
        //  btnSave.Text = "Update Banner";
        //}
        //protected void lbtnDelete_Click(object sender, EventArgs e)
        //{
        //  LinkButton lnk = sender as LinkButton;
        //  hfId.Value = lnk.CommandArgument;
        //  BindData("D");
        //  BindData("R");
        //}
        //#endregion
        //#region function

        //private void Category()
        //{
        //  MySqlParameter[] p = { new MySqlParameter("_type", 1) };
        //  DataTable dt = DAL.ExecuteQuery("usp_bindcategory", CommandType.StoredProcedure, p);
        //  ddlCategory.DataSource = dt;
        //  ddlCategory.DataTextField = "CategoryName";
        //  ddlCategory.DataValueField = "CategoryId";
        //  ddlCategory.DataBind();
        //  ddlCategory.Items.Insert(0, new ListItem("Select Category", "0"));
        //}
        //private void CleanUp()
        //{
        //  imgBanner.ToolTip = txtDescription.Text = txtTitle.Text = txtUrl.Text = String.Empty;
        //  txtDisOrder.Text = "0";
        //  imgBanner.Visible = false;
        //  btnSave.Text = "Add Banner";
        //  ddlCategory.ClearSelection();
        //  ddlType.ClearSelection();
        //  rfvBannerimg.Enabled = true;
        //}
        //private void BindData(string sptype)
        //{
        //  using (MySqlConnection con = new MySqlConnection(cs))
        //  {
        //    con.Open();
        //    using (MySqlCommand cmd = new MySqlCommand("usp_banner", con))
        //    {
        //      cmd.CommandType = CommandType.StoredProcedure;
        //      cmd.Parameters.AddWithValue("_Id", aa.validateInt(hfId.Value));
        //      cmd.Parameters.AddWithValue("_Banner", img);
        //      cmd.Parameters.AddWithValue("_DisOrder", aa.validateInt(txtDisOrder.Text));
        //      cmd.Parameters.AddWithValue("_Url", txtUrl.Text);
        //      cmd.Parameters.AddWithValue("_Title", txtTitle.Text);
        //      cmd.Parameters.AddWithValue("_Description", txtDescription.Text);
        //      cmd.Parameters.AddWithValue("_IsMobile", DAL.validateInt(ddlType.SelectedValue));
        //      cmd.Parameters.AddWithValue("_CategoryId", DAL.validateInt(ddlCategory.SelectedValue));
        //      cmd.Parameters.AddWithValue("_SpType", sptype);
        //      cmd.Parameters.Add("_Result", MySqlDbType.Int32).Direction = ParameterDirection.Output;
        //      if (sptype.Equals("C") || sptype.Equals("U") || sptype.Equals("D"))
        //      {
        //        cmd.ExecuteNonQuery();
        //        if (sptype.Equals("C") || sptype.Equals("U"))
        //          hfId.Value = cmd.Parameters["_Result"].Value.ToString();
        //      }
        //      else if (sptype.Equals("R"))
        //      {
        //        MySqlDataAdapter da = new MySqlDataAdapter(cmd);
        //        DataTable dt = new DataTable();
        //        da.Fill(dt);
        //        rptBanner.DataSource = dt;
        //        rptBanner.DataBind();
        //      }
        //      else if (sptype.Equals("E"))
        //      {
        //        MySqlDataReader dr = cmd.ExecuteReader();
        //        if (dr.Read())
        //        {
        //          if (dr["Banner"] != DBNull.Value)
        //          {
        //            imgBanner.Visible = true;
        //            imgBanner.ToolTip = dr["Banner"].ToString();
        //            imgBanner.ImageUrl = "~/upload/banner/" + dr["Banner"].ToString();
        //            rfvBannerimg.Enabled = false;
        //          }
        //          txtDisOrder.Text = dr["DisOrder"].ToString();
        //          txtUrl.Text = dr["Url"].ToString();
        //          txtTitle.Text = dr["Title"].ToString();
        //          txtDescription.Text = dr["Description"].ToString();
        //          ddlCategory.SelectedValue = dr["CategoryId"].ToString();
        //          ddlType.SelectedValue = dr["IsMobile"].ToString();
        //        }
        //      }
        //    }
        //  }
        //}
        //#endregion
    }
}