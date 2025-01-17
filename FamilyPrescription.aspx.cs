using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hfiles
{
    public partial class FamilyPrescription1 : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["signage"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void user_members()
        {
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
                    MySqlDataAdapter da = new MySqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                }
            }
        }
        [System.Web.Services.WebMethod]
        public static int[] GetAccessFamilyPrescription()
        {
            FamilyPrescription1 fp = new FamilyPrescription1();
            int[] AccessMember = fp.GetAccessToArrayByUserId();
            return AccessMember;
        }
        private int[] GetAccessToArrayByUserId()
        {
            int userId = DAL.validateInt(Session["Userid"]);
            int[] accessToArray = Array.Empty<int>();

            // Define the query to fetch AccessTo for the provided UserId
            string query = @"
            SELECT AccessTo
            FROM user_prescriptionAccess
            WHERE UserId = @UserId";

            // Use MySqlConnection to interact with the MySQL database
            using (MySqlConnection con = new MySqlConnection(cs))
            {
                con.Open();
                using (MySqlCommand cmd = new MySqlCommand(query, con))
                {
                    // Add the UserId parameter
                    cmd.Parameters.AddWithValue("@UserId", userId);

                    using (MySqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            // Read the AccessTo as a string
                            string accessToString = reader["AccessTo"].ToString();

                            // Convert the string to an array of integers
                            accessToArray = accessToString.Split(',')
                                                          .Select(int.Parse)
                                                          .ToArray();
                        }
                    }
                }
            }

            return accessToArray;
        }

        [System.Web.Services.WebMethod]
        public static void SetAccessFamilyPrescription(string Access)
        {
            FamilyPrescription1 fp = new FamilyPrescription1();
            fp.SetAccessToArrayByUserId(Access);
        }
        private void SetAccessToArrayByUserId(string accessTo)
        {
            int userId = DAL.validateInt(Session["Userid"]);
            // SQL queries
            string checkQuery = "SELECT COUNT(*) FROM user_prescriptionAccess WHERE UserId = @UserId";
            string updateQuery = "UPDATE user_prescriptionAccess SET AccessTo = @AccessTo WHERE UserId = @UserId";
            string insertQuery = "INSERT INTO user_prescriptionAccess (UserId, AccessTo) VALUES (@UserId, @AccessTo)";

            using (MySqlConnection con = new MySqlConnection(cs))
            {
                con.Open();

                // Check if the UserId exists
                bool userExists;
                using (MySqlCommand checkCmd = new MySqlCommand(checkQuery, con))
                {
                    checkCmd.Parameters.AddWithValue("@UserId", userId);
                    userExists = Convert.ToInt32(checkCmd.ExecuteScalar()) > 0;
                }

                if (userExists)
                {
                    // If UserId exists, update the AccessTo
                    using (MySqlCommand updateCmd = new MySqlCommand(updateQuery, con))
                    {
                        updateCmd.Parameters.AddWithValue("@UserId", userId);
                        updateCmd.Parameters.AddWithValue("@AccessTo", accessTo);
                        updateCmd.ExecuteNonQuery();
                        Console.WriteLine("AccessTo updated successfully.");
                    }
                }
                else
                {
                    // If UserId does not exist, insert a new row
                    using (MySqlCommand insertCmd = new MySqlCommand(insertQuery, con))
                    {
                        insertCmd.Parameters.AddWithValue("@UserId", userId);
                        insertCmd.Parameters.AddWithValue("@AccessTo", accessTo);
                        insertCmd.ExecuteNonQuery();
                        Console.WriteLine("New user added and AccessTo set successfully.");
                    }
                }
            }
        }
    }
}