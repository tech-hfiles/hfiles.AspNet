using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hfiles
{
    public partial class addbasicdetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["firstname"] != null && Session["lastname"] != null && Session["email"] != null && Session["phone"] != null)
            {
                if (!IsPostBack)
                {

                    firstNameTextBox.Value = Session["firstname"].ToString();
                    lastNameTextBox.Value = Session["lastname"].ToString();
                    emailTextBox.Value = Session["email"].ToString();
                    contactTextBox.Value = Session["phone"].ToString();
                }
            }
            else
            {
                Response.Redirect("~/login.aspx");
            }
        }
        public static string GenerateId()
        {
            Random random = new Random();
            const string chars = "0123456789";
            return new string(Enumerable.Repeat(chars, 4)
                .Select(s => s[random.Next(s.Length)]).ToArray());
        }
        protected void submitButton_Click(object sender, EventArgs e)
        {
            // Generate a unique random number (you can adjust the range as needed)
            Random random = new Random();
            int randomNumber = random.Next(1000, 9999);

            // Format the date of birth in MMDDYYYY format
            string formattedDateOfBirth = Convert.ToDateTime(dobTextBox1.Value).ToString("MMddyy");

            // Take a portion of the last name (first three characters)
            string partialLastName = firstNameTextBox.Value.Substring(0, Math.Min(3, lastNameTextBox.Value.Length)).ToUpper();

            // Concatenate the components to create the membership number
            string membershipNumber = $"HF{formattedDateOfBirth}{partialLastName}{randomNumber}";

            #region variable
            string member = membershipNumber;
            string connectionString = ConfigurationManager.ConnectionStrings["signage"].ConnectionString;
            using (MySqlConnection connection = new MySqlConnection(connectionString))
            {
                using (MySqlCommand command = new MySqlCommand("adduser", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    // Add parameters to the command
                    command.Parameters.AddWithValue("_user_firstname", firstNameTextBox.Value);
                    command.Parameters.AddWithValue("_user_lastname", lastNameTextBox.Value);
                    command.Parameters.AddWithValue("_user_gender", selectgender.Value);
                    command.Parameters.AddWithValue("_user_dob", dobTextBox1.Value);
                    command.Parameters.AddWithValue("_user_bloodgroup", bloodgroup.Value);
                    command.Parameters.AddWithValue("_user_state", stateTextBox.Value);
                    command.Parameters.AddWithValue("_user_city", cityTextBox.Value);
                    command.Parameters.AddWithValue("_user_country", countryTextBox.Value);
                    command.Parameters.AddWithValue("_user_contact", contactTextBox.Value);
                    command.Parameters.AddWithValue("_user_icecontact", icecontactTextBox.Value);
                    command.Parameters.AddWithValue("_user_relativecontact", relativecontactTextBox.Value);
                    command.Parameters.AddWithValue("_user_email", emailTextBox.Value);
                    command.Parameters.AddWithValue("_user_doctor", famdocTextBox.Value);
                    command.Parameters.AddWithValue("_user_membernumber", member);
                    connection.Open();
                    command.ExecuteNonQuery();
                    connection.Close();

                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Inserted Successfully')", true);
                }
            }
            DAL.SendCareerMail("HFiles, Registration Completed - " + DateTime.Now.ToString("dd/MM/yyyy"), "Hello " + firstNameTextBox.Value + ", ", emailTextBox.Value);

            clear();
            //MySqlParameter[] P = new MySqlParameter{new MySqlParameter("user_firstname", ), new MySqlParameter("user_lastname", )};//Define size
            //DataTable dt = new DataTable();
            //dt = DAL.ExecuteQuery("usp_getsubjectbycategory", CommandType.StoredProcedure, P);

        }
        public void clear()
        {
            firstNameTextBox.Value = null;
            lastNameTextBox.Value = null;
            stateTextBox.Value = null;
            cityTextBox.Value = null;
            countryTextBox.Value = null;
            contactTextBox.Value = null;
            icecontactTextBox.Value = null;
            emailTextBox.Value = null;
            famdocTextBox.Value = null;
            dobTextBox1.Value = null;
            selectgender.Value = null;
        }
        #endregion
    }
}