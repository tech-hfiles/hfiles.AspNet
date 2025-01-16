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
            user_members();
            int[] AccessMembers = GetAccessToArrayByUserId(Convert.ToInt32(Session["Userid"].ToString()));

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

        protected int[] GetAccessToArrayByUserId(int userId)
        {
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

    }
}