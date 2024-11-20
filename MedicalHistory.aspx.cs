using Google.Protobuf.WellKnownTypes;
using MySql.Data.MySqlClient;
using System;
using System.Configuration;
using System.Data;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hfiles
{
    public partial class MedicalHistory : System.Web.UI.Page
    {
        #region variable
        string cs = ConfigurationManager.ConnectionStrings["signage"].ConnectionString, img, ext;

        #endregion

        #region Events

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Userid"] != null)
            {
                if (!IsPostBack)
                {
                    medicalHistoryDiv.Visible = true;
                    AdditionalDiv.Visible = false;
                    AllergiesDiv.Visible = false;
                    disease_master();
                    get_disease();
                  
                    int currentYear = DateTime.Now.Year;
                    for (int i = currentYear; i >= currentYear - 70; i--)
                    {
                        yearpicker.Items.Add(new ListItem(i.ToString(), i.ToString()));
                    }
                }
            }
            else
            {
                Response.Redirect("~/login.aspx");
            }

        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                addSurgery("C");
                clear();
                Response.Write("<script>alert('Data saved successfully.')</script>");
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Inserted Successfully')", true);
                Response.Write("Dashboard.aspx");
            }
            catch (Exception Ex)
            {

            }
        }
        protected void btnUpdateAdditional_Click(object sender, EventArgs e)// for updating height weight
        {
            AdditionalDiv.Visible = false;
            allergy_master();
            get_user_allergy();
            updateUserDetails("U");
            //addSurgery("C");
            clear();
            medicalHistoryDiv.Visible = false;
            AllergiesDiv.Visible = true;
             //Page.ClientScript.RegisterStartupScript(this.GetType(), "allergyfooter", "allergyfooter()", true);
        }
        protected void btnMedicalHistory_Click(object sender, EventArgs e)
        {
            addUpdateDisease(); 
            updateUserDetails("E");
            user_surgery();
            AdditionalDiv.Visible = true;
            medicalHistoryDiv.Visible = false;
            AllergiesDiv.Visible = false;
        }
        protected void btnMedicalBack_Click(object sender, EventArgs e)
        {
            updateUserDetails("E");
            AdditionalDiv.Visible = true;
            medicalHistoryDiv.Visible = false;
            AllergiesDiv.Visible = false;
        }
        protected void btnAdditionalBack_Click(object sender, EventArgs e)
        {
            updateUserDetails("E");
            AdditionalDiv.Visible = false;
            medicalHistoryDiv.Visible = true;
            AllergiesDiv.Visible = false;
        }
        private void updateUserDetails(string sptype)
        {
            using (MySqlConnection con = new MySqlConnection(cs))
            {
                con.Open();
                using (MySqlCommand cmd = new MySqlCommand("updateuser", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("_user_id", DAL.validateInt(Session["Userid"])); //Session["Userid"];
                    cmd.Parameters.AddWithValue("_user_height", DAL.validateDouble(heightfeetTextBox.Value + "." + heightinchTextBox.Value));
                    cmd.Parameters.AddWithValue("_user_weight", DAL.validateDouble(weightTextBox.Value));
                    cmd.Parameters.AddWithValue("_user_smoke", DAL.validateInt(hfDoyouSmoke.Value));
                    cmd.Parameters.AddWithValue("_user_alcohol", DAL.validateInt(hfDoyouConsumeAlcohol.Value));
                    cmd.Parameters.AddWithValue("_spType", sptype);
                    if (sptype.Equals("C") || sptype.Equals("U"))
                    {
                        cmd.ExecuteNonQuery();
                    }
                    else if (sptype.Equals("E"))
                    {
                        MySqlDataReader dr = cmd.ExecuteReader();
                        if (dr.Read())
                        {
                            if (dr["user_height"].ToString().Contains("."))
                            {
                                heightfeetTextBox.Value = dr["user_height"].ToString() != string.Empty ? dr["user_height"].ToString().Split('.')[0] : "";
                                heightinchTextBox.Value = dr["user_height"].ToString() != string.Empty ? dr["user_height"].ToString().Split('.')[1] : "";
                            }
                            else
                            {
                                heightfeetTextBox.Value = dr["user_height"].ToString() != string.Empty ? dr["user_height"].ToString() : "";
                                heightinchTextBox.Value = "0";

                            }
                            weightTextBox.Value = dr["user_weight"].ToString();
                            hfDoyouSmoke.Value = dr["user_smoke"].ToString();

                            if (DAL.validateInt(hfDoyouSmoke.Value) == 0)
                            {
                                smoke_no.Checked = true;
                            }
                            else if (DAL.validateInt(hfDoyouSmoke.Value) == 1)
                            {
                                smoke_yes.Checked = true;
                            }
                            else
                            {
                                //smoke_occasionally.Checked = true;
                            }

                            string Nickname = Request.Form["inpNickname"];
                            hfDoyouConsumeAlcohol.Value = dr["user_alcohol"].ToString();
                            if (DAL.validateInt(hfDoyouConsumeAlcohol.Value) == 0)
                            {
                                alcohol_no.Checked = true;
                            }
                            else if (DAL.validateInt(hfDoyouConsumeAlcohol.Value) == 1)
                            {
                                alcohol_yes.Checked = true;
                            }
                            else
                            {
                                //alcohol_occasionally.Checked = true;
                            }
                            //txtSurgeries.Value = dr["user_alcohol"].ToString();
                        }
                    }
                }
            }
        }
        protected void btnAllergyBack_Click(object sender, EventArgs e)
        {
            AdditionalDiv.Visible = true;
            medicalHistoryDiv.Visible = false;
            AllergiesDiv.Visible = false;
        }
        protected void btnSaveAllergy_Click(object sender, EventArgs e)
        {
            addUpdateAllergy();
            Response.Redirect("Dashboard.aspx");
        }


        #endregion

        #region functions
        protected void clear()
        {
            //  heightfeetTextBox.Value = heightinchTextBox.Value = weightTextBox.Value = hfDoyouSmoke.Value = hfDoyouConsumeAlcohol.Value = txtSurgeries.Value = yearpicker.SelectedValue = String.Empty;
            // yearpicker.ClearSelection();

        }

        protected void disease_master()
        {
            using (MySqlConnection con = new MySqlConnection(cs))
            {
                con.Open();
                using (MySqlCommand cmd = new MySqlCommand("get_disease_master", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    MySqlDataAdapter da = new MySqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    rptDisease.DataSource = dt;
                    rptDisease.DataBind();


                }
            }
        }
        protected void allergy_master()
        {
            using (MySqlConnection con = new MySqlConnection(cs))
            {
                con.Open();
                using (MySqlCommand cmd = new MySqlCommand("get_allergy_master", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    MySqlDataAdapter da = new MySqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    rptAllergy.DataSource = dt;
                    rptAllergy.DataBind();


                }
            }
        }
        protected void get_disease()
        {

            using (MySqlConnection con = new MySqlConnection(cs))
            {
                con.Open();
                using (MySqlCommand cmd = new MySqlCommand("get_user_disease", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("_user_id", DAL.validateInt(Session["Userid"])); //Session["Userid"];
                    MySqlDataAdapter da = new MySqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);



                    foreach (RepeaterItem item in rptDisease.Items)
                    {
                        for (int i = 0; i < dt.Rows.Count; i++)
                        {
                            HiddenField hfDiseaseId = item.FindControl("hfdisease_id") as HiddenField;
                            if (hfDiseaseId.Value == dt.Rows[i]["disease_id"].ToString())
                            {
                                CheckBoxList cbl = item.FindControl("cbl") as CheckBoxList;
                                if (dt.Rows[i]["user_self"].ToString() == "1")
                                {
                                    cbl.Items.FindByValue("1").Selected = true;
                                }

                                if (dt.Rows[i]["user_mother"].ToString() == "1")
                                {
                                    cbl.Items.FindByValue("2").Selected = true;
                                }

                                if (dt.Rows[i]["user_father"].ToString() == "1")
                                {
                                    cbl.Items.FindByValue("3").Selected = true;
                                }
                            }

                            //int my = 0;
                            //int fa = 0;
                            //int mo = 0;

                            //cbl.SelectedValue = dr["user_self"].ToString() == "1" ? "1" : "0";
                            //cbl.SelectedValue = dr["user_mother"].ToString() == "1" ? "2" : "0";
                            //cbl.SelectedValue = dr["user_father"].ToString() == "1" ? "3" : "0";


                        }
                    }
                }
            }
        }
        protected void get_user_allergy()
        {

            using (MySqlConnection con = new MySqlConnection(cs))
            {
                con.Open();
                using (MySqlCommand cmd = new MySqlCommand("get_user_allergy", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("_user_id", DAL.validateInt(Session["Userid"])); //Session["Userid"];
                    MySqlDataAdapter da = new MySqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);



                    foreach (RepeaterItem item in rptAllergy.Items)
                    {
                        for (int i = 0; i < dt.Rows.Count; i++)
                        {
                            HiddenField hfallergy_id = item.FindControl("hfallergy_id") as HiddenField;
                            if (hfallergy_id.Value == dt.Rows[i]["allergy_id"].ToString())
                            {
                                RadioButtonList rbl = item.FindControl("rblAllergy") as RadioButtonList;
                                rbl.Items.FindByValue(dt.Rows[i]["yesNo"].ToString()).Selected = true;
                            }
                        }
                    }
                }
            }
        }
        protected void user_surgery()
        {
            using (MySqlConnection con = new MySqlConnection(cs))
            {
                con.Open();
                using (MySqlCommand cmd = new MySqlCommand("get_user_surgery", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("_user_id", DAL.validateInt(Session["Userid"])); //Session["Userid"];
                    MySqlDataAdapter da = new MySqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    surgeryGridView.DataSource = dt;
                    surgeryGridView.DataBind();
                    //if (dt.Rows.Count > 0)
                    //{
                    //    txtSurgeries.Value = dt.Rows[0]["user_surgery_details"].ToString();
                    //    yearpicker1.SelectedValue = dt.Rows[0]["user_surgery_year"].ToString();
                    //}
                }
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
            int surgeryId = Convert.ToInt32(Session["SurgeryId"]);
            using (MySqlConnection con = new MySqlConnection(cs))
            {
                con.Open();
                using (MySqlCommand cmd = new MySqlCommand("adduser_surgery", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("_user_id", DAL.validateInt(Session["Userid"])); //Session["Userid"];
                    cmd.Parameters.AddWithValue("_user_surgery_id", surgeryId); //Session["Userid"];
                    cmd.Parameters.AddWithValue("_user_surgery_details", txtSurgeries.Value);
                    cmd.Parameters.AddWithValue("_user_surgery_year", yearpicker.SelectedItem.ToString());
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

        protected void addsurgeryButton_Click(object sender, EventArgs e)
        {
            addSurgery("C");
            user_surgery();

        }

        protected void surgeryGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

        }

        protected void lRemoveBtn_Click1(object sender, EventArgs e)
        {
            //LinkButton lRemoveBtn = (LinkButton)(sender);
            ImageButton lRemoveBtn = (ImageButton)sender; // Get a reference to the clicked ImageButton

            string commandArgument = lRemoveBtn.CommandArgument;
            Session["SurgeryId"] = commandArgument;
            addSurgery("D");
            user_surgery();
        }

        private void addUpdateDisease()
        {
            foreach (RepeaterItem item in rptDisease.Items)
            {
                HiddenField hfDiseaseId = item.FindControl("hfdisease_id") as HiddenField;
                CheckBoxList cbl = item.FindControl("cbl") as CheckBoxList;
                int my = 0;
                int fa = 0;
                int mo = 0;

                if (cbl.Items[0].Selected)
                {
                    my = 1;
                }
                if (cbl.Items[1].Selected)
                {
                    fa = 1;
                }
                if (cbl.Items[2].Selected)
                {
                    mo = 1;
                }

                using (MySqlConnection con = new MySqlConnection(cs))
                {
                    con.Open();
                    using (MySqlCommand cmd = new MySqlCommand("add_update_disease", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("_user_id", DAL.validateInt(Session["Userid"])); //Session["Userid"];
                        cmd.Parameters.AddWithValue("_disease_id", DAL.validateInt(hfDiseaseId.Value));
                        cmd.Parameters.AddWithValue("_user_self", my);
                        cmd.Parameters.AddWithValue("_user_mother", fa);
                        cmd.Parameters.AddWithValue("_user_father", mo);
                        cmd.ExecuteNonQuery();
                    }
                }

            }
        }

        private void addUpdateAllergy()
        {
            //Response.Write("<script>alert('Data inserted successfully')</script>");
            foreach (RepeaterItem item in rptAllergy.Items)
            {
                HiddenField hfallergy_id = item.FindControl("hfallergy_id") as HiddenField;
                RadioButtonList rbl = item.FindControl("rblAllergy") as RadioButtonList;

                int value_ = 0;
                if (rbl.SelectedItem != null)
                {
                    if (DAL.validateInt(rbl.SelectedItem.Value) == 1)
                    {
                        value_ = 1;
                    }
                }


                using (MySqlConnection con = new MySqlConnection(cs))
                {
                    con.Open();
                    using (MySqlCommand cmd = new MySqlCommand("add_update_allergy", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("_user_id", DAL.validateInt(Session["Userid"])); //Session["Userid"];
                        cmd.Parameters.AddWithValue("_allergy_id", DAL.validateInt(hfallergy_id.Value));
                        cmd.Parameters.AddWithValue("_yesNo", DAL.validateInt(value_));
                        cmd.ExecuteNonQuery();
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Inserted Successfully')", true);
                    }
                }


            }
        }
        #endregion
    }
}