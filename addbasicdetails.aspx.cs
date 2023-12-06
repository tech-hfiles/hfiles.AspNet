using AjaxControlToolkit.HTMLEditor.ToolbarButton;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static System.Net.WebRequestMethods;


namespace hfiles
{
    public partial class addbasicdetails : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["signage"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            Profileupload.Attributes["onchange"] = "uploadImage();";
            if (Session["Userid"] != null)
            //newly commented for testing purpose
            //if (Session["firstname"] != null && Session["lastname"] != null && Session["email"] != null && Session["phone"] != null)
            {
                if (!IsPostBack)
                {
                    int userid = Convert.ToInt32(Session["Userid"]);
                    if (ddlCountry.SelectedIndex == -1)
                    {
                        getcountrylist();
                        getstatelist();
                        //getcitylist("");
                    }
                    //if (ddlCountry.SelectedItem.Text == "India")
                    //{
                    //    getstatelist();
                    //    stateTextBox.Visible = false;
                    //    cityTextBox.Visible = false;
                    //    stateDropDownList.Visible = true;
                    //    cityDropDownList.Visible = true;
                    //}
                    //else
                    //{
                    //    stateTextBox.Visible = true;
                    //    cityTextBox.Visible = true;
                    //    stateDropDownList.Visible = false;
                    //    cityDropDownList.Visible = false;
                    //}
                    getbasicdetails(userid);

                    //firstNameTextBox.Value = Session["firstname"].ToString();
                    //lastNameTextBox.Value = Session["lastname"].ToString();
                    //emailTextBox.Value = Session["email"].ToString();
                    //contactTextBox.Value = Session["phone"].ToString();
                }
            }
            else
            {
                Response.Redirect("~/login.aspx");
            }

        }

        public static string UploadImage(string base64String)
        {
            try
            {
                // Convert the base64 string to byte array
                byte[] bytes = Convert.FromBase64String(base64String.Split(',')[1]);

                // Specify the upload path
                string uploadPath = HttpContext.Current.Server.MapPath("~/Uploads/");

                // Generate a unique file name
                string fileName = Guid.NewGuid().ToString() + ".png";

                // Save the file to the server
                System.IO.File.WriteAllBytes(Path.Combine(uploadPath, fileName), bytes);

                // Return the file path or any other response if needed
                return $"~/Uploads/{fileName}";
            }
            catch (Exception ex)
            {
                // Handle exception (display error message, log, etc.)
                return "Error";
            }

        }
        private void getcountrylist()
        {
            MySqlConnection con = new MySqlConnection(connectionString);
            string com = "Select * from countrylist";
            MySqlDataAdapter adpt = new MySqlDataAdapter(com, con);
            DataTable dt = new DataTable();
            adpt.Fill(dt);
            ddlCountry.DataSource = dt;
            ddlCountry.DataTextField = "countryname";
            ddlCountry.DataValueField = "dialingcode";
            ddlCountry.DataBind();
        }
        private void getstatelist()
        {
            MySqlConnection con = new MySqlConnection(connectionString);
            string com = "Select state from scp group by state";
            MySqlDataAdapter adpt = new MySqlDataAdapter(com, con);
            DataTable dt = new DataTable();
            adpt.Fill(dt);
            stateDropDownList.DataSource = dt;
            stateDropDownList.DataTextField = "state";
            stateDropDownList.DataValueField = "state";
            stateDropDownList.DataBind();
        }
        private void getcitylist(string state)
        {
            MySqlConnection con = new MySqlConnection(connectionString);
            string com = "Select distinct city from scp where state='" + state + "' ";
            MySqlDataAdapter adpt = new MySqlDataAdapter(com, con);
            DataTable dt = new DataTable();
            adpt.Fill(dt);
            cityDropDownList.DataSource = dt;
            cityDropDownList.DataTextField = "city";
            cityDropDownList.DataValueField = "city";
            cityDropDownList.DataBind();
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

            using (MySqlConnection connection = new MySqlConnection(connectionString))
            {
                //procedure adduser replaced by add_update_userdetails
                using (MySqlCommand command = new MySqlCommand("add_update_userdetails", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    // Add parameters to the command
                    command.Parameters.AddWithValue("_user_firstname", firstNameTextBox.Value);
                    command.Parameters.AddWithValue("_user_lastname", lastNameTextBox.Value);
                    command.Parameters.AddWithValue("_user_gender", selectgender.Value);
                    command.Parameters.AddWithValue("_user_dob", dobTextBox1.Value);
                    command.Parameters.AddWithValue("_user_bloodgroup", bloodgroup.Value);
                    //command.Parameters.AddWithValue("_user_state", stateTextBox.Value);
                    command.Parameters.AddWithValue("_user_state", stateDropDownList.SelectedItem.Text);
                    //command.Parameters.AddWithValue("_user_city", cityTextBox.Value);
                    command.Parameters.AddWithValue("_user_city", cityDropDownList.SelectedItem.Text);
                    command.Parameters.AddWithValue("_user_country", ddlCountry.SelectedItem.Text);
                    //command.Parameters.AddWithValue("_user_country", ddlCountry.SelectedValue);
                    command.Parameters.AddWithValue("_user_contact", contactTextBox.Value);
                    command.Parameters.AddWithValue("_user_icecontact", icecontactTextBox.Value);
                    command.Parameters.AddWithValue("_user_relativecontact", relativecontactTextBox.Value);
                    command.Parameters.AddWithValue("_user_email", emailTextBox.Value);
                    command.Parameters.AddWithValue("_user_doctor", famdocTextBox.Value);
                    command.Parameters.AddWithValue("_user_membernumber", member);
                    connection.Open();
                    command.ExecuteNonQuery();
                    connection.Close();

                    //commented by chetan dated on 07/11/2023
                    //string email = emailTextBox.Value.ToString();
                    //string subject = "# Verification code";
                    //string body = $"<p style=\"text-align: justify;\">Dear {firstNameTextBox.Value},&nbsp;</p>\r\n<p style=\"text-align: justify;\">Thank you for signing up for Hfiles! We&apos;re delighted to have you as a member of our community, and we appreciate your trust in our platform.&nbsp;</p>\r\n<p style=\"text-align: justify;\">Now that you&apos;re officially part of Hfiles, you can take the first step in managing your medical data. Simply log into your account by visiting [Login Page] and use your registered credentials to access your personalized dashboard.&nbsp;</p>\r\n<p style=\"text-align: justify;\">Once you&apos;re logged in, you&apos;ll be able to:&nbsp;</p>\r\n<ol>\r\n    <li style=\"text-align: justify;\">Fill Medical Records: Easily input and update your medical history, prescriptions, and other vital information.</li>\r\n    <li style=\"text-align: justify;\">Upload Documents: Safely upload and store important medical documents, test results, and reports</li>\r\n</ol>\r\n<p style=\"text-align: justify;\">Our user-friendly interface and secure storage ensure that your medical data is organized and readily accessible when you need it most.</p>\r\n<p style=\"text-align: justify;\">If you have any questions or need assistance, our support team is here to help. Simply reach out to us at [Support Email], and we&apos;ll be happy to assist you.</p>\r\n<p style=\"text-align: justify;\">Thank you for choosing Hfiles to manage your medical information. We&apos;re committed to providing you with a secure and convenient platform for all your healthcare needs.&nbsp;</p>\r\n<p style=\"text-align: justify;\">Email footer/ Privacy Agreement: Thank you for choosing Hfiles to manage your medical information. We&apos;re committed to providing you with a secure and convenient platform for all your healthcare needs. Your medical data is treated with the utmost confidentiality and is stored securely using the latest encryption protocols. We strictly adhere to all relevant data protection laws and regulations to ensure that your information remains private and protected. Your data will not be shared with any third parties without your explicit consent</p>";
                    //DAL.SendCareerMail(subject, body, email);

                    if (Bind() > 0)
                    {
                        Response.Redirect("~/samanta.aspx");
                    }
                    else
                    {
                        //err
                    }
                }
            }
        }

        public void getbasicdetails(int id)
        {
            getstatelist();
            using (MySqlConnection connection = new MySqlConnection(connectionString))
            {
                connection.Open();
                using (MySqlCommand command = new MySqlCommand("getUserDetails", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    // Add parameters to the command
                    command.Parameters.AddWithValue("_Id", id);
                    using (MySqlDataReader reader = command.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            // Populate the HTML controls with user details.
                            firstNameTextBox.Value = reader["user_firstname"].ToString();
                            lastNameTextBox.Value = reader["user_lastname"].ToString();
                            selectgender.Value = reader["user_gender"].ToString();
                            dobTextBox1.Value = reader["user_dob"].ToString();
                            bloodgroup.Value = reader["user_bloodgroup"].ToString();
                            dialcode.Text = ddlCountry.SelectedValue.ToString();
                            //stateTextBox.Value = reader["user_state"].ToString();
                            //cityTextBox.Value = reader["user_city"].ToString();
                            ddlCountry.SelectedItem.Text = reader["user_country"].ToString();

                            stateDropDownList.SelectedItem.Text = reader["user_state"].ToString();
                            getcitylist(stateDropDownList.SelectedItem.Text);
                            //ddlState.SelectedItem.Text = reader["user_state"].ToString();
                            //cityDropDownList.SelectedItem.Text = reader["user_city"].ToString();
                            if (reader["user_city"].ToString()!=string.Empty)
                            {
                                cityDropDownList.SelectedItem.Text = reader["user_city"].ToString();
                                
                            }
                            else
                            {
                                //cityDropDownList.SelectedItem.Text = "Mumbai";
                            }
                           
                            //if (ddlCountry.SelectedItem.Text == "India")
                            //{
                            //    stateDropDownList.SelectedItem.Text = reader["user_state"].ToString();
                            //    cityDropDownList.SelectedItem.Text = reader["user_city"].ToString();
                            //}
                            contactTextBox.Value = reader["user_contact"].ToString();
                            icecontactTextBox.Value = reader["user_icecontact"].ToString();
                            relativecontactTextBox.Value = reader["user_relativecontact"].ToString();
                            emailTextBox.Value = reader["user_email"].ToString();
                            famdocTextBox.Value = reader["user_doctor"].ToString();
                        }
                    }
                    command.ExecuteNonQuery();
                    connection.Close();


                }
            }
        }

        protected int Bind()
        {
            int result = 0;
            try
            {
                using (MySqlConnection con = new MySqlConnection(connectionString))
                {
                    con.Open();
                    using (MySqlCommand cmd = new MySqlCommand("usp_isuserexists", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("_MobileNoOrEmail", emailTextBox.Value);
                        cmd.Parameters.Add("_Result", MySqlDbType.Int32).Direction = ParameterDirection.Output;
                        cmd.ExecuteNonQuery();
                        result = DAL.validateInt(cmd.Parameters["_Result"].Value.ToString());
                        Session["Userid"] = result.ToString();
                    }
                }

            }
            catch (Exception Ex)
            {


            }
            return result;
        }
        public void clear()
        {
            firstNameTextBox.Value = null;
            lastNameTextBox.Value = null;
            stateTextBox.Value = null;
            cityTextBox.Value = null;
            ddlCountry.ClearSelection();
            //ddlCountry.SelectedValue = null;
            contactTextBox.Value = null;
            icecontactTextBox.Value = null;
            emailTextBox.Value = null;
            famdocTextBox.Value = null;
            dobTextBox1.Value = null;
            selectgender.Value = null;
        }
        #endregion

        protected void ddlCountry_SelectedIndexChanged(object sender, EventArgs e)
        {
            dialcode.Text = ddlCountry.SelectedValue.ToString();
            if (ddlCountry.SelectedItem.Text == "India")
            {
                getstatelist();
                stateTextBox.Visible = false;
                cityTextBox.Visible = false;
                stateDropDownList.Visible = true;
                cityDropDownList.Visible = true;
            }
            else
            {
                stateTextBox.Visible = true;
                cityTextBox.Visible = true;
                stateDropDownList.Visible = false;
                cityDropDownList.Visible = false;
            }


        }

        protected void stateDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            getcitylist(stateDropDownList.SelectedItem.Text);
        }

        protected void ddlState_SelectedIndexChanged(object sender, EventArgs e)
        {
            getcitylist(stateDropDownList.SelectedItem.Text);
        }
    }
}