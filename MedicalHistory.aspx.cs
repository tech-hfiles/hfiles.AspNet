using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SqlClient;
using Microsoft.Graph.Models;
using System.Globalization;
using Newtonsoft.Json;
using System.IO;
using Microsoft.Graph.Models.Security;
using System.Drawing;
using System.Web.UI.HtmlControls;


namespace hfiles
{
    public partial class MedicalHistory : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["signage"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] == null)
            {
                Response.Redirect("~/Login.aspx");
                return;
            }


            int UserId = DAL.validateInt(Session["UserID"].ToString());

            if (!IsPostBack)
            {
                //BindAllergyMedicationDropdown();
                getMembersList();

                updateUserDetails("E");
                updateUserDetailsM("E");
                BindDiseaseRepeater();
                //BindGrid();
                BindSurgeryHistory(UserId);

                btndisease.Attributes["onclick"] = "return validateInput('" + txtdiseaseName.ClientID + "', 'errorDisease');";
                btnmedication.Attributes["onclick"] = "return validateInput('" + txtMedicationName.ClientID + "', 'errorMedication');";
                btnAddAllergy.Attributes["onclick"] = "return validateInput('" + txtAllergyName.ClientID + "', 'errorAllergy');";

                dateajax.EndDate = DateTime.Now.AddDays(0);

            }
        }
        protected void getMembersList()
        {
            if (Session["UserID"] != null)
            {
                int UserId = DAL.validateInt(Session["UserID"].ToString());

                using (MySqlConnection con = new MySqlConnection(cs))
                {
                    con.Open();
                    using (MySqlCommand cmd = new MySqlCommand("GetUserAndDependentsMembers", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("userId", UserId);

                        MySqlDataAdapter da = new MySqlDataAdapter(cmd);
                        DataTable dt = new DataTable();
                        da.Fill(dt);

                        if (dt.Rows.Count > 0)
                        {
                            DropDownfordesktop.DataSource = dt;
                            DropDownfordesktop.DataTextField = "user_FirstName";
                            DropDownfordesktop.DataValueField = "user_Id";
                            DropDownfordesktop.DataBind();
                            DropDownformobile.DataSource = dt;
                            DropDownformobile.DataTextField = "user_FirstName";
                            DropDownformobile.DataValueField = "user_Id";
                            DropDownformobile.DataBind();

                            // Find the first user where User_Reference = 0
                            DataRow defaultRow = dt.AsEnumerable().FirstOrDefault(row => Convert.ToInt32(row["User_Reference"]) == 0);

                            if (defaultRow != null)
                            {
                                DropDownfordesktop.SelectedValue = defaultRow["user_Id"].ToString();
                                DropDownformobile.SelectedValue = defaultRow["user_Id"].ToString();
                                int selectedUserId = Convert.ToInt32(defaultRow["user_Id"]);

                                // Load details for the default selected user
                                GetUserDetails(selectedUserId);
                            }
                        }
                    }
                }
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }

        private void GetUserDetails(int userId)
        {
            using (MySqlConnection con = new MySqlConnection(cs))
            {

                con.Open();
                using (MySqlCommand cmd = new MySqlCommand("CALL GetDependentDetails(@userId)", con))
                {
                    cmd.Parameters.AddWithValue("@userId", userId);
                    using (MySqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            usernamem.Text = CultureInfo.CurrentCulture.TextInfo.ToTitleCase(reader["user_FirstName"].ToString().ToLower());

                            //usernamem.Text= reader["user_FirstName"].ToString();
                            username.Text = CultureInfo.CurrentCulture.TextInfo.ToTitleCase(reader["user_FirstName"].ToString().ToLower());  // Update Name Label
                            iblHid.Text = reader["user_membernumber"].ToString();  // Update Member ID Label

                            iblHidm.Text = reader["user_membernumber"].ToString();

                            // Fetch Image URL
                            string imageUrl = reader["user_image"].ToString();
                            string relativeImagePath = "~/upload/" + imageUrl;
                            string absoluteImagePath = Server.MapPath(relativeImagePath);

                            // If image URL is NULL or empty, check session for user image
                            if (string.IsNullOrEmpty(imageUrl) || imageUrl.Trim() == "" || !File.Exists(absoluteImagePath))
                            {

                                ProfileImage.ImageUrl = "/My Data/default-user-profile.png"; // Default image
                                ProfileImagem.ImageUrl = "/My Data/default-user-profile.png";

                            }
                            else
                            {
                                ProfileImage.ImageUrl = "~/upload/" + imageUrl;
                                ProfileImagem.ImageUrl = "~/upload/" + imageUrl;
                            }


                        }
                    }
                }
            }
        }

        protected void btnSaveSurgery_Click(object sender, EventArgs e)
        {
            string surgeryName = txtSurgeryName.Text;
            string hostname = txthostname.Text;
            string drname = txtdrname.Text;
            string surgeryDate = txtSurgeryDate.Text;


            // Get the appropriate UserId (dropdown selected or logged-in)
            int UserId;
            if (!string.IsNullOrEmpty(DropDownfordesktop.SelectedValue) && DropDownfordesktop.SelectedValue != "0")
            {
                UserId = DAL.validateInt(DropDownfordesktop.SelectedValue);
            }
            else
            {
                UserId = DAL.validateInt(Session["UserID"].ToString());
            }

            if (!string.IsNullOrEmpty(surgeryName) && !string.IsNullOrEmpty(surgeryDate))
            {
                using (MySqlConnection conn = new MySqlConnection(cs))
                {
                    string query = @"INSERT INTO user_surgery_details (user_id, user_surgery_details,hostname,drname, user_surgery_year)
                             VALUES (@user_id, @details,@hostname,@drname, @year)";

                    MySqlCommand cmd = new MySqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@user_id", UserId);
                    cmd.Parameters.AddWithValue("@details", surgeryName);
                    cmd.Parameters.AddWithValue("@hostname", hostname);
                    cmd.Parameters.AddWithValue("@drname", drname);
                    cmd.Parameters.AddWithValue("@year", surgeryDate);

                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();

                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage",
                        "toastr.options = { 'timeOut': 1000, 'extendedTimeOut': 200 };toastr.success('Surgery Details Updated Successfully')",
                        true);
                }

                // Re-bind the GridView after insert
                BindSurgeryHistory(UserId);
            }
        }

        private void BindSurgeryHistory(int userId)
        {
            using (MySqlConnection conn = new MySqlConnection(cs))
            {
                MySqlCommand cmd = new MySqlCommand("SELECT user_surgery_id, user_surgery_details, user_surgery_year,hostname,drname FROM user_surgery_details WHERE user_id = @user_id", conn);
                cmd.Parameters.AddWithValue("@user_id", userId);

                MySqlDataAdapter da = new MySqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    gvSurgeryHistory.DataSource = dt;
                    gvSurgeryHistory.DataBind();
                    SurgeryHistory.Visible = true; // Show grid when data exists
                    surgeryMessageSection.Visible = false; // Hide "No Surgeries?" message
                }
                else
                {
                    SurgeryHistory.Visible = false; // Hide grid if no data
                    surgeryMessageSection.Visible = true; // Show "No Surgeries?" message
                }
            }
        }
        protected void gvSurgeryHistory_RowDeleting1(object sender, GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(gvSurgeryHistory.DataKeys[e.RowIndex].Value);
            using (MySqlConnection conn = new MySqlConnection(cs))
            {
                MySqlCommand cmd = new MySqlCommand("DELETE FROM user_surgery_details WHERE user_surgery_id = @ID", conn);
                cmd.Parameters.AddWithValue("@ID", id);
                conn.Open();
                cmd.ExecuteNonQuery();
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage",
                "toastr.options = { timeOut: 1000, extendedTimeOut: 200 }; " +
                "toastr.success('Surgery Details Deleted Successfully'); " +
                "setTimeout(function() { window.location.href='" + ResolveUrl("MedicalHistory.aspx") + "'; }, 1000);",
                true);

            }

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
        [System.Web.Services.WebMethod]
        public static string GetCondionList()
        {
            return new MedicalHistory().getConditionList();
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

        protected void DropDownfordesktop_SelectedIndexChanged(object sender, EventArgs e)
        {
            int selectedUserId = int.Parse(DropDownfordesktop.SelectedValue);
            GetUserDetails(selectedUserId);
            updateUserDetails("E");
            BindSurgeryHistory(selectedUserId);
            get_user_allergy();
            //BindAllergyMedicationDropdown();
        }
        protected void btnUpdateAdditional_Click(object sender, EventArgs e)// for updating height weight
        {

            updateUserDetails("U");

            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "toastr.options = { 'timeOut': 1000, 'extendedTimeOut': 200 };toastr.success('Additional Details Updated Successfully')", true);
        }

        private void updateUserDetails(string sptype)
        {
            int userId;

            // Use selected user from dropdown if available, otherwise fallback to logged-in user
            if (!string.IsNullOrEmpty(DropDownfordesktop.SelectedValue) && DropDownfordesktop.SelectedValue != "0")
            {
                userId = DAL.validateInt(DropDownfordesktop.SelectedValue);
            }
            else
            {
                userId = DAL.validateInt(Session["UserID"].ToString());
            }

            using (MySqlConnection con = new MySqlConnection(cs))
            {
                con.Open();
                using (MySqlCommand cmd = new MySqlCommand("updateuser", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("_user_id", userId);
                    cmd.Parameters.AddWithValue("_user_height", DAL.validateDouble(heightfeetTextBox.Value + "." + heightinchTextBox.Value));
                    cmd.Parameters.AddWithValue("_user_weight", DAL.validateDouble(weightTextBox.Value));
                    cmd.Parameters.AddWithValue("_user_smoke", DAL.validateInt(hfDoyouSmoke.Value));
                    cmd.Parameters.AddWithValue("_user_alcohol", DAL.validateInt(hfDoyouConsumeAlcohol.Value));
                    cmd.Parameters.AddWithValue("_user_blood_group", DropDownList1.SelectedValue);
                    cmd.Parameters.AddWithValue("_spType", sptype);

                    if (sptype == "C" || sptype == "U")
                    {
                        cmd.ExecuteNonQuery();
                    }
                    else if (sptype == "E")
                    {
                        MySqlDataReader dr = cmd.ExecuteReader();
                        if (dr.Read())
                        {
                            string height = dr["user_height"]?.ToString() ?? "0";
                            if (string.IsNullOrWhiteSpace(height))
                            {
                                heightfeetTextBox.Value = "0";
                                heightinchTextBox.Value = "0";
                            }
                            else if (height.Contains("."))
                            {
                                var splitHeight = height.Split('.');
                                heightfeetTextBox.Value = splitHeight[0];
                                heightinchTextBox.Value = splitHeight.Length > 1 ? splitHeight[1] : "0";
                            }
                            else
                            {
                                heightfeetTextBox.Value = height;
                                heightinchTextBox.Value = "0";
                            }

                            string weight = dr["user_weight"]?.ToString();
                            weightTextBox.Value = string.IsNullOrWhiteSpace(weight) ? "0" : weight;
                            // weightTextBox.Value = dr["user_weight"]?.ToString() ?? "0";
                            hfDoyouSmoke.Value = dr["user_smoke"]?.ToString() ?? "0";
                            hfDoyouConsumeAlcohol.Value = dr["user_alcohol"]?.ToString() ?? "0";

                            int smokeValue = DAL.validateInt(hfDoyouSmoke.Value);
                            smoke_yes.Checked = (smokeValue == 1);
                            smoke_no.Checked = (smokeValue == 0);

                            int alcoholValue = DAL.validateInt(hfDoyouConsumeAlcohol.Value);
                            alcohol_yes.Checked = (alcoholValue == 1);
                            alcohol_no.Checked = (alcoholValue == 0);

                            // ✅ Retrieve and set blood group dropdown
                            DropDownList1.SelectedValue = dr["user_bloodgroup"]?.ToString() ?? "Select";
                        }
                    }
                }
            }
        }

        protected void btnUpdateAdditionalM_Click(object sender, EventArgs e)
        {
            updateUserDetailsM("U");

            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage",
                "toastr.options = { 'timeOut': 1000, 'extendedTimeOut': 200 };toastr.success('Additional Details Updated Successfully')", true);
        }


        private void updateUserDetailsM(string sptype)
        {
            int userId;

            // Prefer dropdown selection if available; fallback to logged-in user
            if (!string.IsNullOrEmpty(DropDownformobile.SelectedValue) && DropDownformobile.SelectedValue != "0")
            {
                userId = DAL.validateInt(DropDownformobile.SelectedValue);
            }
            else
            {
                userId = DAL.validateInt(Session["Userid"]);
            }

            using (MySqlConnection con = new MySqlConnection(cs))
            {
                con.Open();
                using (MySqlCommand cmd = new MySqlCommand("updateuser", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("_user_id", userId);
                    cmd.Parameters.AddWithValue("_user_height", DAL.validateDouble(txtheightfeet.Value + "." + txtheightinch.Value));
                    cmd.Parameters.AddWithValue("_user_weight", DAL.validateDouble(txtweight.Value));
                    cmd.Parameters.AddWithValue("_user_smoke", DAL.validateInt(hfDoyouSmokem.Value));
                    cmd.Parameters.AddWithValue("_user_alcohol", DAL.validateInt(hfDoyouConsumeAlcoholm.Value));
                    cmd.Parameters.AddWithValue("_user_blood_group", DropDownbloodgrp.SelectedValue);
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
                            // Height handling
                            string height = dr["user_height"]?.ToString() ?? "0";
                            if (height.Contains("."))
                            {
                                var splitHeight = height.Split('.');
                                txtheightfeet.Value = splitHeight[0];
                                txtheightinch.Value = splitHeight.Length > 1 ? splitHeight[1] : "0";
                            }
                            else
                            {
                                txtheightfeet.Value = height;
                                txtheightinch.Value = "0";
                            }

                            txtweight.Value = dr["user_weight"]?.ToString() ?? "";

                            // Smoking
                            hfDoyouSmokem.Value = dr["user_smoke"]?.ToString();
                            int smokeValue = DAL.validateInt(hfDoyouSmokem.Value);
                            if (smokeValue == 1)
                            {
                                rdsmoke_yes.Checked = true;
                                rdsmoke_no.Checked = false;
                            }
                            else
                            {
                                rdsmoke_yes.Checked = false;
                                rdsmoke_no.Checked = true;
                            }


                            // Alcohol
                            hfDoyouConsumeAlcoholm.Value = dr["user_alcohol"]?.ToString();
                            int alcoholValue = DAL.validateInt(hfDoyouConsumeAlcoholm.Value);
                            if (alcoholValue == 1)
                            {
                                rdalcohol_yes.Checked = true;
                                rdalcohol_no.Checked = false;
                            }
                            else
                            {
                                rdalcohol_yes.Checked = false;
                                rdalcohol_no.Checked = true;
                            }


                            DropDownbloodgrp.SelectedValue = dr["user_bloodgroup"]?.ToString() ?? "Select";
                        }
                    }

                }
            }
        }

        private void BindDiseaseRepeater()
        {
            using (MySqlConnection con = new MySqlConnection(cs))
            {
                using (MySqlCommand cmd = new MySqlCommand("SELECT disease_id, disease_name FROM disease_master", con))
                {
                    con.Open();
                    using (MySqlDataReader dr = cmd.ExecuteReader())
                    {
                        DataTable dt = new DataTable();
                        dt.Load(dr);
                        rptDisease.DataSource = dt;
                        rptDisease.DataBind();
                    }
                }
            }
        }


        protected void get_disease()
        {
            int userId;

            // Prefer dropdown selection if available; fallback to session
            if (!string.IsNullOrEmpty(DropDownfordesktop.SelectedValue) && DropDownfordesktop.SelectedValue != "0")
            {
                userId = DAL.validateInt(DropDownfordesktop.SelectedValue);
            }
            else
            {
                userId = DAL.validateInt(Session["Userid"]);
            }

            using (MySqlConnection con = new MySqlConnection(cs))
            {
                con.Open();
                using (MySqlCommand cmd = new MySqlCommand("get_user_disease", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("_user_id", userId);

                    MySqlDataAdapter da = new MySqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    foreach (RepeaterItem item in rptDisease.Items)
                    {
                        HiddenField hfDiseaseId = item.FindControl("hfdisease_id") as HiddenField;

                        // Get current checkboxes
                        CheckBox chkSelf = item.FindControl("chkSelf") as CheckBox;
                        CheckBox chkMother = item.FindControl("chkMother") as CheckBox;
                        CheckBox chkFather = item.FindControl("chkFather") as CheckBox;

                        if (hfDiseaseId != null && chkSelf != null && chkMother != null && chkFather != null)
                        {
                            for (int i = 0; i < dt.Rows.Count; i++)
                            {
                                if (hfDiseaseId.Value == dt.Rows[i]["disease_id"].ToString())
                                {
                                    chkSelf.Checked = dt.Rows[i]["user_self"].ToString() == "1";
                                    chkMother.Checked = dt.Rows[i]["user_mother"].ToString() == "1";
                                    chkFather.Checked = dt.Rows[i]["user_father"].ToString() == "1";
                                    break;
                                }
                            }
                        }
                    }
                }
            }
        }

        protected void disease_master()
        {
            int userId;

            // Get user ID from dropdown or fallback to session
            if (!string.IsNullOrEmpty(DropDownfordesktop.SelectedValue) && DropDownfordesktop.SelectedValue != "0")
            {
                userId = DAL.validateInt(DropDownfordesktop.SelectedValue);
            }
            else
            {
                userId = DAL.validateInt(Session["UserID"].ToString());
            }

            using (MySqlConnection con = new MySqlConnection(cs))
            {
                con.Open();
                using (MySqlCommand cmd = new MySqlCommand("get_disease_master", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@in_user_id", userId); // <-- pass the parameter

                    MySqlDataAdapter da = new MySqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    rptDisease.DataSource = dt;
                    rptDisease.DataBind();
                }
            }
        }

        protected void btnMedicalHistory_Click(object sender, EventArgs e)
        {

            addUpdateDisease();


            ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "togglePopup(true);", true);
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "toastr.success('Medical Details Updated Successfully')", true);
        }



        private void addUpdateDisease()
        {
            // Determine the UserId based on dropdown or session
            int userId;
            if (!string.IsNullOrEmpty(DropDownfordesktop.SelectedValue) && DropDownfordesktop.SelectedValue != "0")
            {
                userId = DAL.validateInt(DropDownfordesktop.SelectedValue);
            }
            else
            {
                userId = DAL.validateInt(Session["UserID"].ToString());
            }

            foreach (RepeaterItem item in rptDisease.Items)
            {
                HiddenField hfDiseaseId = item.FindControl("hfdisease_id") as HiddenField;
                CheckBox chkSelf = item.FindControl("chkSelf") as CheckBox;
                CheckBox chkMother = item.FindControl("chkMother") as CheckBox;
                CheckBox chkFather = item.FindControl("chkFather") as CheckBox;

                if (hfDiseaseId != null && chkSelf != null && chkMother != null && chkFather != null)
                {
                    int my = chkSelf.Checked ? 1 : 0;
                    int mo = chkMother.Checked ? 1 : 0;
                    int fa = chkFather.Checked ? 1 : 0;

                    using (MySqlConnection con = new MySqlConnection(cs))
                    {
                        con.Open();
                        using (MySqlCommand cmd = new MySqlCommand("add_update_disease", con))
                        {
                            cmd.CommandType = CommandType.StoredProcedure;
                            cmd.Parameters.AddWithValue("_user_id", userId);
                            cmd.Parameters.AddWithValue("_disease_id", DAL.validateInt(hfDiseaseId.Value));
                            cmd.Parameters.AddWithValue("_user_self", my);
                            cmd.Parameters.AddWithValue("_user_mother", mo);
                            cmd.Parameters.AddWithValue("_user_father", fa);
                            cmd.ExecuteNonQuery();
                        }
                    }
                }
            }

            // Optional: Display success message
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage",
                "toastr.success('Disease Details Updated Successfully')", true);
        }

        protected void openAllergy1Modal_Click(object sender, EventArgs e)
        {


            allergy_master();
            get_user_allergy();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "showModalScript", "showModal();", true);
            //Response.Redirect("Dashboard.aspx");
        }

        protected void allergy_master()
        {
            int userId;

            // Get user ID from dropdown or fallback to session
            if (!string.IsNullOrEmpty(DropDownfordesktop.SelectedValue) && DropDownfordesktop.SelectedValue != "0")
            {
                userId = DAL.validateInt(DropDownfordesktop.SelectedValue);
            }
            else
            {
                userId = DAL.validateInt(Session["UserID"].ToString());
            }

            using (MySqlConnection con = new MySqlConnection(cs))
            {
                con.Open();
                using (MySqlCommand cmd = new MySqlCommand("get_allergy_master", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@in_user_id", userId); // Pass user ID to SP

                    MySqlDataAdapter da = new MySqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    rptAllergy.DataSource = dt;
                    rptAllergy.DataBind();

                    // Optionally bind allergy medication dropdown here if needed
                    // BindAllergyMedicationDropdown();
                }
            }
        }

        protected void get_user_allergy()
        {
            int userId;

            // Use dropdown selection if available, else fallback to session
            if (!string.IsNullOrEmpty(DropDownfordesktop.SelectedValue) && DropDownfordesktop.SelectedValue != "0")
            {
                userId = DAL.validateInt(DropDownfordesktop.SelectedValue);
            }
            else
            {
                userId = DAL.validateInt(Session["Userid"]);
            }

            using (MySqlConnection con = new MySqlConnection(cs))
            {
                con.Open();
                using (MySqlCommand cmd = new MySqlCommand("get_user_allergy", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("_user_id", userId);

                    MySqlDataAdapter da = new MySqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    // Step 1: Default all to "No"
                    foreach (RepeaterItem item in rptAllergy.Items)
                    {
                        RadioButton rdoYes = item.FindControl("rdoYes") as RadioButton;
                        RadioButton rdoNo = item.FindControl("rdoNo") as RadioButton;

                        if (rdoYes != null) rdoYes.Checked = false;
                        if (rdoNo != null) rdoNo.Checked = true;
                    }

                    // Step 2: Override with data from DB if available
                    foreach (RepeaterItem item in rptAllergy.Items)
                    {
                        HiddenField hfallergy_id = item.FindControl("hfallergy_id") as HiddenField;

                        if (hfallergy_id != null)
                        {
                            DataRow[] rows = dt.Select($"allergy_id = '{hfallergy_id.Value}'");
                            if (rows.Length > 0)
                            {
                                string yesNo = rows[0]["yesNo"].ToString();
                                RadioButton rdoYes = item.FindControl("rdoYes") as RadioButton;
                                RadioButton rdoNo = item.FindControl("rdoNo") as RadioButton;

                                if (yesNo == "1")
                                {
                                    if (rdoYes != null) rdoYes.Checked = true;
                                    if (rdoNo != null) rdoNo.Checked = false;
                                }
                                else if (yesNo == "0")
                                {
                                    if (rdoYes != null) rdoYes.Checked = false;
                                    if (rdoNo != null) rdoNo.Checked = true;
                                }
                            }
                        }
                    }
                }
            }

        }

        protected void btnSaveAllergy_Click(object sender, EventArgs e)
        {


            addUpdateAllergy();

        }

        private void addUpdateAllergy()
        {
            // Determine the UserId based on dropdown or session
            int userId;
            if (!string.IsNullOrEmpty(DropDownfordesktop.SelectedValue) && DropDownfordesktop.SelectedValue != "0")
            {
                userId = DAL.validateInt(DropDownfordesktop.SelectedValue);
            }
            else
            {
                userId = DAL.validateInt(Session["UserID"].ToString());
            }

            foreach (RepeaterItem item in rptAllergy.Items)
            {
                HiddenField hfallergy_id = item.FindControl("hfallergy_id") as HiddenField;
                RadioButton rdoYes = item.FindControl("rdoYes") as RadioButton;
                RadioButton rdoNo = item.FindControl("rdoNo") as RadioButton;

                int value_ = -1; // Default to -1 (meaning not selected)

                if (rdoYes != null && rdoYes.Checked)
                {
                    value_ = 1;
                }
                else if (rdoNo != null && rdoNo.Checked)
                {
                    value_ = 0;
                }

                if (value_ != -1)
                {
                    using (MySqlConnection con = new MySqlConnection(cs))
                    {
                        con.Open();
                        using (MySqlCommand cmd = new MySqlCommand("add_update_allergy", con))
                        {
                            cmd.CommandType = CommandType.StoredProcedure;
                            cmd.Parameters.AddWithValue("_user_id", userId);
                            cmd.Parameters.AddWithValue("_allergy_id", DAL.validateInt(hfallergy_id.Value));
                            cmd.Parameters.AddWithValue("_yesNo", DAL.validateInt(value_));
                            cmd.ExecuteNonQuery();
                        }
                    }
                }
            }

            // Show success message once after loop
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage",
                "toastr.success('Allergy Details Updated Successfully')", true);
        }

        protected void btnmedical_Click(object sender, EventArgs e)
        {
            disease_master();
            get_disease();

            ScriptManager.RegisterStartupScript(this, this.GetType(), "showModalScript", "showModal1();", true);
        }



        protected void btnSaveSurgerygrid_Click(object sender, EventArgs e)
        {
            string surgeryName = txtSurgeryName1.Text;
            string hostname = txthostname1.Text;
            string drname = txtdrname1.Text;
            string surgeryDate = txtSurgeryDate1.Text;


            // Determine the UserId based on dropdown or session
            int UserId;
            if (!string.IsNullOrEmpty(DropDownfordesktop.SelectedValue) && DropDownfordesktop.SelectedValue != "0")
            {
                UserId = DAL.validateInt(DropDownfordesktop.SelectedValue);
            }
            else
            {
                UserId = DAL.validateInt(Session["UserID"].ToString());
            }

            if (!string.IsNullOrEmpty(surgeryName) && !string.IsNullOrEmpty(surgeryDate))
            {
                using (MySqlConnection conn = new MySqlConnection(cs))
                {
                    string query = @"INSERT INTO user_surgery_details (user_id, user_surgery_details,hostname,drname, user_surgery_year)
                             VALUES (@user_id, @details,@hostname,@drname, @year)";

                    MySqlCommand cmd = new MySqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@user_id", UserId);
                    cmd.Parameters.AddWithValue("@details", surgeryName);
                    cmd.Parameters.AddWithValue("@hostname", hostname);
                    cmd.Parameters.AddWithValue("@drname", drname);
                    cmd.Parameters.AddWithValue("@year", surgeryDate);


                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();

                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage",
                        "toastr.options = { 'timeOut': 1000, 'extendedTimeOut': 200 };toastr.success('Surgery Details Updated Successfully')",
                        true);
                }

                // Re-bind the GridView after insert
                BindSurgeryHistory(UserId);
            }
        }


        protected void DropDownformobile_SelectedIndexChanged(object sender, EventArgs e)
        {
            int selectedUserId = int.Parse(DropDownformobile.SelectedValue);
            GetUserDetails(selectedUserId);
            updateUserDetailsM("E");
            BindSurgeryHistory(selectedUserId);
        }
        public class FamilyPrescription
        {
            public string Id { get; set; }
            public string MemberId { get; set; }
            public string Member { get; set; }
            public string Condition { get; set; }
            public string otherCondition { get; set; }
            public string Medication { get; set; }
            public string Power { get; set; }
            public string Dosage { get; set; }
            public string Timings { get; set; }
        }


        protected void rptAllergy_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                // Find controls inside the repeater item
                RadioButton rdoYes = e.Item.FindControl("rdoYes") as RadioButton;
                HiddenField hfallergy_id = e.Item.FindControl("hfallergy_id") as HiddenField;
                HiddenField hfAllergyName = e.Item.FindControl("hfAllergyName") as HiddenField;
                Panel pnlMedications = e.Item.FindControl("pnlMedications") as Panel;
                DropDownList ddl = e.Item.FindControl("AlleryMedications") as DropDownList;
                TextBox txtMedication = e.Item.FindControl("txtMedication") as TextBox;

                // Get allergy name
                string allergyName = DataBinder.Eval(e.Item.DataItem, "allergy_name").ToString().Trim().ToLower();
                HtmlGenericControl dropAArow = e.Item.FindControl("dropAArow") as HtmlGenericControl;
                // Only show medication dropdown/textarea if allergy is "medications"
                if (allergyName == "medications")
                {
                    // Show the medications panel
                    if (pnlMedications != null)
                        pnlMedications.Visible = true;

                    // Handle radio button click
                    if (rdoYes != null)
                        rdoYes.Attributes["onclick"] = "handleYesClick(this, 'medications')";

                    // Get the user ID
                    int userId = !string.IsNullOrEmpty(DropDownfordesktop.SelectedValue) && DropDownfordesktop.SelectedValue != "0"
                        ? DAL.validateInt(DropDownfordesktop.SelectedValue)
                        : DAL.validateInt(Session["UserID"].ToString());

                    // Get comma-separated medications
                    //if (txtMedication != null)
                    //{
                    using (MySqlConnection con = new MySqlConnection(cs))
                    {
                        con.Open();
                        string query = "SELECT GROUP_CONCAT(medication_name SEPARATOR ', ') AS medications FROM user_medications WHERE user_id = @userId";
                        using (MySqlCommand cmd = new MySqlCommand(query, con))
                        {
                            cmd.Parameters.AddWithValue("@userId", userId);
                            object result = cmd.ExecuteScalar();
                            if (result != DBNull.Value)
                            {
                                txtMedication.Text = result.ToString();
                            }


                        }
                    }
                    // }
                    if (dropAArow != null)
                    {
                        if (string.IsNullOrWhiteSpace(txtMedication.Text))
                            dropAArow.Visible = false;
                        else
                            dropAArow.Visible = true;
                    }
                }
                else
                {
                    // Hide panel if not medications
                    if (pnlMedications != null)
                        pnlMedications.Visible = false;
                }

                // Always assign hidden allergy ID
                if (hfallergy_id != null)
                {
                    hfallergy_id.Value = DataBinder.Eval(e.Item.DataItem, "allergy_id").ToString();
                }
            }


        }


        protected void btnmedication_Click(object sender, EventArgs e)
        {
            string medicationName = txtMedicationName.Text;

            if (!string.IsNullOrEmpty(medicationName))
            {
                int userId = 0;

                if (!string.IsNullOrEmpty(DropDownfordesktop.SelectedValue) && DropDownfordesktop.SelectedValue != "0")
                {
                    userId = DAL.validateInt(DropDownfordesktop.SelectedValue);
                }
                else
                {
                    userId = DAL.validateInt(Session["UserID"].ToString());
                }

                using (MySqlConnection con = new MySqlConnection(cs))
                {
                    con.Open();
                    using (MySqlCommand cmd = new MySqlCommand("INSERT INTO user_medications (user_id, medication_name) VALUES (@user_id, @medication_name)", con))
                    {
                        cmd.Parameters.AddWithValue("@user_id", userId);
                        cmd.Parameters.AddWithValue("@medication_name", medicationName);
                        cmd.ExecuteNonQuery();
                    }
                }

                // Optionally clear the textbox and hide popup using JS
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "toastr.success('Medication Saved Successfully')", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "emptyAlert", "toastr.error('Please enter a medication name');", true);
            }
        }

       

        protected void btndisease_Click(object sender, EventArgs e)
        {
            string diseaseName = txtdiseaseName.Text.Trim();
            int userId;

            // Determine user ID from dropdown or session
            if (!string.IsNullOrEmpty(DropDownfordesktop.SelectedValue) && DropDownfordesktop.SelectedValue != "0")
            {
                userId = DAL.validateInt(DropDownfordesktop.SelectedValue);
            }
            else
            {
                userId = DAL.validateInt(Session["UserID"].ToString());
            }

            if (!string.IsNullOrEmpty(diseaseName) && userId > 0)
            {
                using (MySqlConnection conn = new MySqlConnection(cs))
                {
                    conn.Open();

                    // Check for duplicate (case-insensitive)
                    string checkQuery = "SELECT COUNT(*) FROM disease_master WHERE LOWER(disease_name) = @DiseaseName AND user_id = @UserId";
                    using (MySqlCommand checkCmd = new MySqlCommand(checkQuery, conn))
                    {
                        checkCmd.Parameters.AddWithValue("@DiseaseName", diseaseName.ToLower());
                        checkCmd.Parameters.AddWithValue("@UserId", userId);

                        int count = Convert.ToInt32(checkCmd.ExecuteScalar());

                        if (count > 0)
                        {
                            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "toastr.error('This disease already exists.')", true);
                            return;
                        }
                    }

                    // Insert new disease
                    string query = "INSERT INTO disease_master (disease_name, user_id) VALUES (@DiseaseName, @UserId)";
                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@DiseaseName", diseaseName);
                        cmd.Parameters.AddWithValue("@UserId", userId);
                        cmd.ExecuteNonQuery();
                        //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "toastr.success('Disease Saved Successfully')", true);
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "closeModal", "toastr.success('Disease Saved Successfully'); closeModal();", true);

                    }
                }

            }
        }

        protected void btnAddAllergy_Click(object sender, EventArgs e)
        {
            string allergyName = txtAllergyName.Text.Trim();
            int userId;

            // Determine user ID from dropdown or session
            if (!string.IsNullOrEmpty(DropDownfordesktop.SelectedValue) && DropDownfordesktop.SelectedValue != "0")
            {
                userId = DAL.validateInt(DropDownfordesktop.SelectedValue);
            }
            else
            {
                userId = DAL.validateInt(Session["UserID"].ToString());
            }

            if (!string.IsNullOrEmpty(allergyName) && userId > 0)
            {
                using (MySqlConnection conn = new MySqlConnection(cs))
                {
                    conn.Open();

                    // Case-insensitive check for existing allergy
                    string checkQuery = @"
                SELECT COUNT(*) 
                FROM allergy_master 
                WHERE LOWER(allergy_name) = LOWER(@AllergyName) AND user_id = @UserId";

                    using (MySqlCommand checkCmd = new MySqlCommand(checkQuery, conn))
                    {
                        checkCmd.Parameters.AddWithValue("@AllergyName", allergyName);
                        checkCmd.Parameters.AddWithValue("@UserId", userId);
                        int count = Convert.ToInt32(checkCmd.ExecuteScalar());

                        if (count > 0)
                        {
                            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "duplicateAlert",
                                "toastr.warning('This allergy already exists')", true);
                            return;
                        }
                    }

                    // If not duplicate, insert new allergy
                    string insertQuery = "INSERT INTO allergy_master (allergy_name, user_id) VALUES (@AllergyName, @UserId)";
                    using (MySqlCommand insertCmd = new MySqlCommand(insertQuery, conn))
                    {
                        insertCmd.Parameters.AddWithValue("@AllergyName", allergyName);
                        insertCmd.Parameters.AddWithValue("@UserId", userId);
                        insertCmd.ExecuteNonQuery();

                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "successMessage",
                            "toastr.success('Allergy Saved Successfully')", true);
                    }
                }
            }
        }



        protected void btnEdit_Click(object sender, EventArgs e)
        {
            Button btn = sender as Button;
            RepeaterItem item = btn.NamingContainer as RepeaterItem;

            TextBox txtMedication = item.FindControl("txtMedication") as TextBox;

            if (txtMedication == null)
                return; // or log an error

            int userId;
            if (!string.IsNullOrEmpty(DropDownfordesktop.SelectedValue) && DropDownfordesktop.SelectedValue != "0")
            {
                userId = DAL.validateInt(DropDownfordesktop.SelectedValue);
            }
            else
            {
                userId = DAL.validateInt(Session["UserID"].ToString());
            }

            string[] medications = txtMedication.Text.Split(',')
                .Select(m => m.Trim())
                .Where(m => !string.IsNullOrWhiteSpace(m))
                .ToArray();

            using (MySqlConnection con = new MySqlConnection(cs))
            {
                con.Open();

                string deleteQuery = "DELETE FROM user_medications WHERE user_id = @userId";
                using (MySqlCommand deleteCmd = new MySqlCommand(deleteQuery, con))
                {
                    deleteCmd.Parameters.AddWithValue("@userId", userId);
                    deleteCmd.ExecuteNonQuery();
                }

                foreach (string med in medications)
                {
                    string insertQuery = "INSERT INTO user_medications (user_id, medication_name) VALUES (@userId, @medName)";
                    using (MySqlCommand insertCmd = new MySqlCommand(insertQuery, con))
                    {
                        insertCmd.Parameters.AddWithValue("@userId", userId);
                        insertCmd.Parameters.AddWithValue("@medName", med);
                        insertCmd.ExecuteNonQuery();
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "toastr.success('Medication Updated Successfully')", true);
                    }
                }
            }
        }

        //protected void btnsurgerysave_Click(object sender, EventArgs e)
        //{
        //    string surgeryName = modalSurgeryDetail.Text.Trim();
        //    string hostname = modalHospitalName.Text.Trim();
        //    string drname = modalCreatedBy.Text.Trim();
        //    string surgeryDate = modalSurgeryYear.Text.Trim();

        //    int UserId = !string.IsNullOrEmpty(DropDownfordesktop.SelectedValue) && DropDownfordesktop.SelectedValue != "0"
        //        ? DAL.validateInt(DropDownfordesktop.SelectedValue)
        //        : DAL.validateInt(Session["UserID"].ToString());

        //    if (!string.IsNullOrEmpty(surgeryName) && !string.IsNullOrEmpty(drname))
        //    {
        //        using (MySqlConnection conn = new MySqlConnection(cs))
        //        {
        //            string query = @"UPDATE user_surgery_details SET user_surgery_details = @details, hostname = @hostname,drname = @drname, 
        //                                            user_surgery_year = @year 
        //                                        WHERE  user_surgery_id = @surgery_id";


        //            MySqlCommand cmd = new MySqlCommand(query, conn);
        //            //cmd.Parameters.AddWithValue("@surgery_id", surgeryId);
        //            cmd.Parameters.AddWithValue("@user_id", UserId);
        //            cmd.Parameters.AddWithValue("@details", surgeryName);
        //            cmd.Parameters.AddWithValue("@hostname", hostname);
        //            cmd.Parameters.AddWithValue("@drname", drname);
        //            cmd.Parameters.AddWithValue("@year", surgeryDate);

        //            conn.Open();
        //            cmd.ExecuteNonQuery();
        //            conn.Close();

        //            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage",
        //                "toastr.success('Surgery Details Updated Successfully');", true);
        //        }

        //        BindSurgeryHistory(UserId);
        //    }
        //}

        protected void btnsurgerysave_Click(object sender, EventArgs e)
        {
            string surgeryName = modalSurgeryDetail.Text.Trim();
            string hostname = modalHospitalName.Text.Trim();
            string drname = modalCreatedBy.Text.Trim();
            string surgeryDate = modalSurgeryYear.Text.Trim();
            int surgeryId = DAL.validateInt(hiddenSurgeryId.Value); // Fetch the hidden surgery ID

            int UserId = !string.IsNullOrEmpty(DropDownfordesktop.SelectedValue) && DropDownfordesktop.SelectedValue != "0"
                ? DAL.validateInt(DropDownfordesktop.SelectedValue)
                : DAL.validateInt(Session["UserID"].ToString());

            if (!string.IsNullOrEmpty(surgeryName) && !string.IsNullOrEmpty(drname) && surgeryId > 0)
            {
                using (MySqlConnection conn = new MySqlConnection(cs))
                {
                    string query = @"UPDATE user_surgery_details 
                             SET user_surgery_details = @details, hostname = @hostname, drname = @drname, 
                                 user_surgery_year = @year 
                             WHERE user_surgery_id = @surgery_id";

                    MySqlCommand cmd = new MySqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@surgery_id", surgeryId);
                    cmd.Parameters.AddWithValue("@details", surgeryName);
                    cmd.Parameters.AddWithValue("@hostname", hostname);
                    cmd.Parameters.AddWithValue("@drname", drname);
                    cmd.Parameters.AddWithValue("@year", surgeryDate);

                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();

                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage",
                        "toastr.success('Surgery Details Updated Successfully');", true);
                }

                BindSurgeryHistory(UserId);
            }
        }


    }
}
