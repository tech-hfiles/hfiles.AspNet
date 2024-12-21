using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Security.Cryptography;
using System.Text;

namespace hfiles
{
    public partial class AllReports : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["signage"].ConnectionString;


        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            

            try
            {
                using (MySqlConnection con = new MySqlConnection(cs))
                {
                    con.Open();

                    // Step 1: Fetch all user IDs and plain-text passwords
                    string fetchQuery = "SELECT user_id, user_password FROM user_details";
                    MySqlCommand fetchCmd = new MySqlCommand(fetchQuery, con);

                    using (MySqlDataReader dr = fetchCmd.ExecuteReader())
                    {
                        while (dr.Read())
                        {
                            string userId = dr["user_id"].ToString();
                            string plainPassword = dr["user_password"].ToString();

                            // Step 2: Hash the password
                            string hashedPassword = HashPassword(plainPassword);

                            // Step 3: Update the password in the database
                            UpdatePasswordInDatabase(userId, hashedPassword);
                        }
                    }
                }

                // Notify success
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "alert", "alert('Passwords hashed successfully!');", true);
            }
            catch (Exception ex)
            {
                // Handle exceptions and notify user
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "alert", $"alert('Error: {ex.Message}');", true);
            }
        }

        // Hash password using SHA256
        public string HashPassword(string password)
        {
            using (SHA256 sha256 = SHA256.Create())
            {
                byte[] hashBytes = sha256.ComputeHash(Encoding.UTF8.GetBytes(password));
                return BitConverter.ToString(hashBytes).Replace("-", "").ToLower();
            }
        }

        // Update password in the database
        private void UpdatePasswordInDatabase(string userId, string hashedPassword)
        {
          // Replace with your actual connection string

            using (MySqlConnection con = new MySqlConnection(cs))
            {
                con.Open();

                string updateQuery = "UPDATE user_details SET user_password = @hashedPassword WHERE user_id = @userId";
                MySqlCommand updateCmd = new MySqlCommand(updateQuery, con);
                updateCmd.Parameters.AddWithValue("@hashedPassword", hashedPassword);
                updateCmd.Parameters.AddWithValue("@userId", userId);

                updateCmd.ExecuteNonQuery();
            }
        }
    }
    
}