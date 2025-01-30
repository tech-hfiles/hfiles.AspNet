using Google.Protobuf.WellKnownTypes;
using Microsoft.Graph.Models;
using MySql.Data.MySqlClient;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Web;
using System.Web.Services;
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
                    if (hdnAccordionIndex != null)
                    {
                        hdnAccordionIndex.Value = "0"; // Default value to avoid null
                    }
                    //medicalHistoryDiv.Visible = true;
                    //AdditionalDiv.Visible = true;
                    //AllergiesDiv.Visible = true;
                    disease_master();
                    get_disease();
                    updateUserDetails("E");
                    user_surgery();
                    allergy_master();
                    get_user_allergy();
                    int currentYear = DateTime.Now.Year;
                    for (int i = currentYear; i >= currentYear - 70; i--)
                    {
                        yearpicker.Items.Add(new System.Web.UI.WebControls.ListItem(i.ToString(), i.ToString()));
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
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "toastr.success('Record Inserted Successfully')", true);
                Response.Write("Dashboard.aspx");
            }
            catch (Exception Ex)
            {

            }
        }
        protected void btnUpdateAdditional_Click(object sender, EventArgs e)// for updating height weight
        {
            //AdditionalDiv.Visible = false;
            //allergy_master();
            //get_user_allergy();
            updateUserDetails("U");
            //addSurgery("C");
            //clear();
            //medicalHistoryDiv.Visible = false;
            //AllergiesDiv.Visible = true;
            //Page.ClientScript.RegisterStartupScript(this.GetType(), "allergyfooter", "allergyfooter()", true);
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "toastr.success('Additional Details Updated Successfully')", true);
        }
        protected void btnMedicalHistory_Click(object sender, EventArgs e)
        {
            //Update User Details
            addUpdateDisease();

            //Fetch User Details for Edit and Display
            //updateUserDetails("E");
            //user_surgery();
            //AdditionalDiv.Visible = true;
            //medicalHistoryDiv.Visible = false;
            //AllergiesDiv.Visible = false;
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "toastr.success('Medical Details Updated Successfully')", true);
        }
        protected void btnMedicalBack_Click(object sender, EventArgs e)
        {
            updateUserDetails("E");
            //AdditionalDiv.Visible = true;
            //medicalHistoryDiv.Visible = false;
            //AllergiesDiv.Visible = false;
        }
        protected void btnAdditionalBack_Click(object sender, EventArgs e)
        {
            updateUserDetails("E");
            //AdditionalDiv.Visible = false;
            //medicalHistoryDiv.Visible = true;
            //AllergiesDiv.Visible = false;
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
            //AdditionalDiv.Visible = true;
            //medicalHistoryDiv.Visible = false;
            //AllergiesDiv.Visible = false;
        }
        protected void btnSaveAllergy_Click(object sender, EventArgs e)
        {
            

            addUpdateAllergy();
            //Response.Redirect("Dashboard.aspx");
        }
        protected void btnSaveAllInfo_Click(object sender, EventArgs e)
        {
            addUpdateDisease();
            updateUserDetails("U");
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
            txtSurgeries.Value = "";
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
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "toastr.success('Allergy Details Updated Successfully')", true);
                    }
                }


            }
        }

        [System.Web.Services.WebMethod]
        public static void SaveFamilyPrescription(List<FamilyPrescription> data)
        {
            MedicalHistory med = new MedicalHistory();
            med.AddUpdateFamilyPrescription(data);
            //Testing
        }

        private void AddUpdateFamilyPrescription(List<FamilyPrescription> prescriptions)
        {
            
            
            using (var connection = new MySqlConnection(cs))
            {
                connection.Open();

                foreach (var prescription in prescriptions)
                {
                    // Call stored procedure for each prescription record
                    var command = new MySqlCommand("InsertOrUpdateUserFamilyPrescription", connection);
                    command.CommandType = CommandType.StoredProcedure;
                    var Id = Convert.ToInt32((prescription.Id != "") ? prescription.Id : "0");
                    command.Parameters.AddWithValue("_Id", Id);
                    command.Parameters.AddWithValue("_MemberId", Convert.ToInt32(prescription.MemberId));
                    command.Parameters.AddWithValue("_Conditions", prescription.Condition);
                    command.Parameters.AddWithValue("_Medication", prescription.Medication);
                    command.Parameters.AddWithValue("_Power", prescription.Power);
                    command.Parameters.AddWithValue("_Dosage", prescription.Dosage);
                    command.Parameters.AddWithValue("_Timings", prescription.Timings);
                    command.Parameters.AddWithValue("_UserId", DAL.validateInt(Session["Userid"]));

                    command.ExecuteNonQuery();
                }
            }

        }

        [System.Web.Services.WebMethod]
        public static void RemoveFamilyPrescription(string recordId)
        {
            MedicalHistory med = new MedicalHistory();
            med.DeleteFamilyPrescription(Convert.ToInt32(recordId));
            //Testing
        }


        protected string DeleteFamilyPrescription(int recordId)
        {
            using (MySqlConnection conn = new MySqlConnection(cs))
            {
                conn.Open();
                string query = "DELETE FROM user_familyprescription WHERE Id = @id";
                using (MySqlCommand cmd = new MySqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@id", recordId);
                    int rowsAffected = cmd.ExecuteNonQuery();
                }
            }
            return "Success";
        }
        [System.Web.Services.WebMethod]
        public static string GetFamilyPrescriptions()
        {
            // Assuming you cannot access `Session` in a static context
            // The caller should pass the `UserId` if needed, or refactor accordingly.
            return new MedicalHistory().FetchUserFamilyPrescription();
        }

        private string FetchUserFamilyPrescription()
        {
            DataTable dt = new DataTable();

            try
            {
                using (var connection = new MySqlConnection(cs))
                {
                    connection.Open();
                    using (var cmd = new MySqlCommand("GetFamilyPrescriptions", connection))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@_UserId", DAL.validateInt(Session["Userid"]));

                        using (var reader = cmd.ExecuteReader())
                        {
                            dt.Load(reader); // Load data into DataTable from the MySqlDataReader
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                // Log the exception if required
                Response.Write("Error : " + ex.Message);
                //return JsonConvert.SerializeObject(new { Error = ex.Message });
            }

            // Convert DataTable to JSON and return
            return JsonConvert.SerializeObject(dt);
        }
        [System.Web.Services.WebMethod]
        public static string GetUserMembers()
        {
            return new MedicalHistory().user_members();
        }
        [System.Web.Services.WebMethod]
        public static string GetCondionList()
        {
            return new MedicalHistory().getConditionList();
        }
        protected string user_members()
        {
            DataTable dt = new DataTable();
            using (MySqlConnection con = new MySqlConnection(cs))
            {
                con.Open();
                using (MySqlCommand cmd = new MySqlCommand("usp_getmember", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("_UserId", DAL.validateInt(Session["Userid"])); //Session["Userid"];
                    cmd.Parameters.AddWithValue("_MemberId", 0); //Session["Userid"];
                    cmd.Parameters.AddWithValue("_SpType", "LS"); //Session["Userid"];
                    cmd.Parameters.AddWithValue("_ReportId", 0); //Session["Userid"];
                    cmd.Parameters.AddWithValue("_RId", 0); //Session["Userid"];
                                                            // cmd.Parameters.AddWithValue("_AccessMappingId", 0); //Session["Userid"];
                    using (var reader = cmd.ExecuteReader())
                    {
                        dt.Load(reader); // Load data into DataTable from the MySqlDataReader
                    }
                }
            }
            return JsonConvert.SerializeObject(dt);
        }

        protected string getConditionList()
        {
            DataTable dt = new DataTable();
            using (MySqlConnection con = new MySqlConnection(cs))
            {
                con.Open(); // Open the database connection

                string query = "SELECT Id, ConditionName FROM condition_master";

                using (MySqlCommand cmd = new MySqlCommand(query, con))
                {
                    // Create a MySqlDataAdapter to fill the DataTable
                    using (MySqlDataAdapter adapter = new MySqlDataAdapter(cmd))
                    {
                        adapter.Fill(dt); // Fill the DataTable with the results
                    }
                }
            }
            return JsonConvert.SerializeObject(dt);
        }

        #endregion
    }
    public class FamilyPrescription
    {
        public string Id { get; set; }
        public string MemberId { get; set; }
        public string Member { get; set; }
        public string Condition { get; set; }
        public string Medication { get; set; }
        public string Power { get; set; }
        public string Dosage { get; set; }
        public string Timings { get; set; }
    }
    
}