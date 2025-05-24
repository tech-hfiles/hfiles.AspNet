using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hfiles
{
    public partial class Membershipcard : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["signage"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindUserAccordion();
            }

            if (Session["showToastr"] != null && (bool)Session["showToastr"])
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "showToastr", "showToastr('success', 'Updated successfully');", true);
                Session["showToastr"] = null; // Clear the flag
            }

        }
        private void BindUserAccordion()
        {
            DataTable dt = GetUserDetails();
            user masterclass = new user();

            // Check if "user_image" column exists, if not, add it
            if (!dt.Columns.Contains("user_image"))
            {
                dt.Columns.Add("user_image", typeof(string));  // Add column of type string
            }

            // Loop through DataTable and update the "user_image" column
            foreach (DataRow row in dt.Rows)
            {
                string ubg = row["user_bloodgroup"].ToString();
                if (string.IsNullOrEmpty(ubg))
                {
                    ubg = "0";
                }
                int BloodGroup = Convert.ToInt32(ubg);
                string bloodGroupText = "";
                _ = masterclass.bloodGroups.TryGetValue(BloodGroup, out bloodGroupText);


                string userNameText = row["user_firstname"].ToString() + " " + row["user_lastname"].ToString();
                string emergencyContactText = row["user_icecontact"].ToString();
                string expiryText = row["user_expiry"].ToString();
                string userPlan = row["subscriptionplan_status"].ToString();
                string memberIdText = row["user_membernumber"].ToString();
                string image = masterclass.LoadMembershipCard(userNameText, bloodGroupText, emergencyContactText, expiryText, userPlan, memberIdText);
                row["user_image"] = image;
            }



            if (dt.Rows.Count > 0)
            {
                rptUsers.DataSource = dt;
                rptUsers.DataBind();
            }
        }
        public DataTable GetUserDetails()
        {
            DataTable dt = new DataTable();

            using (MySqlConnection con = new MySqlConnection(cs))
            {
                int userId = DAL.validateInt(Session["Userid"]);
                con.Open();
                string query = @"
                SELECT 
                    user_id, 
                    user_firstname, 
                    user_lastname, 
                    user_gender, 
                    user_dob, 
                    user_bloodgroup, 
                    user_state, 
                    user_city, 
                    user_country, 
                    user_contact, 
                    user_icecontact, 
                    user_relativecontact, 
                    user_email, 
                    user_relation, 
                    user_doctor, 
                    user_membernumber, 
                    user_image, 
                    c.dialingcode, 
                    '11/25' AS user_expiry, 
                    subscriptionplan_status
                FROM user_details u
                LEFT JOIN countrylist c ON u.user_country = c.countryname
                where u.user_isactive = 1 and user_reference = " + userId + ";";

                using (MySqlCommand cmd = new MySqlCommand(query, con))
                using (MySqlDataAdapter da = new MySqlDataAdapter(cmd))
                {
                    da.Fill(dt);
                }
            }

            return dt;
        }

        protected void LinkButtonEdit_Click(object sender, EventArgs e)
        {
            LinkButton editButton = (LinkButton)sender;
            string userId = editButton.CommandArgument;

            ViewState["UserId"] = userId; // Store User ID
            GetUserDetails(userId);

            //ScriptManager.RegisterStartupScript(this, this.GetType(), "showModal", "$('#exampleModal').modal('show');", true);
        }
        protected void GetUserDetails(string userId)
        {


            using (MySqlConnection connection = new MySqlConnection(cs))
            {
                connection.Open();
                string query = "SELECT user_bloodgroup, user_icecontact FROM user_details WHERE user_id =" + userId;
                using (MySqlCommand cmd = new MySqlCommand(query, connection))
                {

                    MySqlDataReader reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {

                        DropDownbloodgrp.Text = reader["user_bloodgroup"].ToString();
                        txtEmerContact.Text = reader["user_icecontact"].ToString();
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "showModal", "$('#exampleModal').modal('show');", true);

                    }

                }
            }

        }
        protected void lbtnSave_Click(object sender, EventArgs e)
        {
            try
            {
                string Bloodgrp = DropDownbloodgrp.SelectedValue;
                string Emergencyno = txtEmerContact.Text;

                string userId = ViewState["UserId"] as string;


                UpdateUserDetails(userId, Bloodgrp, Emergencyno);


                //ScriptManager.RegisterStartupScript(this, this.GetType(), "showToastr", "showToastr('success', 'Updated successfully');", true);

                Session["showToastr"] = true;
                Response.Redirect(Request.Url.AbsoluteUri);

            }
            catch (Exception ex)
            {
                // Display error message
                ScriptManager.RegisterStartupScript(this, this.GetType(), "showToastr", "showToastr('error', 'Update failed');", true);
            }
        }

        private void UpdateUserDetails(string userId, string Bloodgrp, string Emergencyno)
        {
            using (MySqlConnection con = new MySqlConnection(cs))
            {
                string query = "UPDATE user_details SET user_bloodgroup = @user_bloodgroup, user_icecontact = @user_icecontact WHERE user_id = @UserID";
                using (MySqlCommand cmd = new MySqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@UserID", userId);
                    cmd.Parameters.AddWithValue("@user_bloodgroup", Bloodgrp);
                    cmd.Parameters.AddWithValue("@user_icecontact", Emergencyno);

                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
        }




    }
}