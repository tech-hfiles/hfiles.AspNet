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
            if (!IsPostBack)
            {
                //firstNameTextBox.Value = Session["firstname"].ToString();
                //lastNameTextBox.Value = Session["lastname"].ToString();
                //emailTextBox.Value = Session["email"].ToString();
                //contactTextBox.Value = Session["phone"].ToString();
                //DAL.SendCareerMail("HFiles, Registration Completed - " + DateTime.Now.ToString("dd/MM/yyyy"), "Hello " + firstNameTextBox.Value + ", ", "Kuldeep@digitaledgetech.in");

                //DAL.SendCareerMail("New User - " + DateTime.Now.ToString("dd/MM/yyyy"), firstNameTextBox.Value + " " + lastNameTextBox.Value + " has registered.", "Kuldeep@digitaledgetech.in");// emailTextBox.Value);
            }
        }

        protected void submitButton_Click(object sender, EventArgs e)
        {
            #region variable
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
                    command.Parameters.AddWithValue("_user_membernumber", "ABC001MEM");
                    connection.Open();
                    command.ExecuteNonQuery();
                    connection.Close();
                    clear();
                }
            }
            DAL.SendCareerMail("HFiles, Registration Completed - " + DateTime.Now.ToString("dd/MM/yyyy"), "Hello " + firstNameTextBox.Value + ", ", emailTextBox.Value);

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