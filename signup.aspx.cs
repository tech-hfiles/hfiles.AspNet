using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Configuration;

namespace hfiles
{
    public partial class signup : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["signage"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                divSubmit.Visible = false;
                divOtp.Visible = true;
            }
        }
        public static string GenerateOTP(int length)
        {
            Random random = new Random();
            const string chars = "0123456789";
            return new string(Enumerable.Repeat(chars, length)
                .Select(s => s[random.Next(s.Length)]).ToArray());
        }

        protected void signup_Click(object sender, EventArgs e)
        {
            // Usage:
            string email = "emailTextBox.Value.ToString()";
            string otp = GenerateOTP(6); // Generate a 6-digit OTP
            string subject = "One-Time Password (OTP)";
            string body = $"Your OTP is: {otp}";

            // SendEmail(email, subject, body);


            // Create a new MySqlConnection using the connection string
            using (MySqlConnection connection = new MySqlConnection(connectionString))
            {
                // Open the database connection
                connection.Open();

                // Prepare the SQL query to insert the OTP information into the database
                string query = "INSERT INTO otp (user_id, otp_code, created_at) VALUES (@userId, @otpCode, NOW())";

                // Create a new MySqlCommand object
                using (MySqlCommand command = new MySqlCommand(query, connection))
                {
                    // Set the parameter values
                    command.Parameters.AddWithValue("@userId", emailTextBox.Value);
                    command.Parameters.AddWithValue("@otpCode", otp);

                    // Execute the SQL command
                    command.ExecuteNonQuery();
                }

                // Close the database connection
                connection.Close();
                DAL.SendCareerMail("HFiles, Registration Completed - " + DateTime.Now.ToString("dd/MM/yyyy"), "Hello your OTP is " + otp + ", ", emailTextBox.Value);
                divSubmit.Visible = true;
                divOtp.Visible = false;
            }
        }

        protected void submitButton_Click(object sender, EventArgs e)
        {
            using (MySqlConnection connection = new MySqlConnection(connectionString))
            {
                // Open the database connection
                connection.Open();

                // Prepare the SQL query to retrieve the OTP information from the database
                string query = "SELECT otp_code FROM otp WHERE user_id = @userId ORDER BY created_at DESC LIMIT 1";

                // Create a new MySqlCommand object
                using (MySqlCommand command = new MySqlCommand(query, connection))
                {
                    // Set the parameter value
                    command.Parameters.AddWithValue("@userId", emailTextBox.Value);

                    // Execute the SQL command and get the OTP code
                    string otpCodeFromDatabase = (string)command.ExecuteScalar();

                    // Compare the OTP code from the database with the user input
                    if (otpCodeFromDatabase == otpTextBox.Value)
                    {
                        // OTP is valid
                        Session["phone"] = phoneTextBox.Value;
                        Session["email"] = emailTextBox.Value;
                        Session["firstname"] = firstnameTextBox.Value;
                        Session["lastname"] = lastnameTextBox.Value;
                        errorLabel.Text = "";
                        //Details to be saved in user details table
                        Response.Redirect("addbasicdetails.aspx");
                    }
                    else
                    {
                        // OTP is invalid
                        errorLabel.Text = "Inavlid OTP, please enter the correct OTP.";
                    }
                }

                // Close the database connection
                connection.Close();
            }
        }
    }
}