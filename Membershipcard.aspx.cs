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
    public partial class Membershipcard : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["signage"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindUserAccordion();
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
                string userPlan = row["user_plan"].ToString();
                string memberIdText = row["user_membernumber"].ToString();
                string image = masterclass.LoadMembershipCard(userNameText,bloodGroupText,emergencyContactText,expiryText,userPlan,memberIdText);
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
                    'basic' AS user_plan
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
        //public DataTable GetAllUserDetails()
        //{
        //    DataTable dt = new DataTable();
        //    List<int> userIds = new List<int>();

        //    // Step 1: Get a list of all user IDs
        //    using (MySqlConnection con = new MySqlConnection(cs))
        //    {
        //        con.Open();
        //        using (MySqlCommand cmd = new MySqlCommand("usp_getmember", con))
        //        {
        //            cmd.CommandType = CommandType.StoredProcedure;
        //            cmd.Parameters.AddWithValue("_UserId", DAL.validateInt(Session["Userid"]));
        //            cmd.Parameters.AddWithValue("_MemberId", 0);
        //            cmd.Parameters.AddWithValue("_SpType", "LS");
        //            cmd.Parameters.AddWithValue("_ReportId", 0);
        //            cmd.Parameters.AddWithValue("_RId", 0);

        //            using (MySqlDataReader reader = cmd.ExecuteReader())
        //            {
        //                while (reader.Read())
        //                {
        //                    if (Convert.ToInt32(reader["IsDependent"]) == 1 && Convert.ToInt32(reader["DependentUserId"]) == DAL.validateInt(Session["Userid"]))
        //                    {
        //                        userIds.Add(Convert.ToInt32(reader["UserId"]));
        //                    }
        //                }
        //            }
        //        }
        //    }

        //    // Step 2: Loop through each user ID and get basic details
        //    foreach (int userId in userIds)
        //    {
        //        getbasicdetails(userId);
        //    }
        //    return dt;
        //}

        //public void getbasicdetails(int id)
        //{
        //    using (MySqlConnection connection = new MySqlConnection(cs))
        //    {
        //        connection.Open();
        //        using (MySqlCommand command = new MySqlCommand("getUserDetails", connection))
        //        {
        //            command.CommandType = CommandType.StoredProcedure;
        //            command.Parameters.AddWithValue("_Id", id);

        //            using (MySqlDataReader reader = command.ExecuteReader())
        //            {
        //                while (reader.Read())
        //                {
        //                    string userName = reader["UserName"].ToString();
        //                    string email = reader["Email"].ToString();
        //                    string role = reader["Role"].ToString();

        //                    // Process user details (example: print or store)
        //                    Console.WriteLine($"User ID: {id}, Name: {userName}, Email: {email}, Role: {role}");
        //                }
        //            }
        //        }
        //    }
        //}


        
    }
}