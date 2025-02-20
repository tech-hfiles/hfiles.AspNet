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
using System.Data;
using static System.Net.WebRequestMethods;
using MySqlX.XDevAPI.Common;
using System.Security.Cryptography;
using System.Text;
using System.IO;
using System.Web.Script.Serialization;

namespace hfiles
{
    public partial class signup : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["signage"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session.RemoveAll();
                Session.Abandon();
                divSubmit.Visible = false;
                divOtp.Visible = true;
                dateajax.EndDate = DateTime.Now.AddDays(0);

                if (ddlCountry != null)
                {
                    getcountrylist(); // Populate the dropdown
                     // Assign ClientID to hidden field
                }
                else
                {
                    Response.Redirect("Login.aspx");
                }

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
            string userInput = txtcaptcha.Text;
            string actualCaptcha = Session["Captcha"]?.ToString();
            string CountryCode = ddlCountry.SelectedItem.Text;

            string phone = CountryCode + phoneTextBox.Value;

            if (userInput == actualCaptcha)
            {
                // Usage:
                string email = emailTextBox.Value.ToString();
                if (Bind() > 0)
                {
                    ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", " toastr.success('EmailID Or the Contact Number is already registered please login.');", true);
                }
                else
                {
                    string otp = GenerateOTP(6);
                    DAL.SendOTPApiRequest(otp, phone);
                    // Generate a 6-digit OTP
                    //string subject = "Welcome to Hfiles";
                    //string body = $"<p style=\"text-align: justify\">Dear {firstnameTextBox.Value},&nbsp;</p>\r\n<p style=\"text-align: justify\">Thank you for signing up for Hfiles! We&apos;re excited to have you on board as a valued member of our community.&nbsp;</p>\r\n<p style=\"text-align: justify\">To complete your registration, please use the following One-Time Password</p>\r\n<p style=\"text-align: justify\"><strong style=\"font-size: 130%\">{otp}</strong>\r\n</span></p>\r\n<p style=\"text-align: justify\">Email footer/ Privacy Agreement: Please keep this OTP secure, as you will need it to verify your account and access our services.&nbsp;</p>\r\n<p style=\"text-align: justify\">At Hfiles, we take your privacy and data security seriously. We are committed to safeguarding your personal information and ensuring it is used in accordance with our Privacy Agreement.</p>";
                    string subject = "Complete Your Hfiles Registration";
                    string body = $@"
                            <p>Hello {firstnameTextBox.Value},</p>
                            <p>Welcome to Hfiles!</p>
                            <p>To complete your registration, please use the following One-Time Password (OTP):</p>
                            <p style=""font-weight: bold; font-size: 1.2em;"">{otp}</p>
                            <p>Please keep this OTP secure and use it to finalize your registration process.</p>
                            <p>If you have any questions or need assistance, feel free to reach out to our support team at contact@hfiles.in.</p>
                            <p>Thank you for joining us!</p>
                            <p>Best regards,<br/>The Hfiles Team</p>
                            <p><small>If you did not sign up for Hfiles, please disregard this email.</small></p>";

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
                        DAL.SendCareerMail(subject, body, email);
                        divSubmit.Visible = true;
                        divOtp.Visible = false;
                        ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", " toastr.success('OTP sent on " + emailTextBox.Value + " and " + phone + ".');", true);
                    }
                   
                }

            }
            else
            {
                Lblcaptcha.Text = "CAPTCHA Verification Failed!";
            }


        }

        private bool ValidateCaptcha(string captchaResponse)
        {
            string secretKey = "YOUR_SECRET_KEY"; // Replace with your new secret key
            string apiUrl = $"https://www.google.com/recaptcha/api/siteverify?secret={secretKey}&response={captchaResponse}";

            using (var client = new WebClient())
            {
                string result = client.DownloadString(apiUrl);
                var jsonResult = new JavaScriptSerializer().Deserialize<Dictionary<string, object>>(result);
                return Convert.ToBoolean(jsonResult["success"]);
            }
        }



        protected void submitButton_Click(object sender, EventArgs e)
        {
            int userexist = 0;
            // Generate a unique random number (you can adjust the range as needed)
            Random random = new Random();
            int randomNumber = random.Next(1000, 9999);

            // Format the date of birth in MMDDYYYY formatsignup_Click
            string formattedDateOfBirth = Convert.ToDateTime(dobTextBox1.Value).ToString("MMddyy");

            // Take a portion of the last name (first three characters)
            string partialLastName = firstnameTextBox.Value.Substring(0, Math.Min(3, lastnameTextBox.Value.Length)).ToUpper();

            // Concatenate the components to create the membership number
            string membershipNumber = $"HF{formattedDateOfBirth}{partialLastName}{randomNumber}";

            #region variable
            string member = membershipNumber;




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
                        //Response.Redirect("addbasicdetails.aspx");
                        string hashedPassword = HashPassword(cpwdTextBox.Text);

                        //newly added to change registration processflow
                        //using (MySqlConnection connection = new MySqlConnection(connectionString))
                        {
                            using (MySqlCommand cmdInsert = new MySqlCommand("usp_signup", connection))
                            {
                                cmdInsert.CommandType = CommandType.StoredProcedure;
                                // Add parameters to the command
                                cmdInsert.Parameters.AddWithValue("_user_reference", 0);
                                cmdInsert.Parameters.AddWithValue("_user_firstname", firstnameTextBox.Value);
                                cmdInsert.Parameters.AddWithValue("_user_lastname", lastnameTextBox.Value);
                                cmdInsert.Parameters.AddWithValue("_user_dob", txtDate.Text);// dobTextBox1.Value));// ;
                                cmdInsert.Parameters.AddWithValue("_countrycode", ddlCountry.SelectedItem.Text);
                                cmdInsert.Parameters.AddWithValue("_user_contact", phoneTextBox.Value);
                                cmdInsert.Parameters.AddWithValue("_user_email", emailTextBox.Value);
                                cmdInsert.Parameters.AddWithValue("_user_password", hashedPassword);
                                cmdInsert.Parameters.AddWithValue("_user_gender", "");
                                cmdInsert.Parameters.AddWithValue("_user_relation", "");
                                cmdInsert.Parameters.AddWithValue("_chkmail", 1);

                                cmdInsert.Parameters.AddWithValue("_user_membernumber", member);
                                cmdInsert.Parameters.AddWithValue("_user_isactive", true);
                                cmdInsert.Parameters.AddWithValue("_user_uniquekey", 0);

                                cmdInsert.Parameters.Add("_Result", MySqlDbType.Int32);
                                cmdInsert.Parameters["_Result"].Direction = ParameterDirection.Output;
                                //cmdInsert.Parameters.AddWithValue("_user_id", (object)Convert.ToInt32(this.Session["Userid"].ToString()));
                                cmdInsert.ExecuteNonQuery();
                                userexist = Convert.ToInt32(cmdInsert.Parameters["_Result"].Value.ToString());
                                if (userexist > 0)
                                {
                                    Session["Userid"] = userexist.ToString();
                                    string email = emailTextBox.Value.ToString();
                                    //string subject = "# Verification code";
                                    string subject = "Welcome to HFiles - Start Managing Your Medical Data";
                                    string body = $"<p style=\"text-align: justify;\">Dear {firstnameTextBox.Value},&nbsp;</p>\r\n<p style=\"text-align: justify;\">Thank you for signing up for Hfiles! We&apos;re delighted to have you as a member of our community, and we appreciate your trust in our platform.&nbsp;</p>\r\n<p style=\"text-align: justify;\">Now that you&apos;re officially part of Hfiles, you can take the first step in managing your medical data. Simply log into your account by visiting https://hfiles.in/login.aspx and use your registered credentials to access your personalized dashboard.&nbsp;</p>\r\n<p style=\"text-align: justify;\">Once you&apos;re logged in, you&apos;ll be able to:&nbsp;</p>\r\n<ol>\r\n    <li style=\"text-align: justify;\">Fill Medical Records: Easily input and update your medical history, prescriptions, and other vital information.</li>\r\n    <li style=\"text-align: justify;\">Upload Documents: Safely upload and store important medical documents, test results, and reports</li>\r\n</ol>\r\n<p style=\"text-align: justify;\">Our user-friendly interface and secure storage ensure that your medical data is organized and readily accessible when you need it most.</p>\r\n<p style=\"text-align: justify;\">If you have any questions or need assistance, our support team is here to help. Simply reach out to us at contact@hfiles.in, and we&apos;ll be happy to assist you.</p>\r\n<p style=\"text-align: justify;\">Thank you for choosing Hfiles to manage your medical information. We&apos;re committed to providing you with a secure and convenient platform for all your healthcare needs.&nbsp;</p>\r\n<p style=\"text-align: justify;\">Email footer/ Privacy Agreement: Thank you for choosing Hfiles to manage your medical information. We&apos;re committed to providing you with a secure and convenient platform for all your healthcare needs. Your medical data is treated with the utmost confidentiality and is stored securely using the latest encryption protocols. We strictly adhere to all relevant data protection laws and regulations to ensure that your information remains private and protected. Your data will not be shared with any third parties without your explicit consent</p>";
                                    DAL.SendCareerMail(subject, body, email);
                                    //Response.Redirect("~/Dashboard.aspx");
                                    if (Bind() > 0)
                                    {
                                        Response.Redirect("~/addbasicdetails.aspx");
                                    }
                                    else
                                    {
                                        //err
                                    }
                                }
                                else
                                {
                                    ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", "alert('EmailID Or the Contact Number is already registered.')", true);
                                }
                            }
                        }
                    }
                    else
                    {
                        // OTP is invalid
                        errorLabel.Text = "Invalid OTP, please enter the correct OTP.";
                    }
                }

                // Close the database connection
                connection.Close();
            }
        }

       
        public string HashPassword(string password)
        {
            using (SHA256 sha256 = SHA256.Create())
            {
                byte[] hashBytes = sha256.ComputeHash(Encoding.UTF8.GetBytes(password));
                return BitConverter.ToString(hashBytes).Replace("-", "").ToLower(); // 64-character hash
            }
        }


        private void getcountrylist()
        {
            MySqlConnection con = new MySqlConnection(connectionString);
            string com = "Select * from countrylist";
            MySqlDataAdapter adpt = new MySqlDataAdapter(com, con);
            DataTable dt = new DataTable();
            adpt.Fill(dt);

            if(dt != null)
            {
                ViewState["CountryCodeList"] = dt;
                ddlCountry.DataSource = dt;
                ddlCountry.DataTextField = "dialingcode";
                ddlCountry.DataValueField = "id";
                ddlCountry.DataBind();
                ddlCountry.Items.Insert(0, new ListItem("+91", "+91"));
            }
            else
            {
                Response.Redirect("Login.aspx");
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
                        //ViewState["valueSignId"] = result.ToString();
                    }
                }

            }
            catch (Exception Ex)
            {


            }
            return result;
        }

        protected void resendLinkButtonTest_Click(object sender, EventArgs e)
        {
            string email = emailTextBox.Value.ToString();
            string otp = GenerateOTP(6); // Generate a 6-digit OTP
            DAL.SendOTPApiRequest(otp, phoneTextBox.Value);
            string subject = "Welcome to Hfiles";
            string body = $"<p style=\"text-align: justify\">Dear {firstnameTextBox.Value},&nbsp;</p>\r\n<p style=\"text-align: justify\">Thank you for signing up for Hfiles! We&apos;re excited to have you on board as a valued member of our community.&nbsp;</p>\r\n<p style=\"text-align: justify\">To complete your registration, please use the following One-Time Password</p>\r\n<p style=\"text-align: justify\"><strong style=\"font-size: 130%\">{otp}</strong>\r\n</span></p>\r\n<p style=\"text-align: justify\">Email footer/ Privacy Agreement: Please keep this OTP secure, as you will need it to verify your account and access our services.&nbsp;</p>\r\n<p style=\"text-align: justify\">At Hfiles, we take your privacy and data security seriously. We are committed to safeguarding your personal information and ensuring it is used in accordance with our Privacy Agreement.</p>";

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
                DAL.SendCareerMail(subject, body, email);
                divSubmit.Visible = true;
                divOtp.Visible = false;
            }
        }
    }
}
#endregion