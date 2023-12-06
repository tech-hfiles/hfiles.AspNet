using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Mail;
using MySql.Data.MySqlClient;
using System.Data;
using System.Configuration;
using System.Web.Security;

namespace hfiles
{

    public partial class ForgotPassword : System.Web.UI.Page
    {
        #region Variable
        string cs = ConfigurationManager.ConnectionStrings["signage"].ConnectionString;
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string email = emailTextBox.Text.ToString();
                //GetUserId(email);
                if (Session["Userid"] != null)
                {
                    var sessionuserid = Session["Userid"];
                    Response.Redirect("~/samanta.aspx");
                }
                divOtp.Visible = false;
                otpButton.Text = "GET OTP";
            }
        }

        protected void GetUserId(string email)
        {
            using (MySqlConnection con = new MySqlConnection(cs))
            {
                con.Open();
                using (MySqlCommand cmd = new MySqlCommand("getUserId", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("_user_email", emailTextBox.Text);
                    using (MySqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            Session["userid"]= reader["user_email"].ToString();
                        }
                    }
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
                if (otpButton.Text == "GET OTP")
                {
                    string email = emailTextBox.Text.ToString();
                    if (Bind() > 0)
                    {
                        string otp = GenerateOTP(6); 
                        string subject = "# Forgot Password ?";
                        string body = $"<p style=\"text-align: justify\">Please use the verification code below to change your password. If you didn&rsquo;t request this, you can ignore this email.</p>\r\n<p><strong style=\"font-size: 130%\">{otp}</strong>\r\n</span></p>\r\n<p style=\"text-align: justify\">Thanks,&nbsp;</p><p style=\"text-align: justify\">Team Health Files.</p>";
                        ViewState["OTPvalue"] = otp;
                        Session["Userid"] = hfId.Value;
                        DAL.SendCareerMail(subject, body, email);
                        otpButton.Text = "Change Password";
                        divOtp.Visible = true;
                    }
                    else
                    {
                        Session["Userid"] = null;
                        otpButton.Text = "GET OTP";
                        divOtp.Visible = true;
                        
                        Response.Redirect("~/signup.aspx");
                    }
                }
                else if (otpButton.Text == "Change Password")
                {
                    if (ViewState["OTPvalue"] != null)
                    {
                        if (otpTextBox.Value == ViewState["OTPvalue"].ToString())
                        {
                            int userexist = 0;

                       // GetUserId(emailTextBox.Text);

                        using (MySqlConnection connection = new MySqlConnection(cs))
                            {
                                connection.Open();

                                string query = "SELECT otp_code FROM otp WHERE user_id = @userId ORDER BY created_at DESC LIMIT 1";

                                using (MySqlCommand command = new MySqlCommand(query, connection))
                                {
                                    command.Parameters.AddWithValue("@userId", emailTextBox.Text);

                                    string otpCodeFromDatabase = (string)command.ExecuteScalar();

                                    if (ViewState["OTPvalue"].ToString() == otpTextBox.Value)
                                    {

                                        using (MySqlCommand cmdInsert = new MySqlCommand("usp_changepassword", connection))
                                        {
                                            cmdInsert.CommandType = CommandType.StoredProcedure;
                                           
                                            cmdInsert.CommandType = CommandType.StoredProcedure;
                                            cmdInsert.Parameters.AddWithValue("_UserId", hfId.Value);
                                            cmdInsert.Parameters.AddWithValue("_OldPassword", txtPassword.Text);
                                            cmdInsert.Parameters.AddWithValue("_NewPassword", cpwdTextBox.Text);
                                            cmdInsert.Parameters.Add("_Result", MySqlDbType.Int32).Direction = ParameterDirection.Output;
                                            cmdInsert.ExecuteNonQuery();

                                            if (DAL.validateInt(cmdInsert.Parameters["_Result"].Value.ToString()) == 1)
                                            {
                                                //CleanUp();
                                                Response.Write("<script>alert('Password Changed Successfully.')</script>");
                                                Response.Redirect("login.aspx");
                                            }
                                            cmdInsert.Parameters.Add("_Result", MySqlDbType.Int32);
                                            cmdInsert.Parameters["_Result"].Direction = ParameterDirection.Output;
                                            cmdInsert.ExecuteNonQuery();
                                            userexist = Convert.ToInt32(cmdInsert.Parameters["_Result"].Value.ToString());
                                        }

                                    }

                                    else
                                    {
                                        errorLabel.Text = "Invalid OTP, please enter the correct OTP.";
                                    }
                                }
                                connection.Close();
                            }
                        }
                     
                    }
                }

            }

            protected int Bind()
            {
                int result = 0;
                try
                {
                    using (MySqlConnection con = new MySqlConnection(cs))
                    {
                        con.Open();
                        using (MySqlCommand cmd = new MySqlCommand("usp_isuserexists", con))
                        {
                            cmd.CommandType = CommandType.StoredProcedure;
                            cmd.Parameters.AddWithValue("_MobileNoOrEmail", emailTextBox.Text);
                            cmd.Parameters.Add("_Result", MySqlDbType.Int32).Direction = ParameterDirection.Output;
                            cmd.ExecuteNonQuery();
                            result = DAL.validateInt(cmd.Parameters["_Result"].Value.ToString());
                            hfId.Value = result.ToString();
                        }
                    }

                }
                catch (Exception Ex)
                {


                }
                return result;
            }

            protected void resendLinkButton_Click(object sender, EventArgs e)
            {

                string email = emailTextBox.Text.ToString();
                if (Bind() > 0)
                {
                    string otp = GenerateOTP(6); // Generate a 6-digit OTP
                    string subject = "# Verification code";
                    string body = $"<p style=\"text-align: justify\">Please use the verification code below to sign in. If you didn&rsquo;t request this, you can ignore this email.</p>\r\n<p><strong style=\"font-size: 130%\">{otp}</strong>\r\n</span></p>\r\n<p style=\"text-align: justify\">Thanks,&nbsp;</p><p style=\"text-align: justify\">Team Health Files.</p>";
                    ViewState["OTPvalue"] = otp;
                    Session["Userid"] = hfId.Value;
                    DAL.SendCareerMail(subject, body, email);
                    otpButton.Text = "SIGN IN";
                    divOtp.Visible = true;
                }
                else
                {
                    Session["Userid"] = null;
                    otpButton.Text = "GET OTP";
                    divOtp.Visible = true;
                    //Pop Up Message
                    Response.Redirect("~/signup.aspx"); //Redirect to registration page
                }

                //else if (otpButton.Text == "SIGN IN")
                //{
                //    if (ViewState["OTPvalue"] != null)
                //    {
                //        if (otpTextBox.Value == ViewState["OTPvalue"].ToString())
                //        {
                //            errorLabel.Text = "";
                //            Response.Redirect("~/Samanta.aspx");//Redirect to registration page
                //        }
                //        else
                //        {
                //            errorLabel.Text = "Inavlid OTP, please enter the correct OTP.";
                //        }
                //    }
                //}
            }

            protected void btnSubmit_Click(object sender, EventArgs e)
            {
                int userexist = 0;


                using (MySqlConnection connection = new MySqlConnection(cs))
                {
                    connection.Open();
 
                    string query = "SELECT otp_code FROM otp WHERE user_id = @userId ORDER BY created_at DESC LIMIT 1";

                    using (MySqlCommand command = new MySqlCommand(query, connection))
                    {
                        command.Parameters.AddWithValue("@userId", emailTextBox.Text);

                        string otpCodeFromDatabase = (string)command.ExecuteScalar();

                        if (otpCodeFromDatabase == otpTextBox.Value)
                        {
                            using (MySqlCommand cmdInsert = new MySqlCommand("usp_changepassword", connection))
                            {
                                cmdInsert.CommandType = CommandType.StoredProcedure;
                                // Add parameters to the command
                                cmdInsert.CommandType = CommandType.StoredProcedure;
                                cmdInsert.Parameters.AddWithValue("_UserId", emailTextBox.Text);
                                cmdInsert.Parameters.AddWithValue("_OldPassword", txtPassword.Text);
                                cmdInsert.Parameters.AddWithValue("_NewPassword", cpwdTextBox.Text);
                                cmdInsert.Parameters.Add("_Result", MySqlDbType.Int32).Direction = ParameterDirection.Output;
                                cmdInsert.ExecuteNonQuery();

                                //if (oldpassword == txtOldPassword.Text)
                                //{
                                if (DAL.validateInt(cmdInsert.Parameters["_Result"].Value.ToString()) == 1)
                                {
                                    //CleanUp();
                                    Response.Write("<script>alert('Password Changed Successfully.')</script>");
                                    Response.Redirect("login.aspx");
                                }
                                //}

                                cmdInsert.Parameters.Add("_Result", MySqlDbType.Int32);
                                cmdInsert.Parameters["_Result"].Direction = ParameterDirection.Output;
                                cmdInsert.ExecuteNonQuery();
                                userexist = Convert.ToInt32(cmdInsert.Parameters["_Result"].Value.ToString());
                                //if (userexist == 1)
                                //{

                                //    string email = emailTextBox.Text.ToString();
                                //    //string subject = "# Verification code";
                                //    string subject = "Welcome to HFiles - Start Managing Your Medical Data";
                                //    string body = $"<p style=\"text-align: justify;\">Dear {emailTextBox.Text},&nbsp;</p>\r\n<p style=\"text-align: justify;\">Thank you for signing up for Hfiles! We&apos;re delighted to have you as a member of our community, and we appreciate your trust in our platform.&nbsp;</p>\r\n<p style=\"text-align: justify;\">Now that you&apos;re officially part of Hfiles, you can take the first step in managing your medical data. Simply log into your account by visiting [Login Page] and use your registered credentials to access your personalized dashboard.&nbsp;</p>\r\n<p style=\"text-align: justify;\">Once you&apos;re logged in, you&apos;ll be able to:&nbsp;</p>\r\n<ol>\r\n    <li style=\"text-align: justify;\">Fill Medical Records: Easily input and update your medical history, prescriptions, and other vital information.</li>\r\n    <li style=\"text-align: justify;\">Upload Documents: Safely upload and store important medical documents, test results, and reports</li>\r\n</ol>\r\n<p style=\"text-align: justify;\">Our user-friendly interface and secure storage ensure that your medical data is organized and readily accessible when you need it most.</p>\r\n<p style=\"text-align: justify;\">If you have any questions or need assistance, our support team is here to help. Simply reach out to us at [Support Email], and we&apos;ll be happy to assist you.</p>\r\n<p style=\"text-align: justify;\">Thank you for choosing Hfiles to manage your medical information. We&apos;re committed to providing you with a secure and convenient platform for all your healthcare needs.&nbsp;</p>\r\n<p style=\"text-align: justify;\">Email footer/ Privacy Agreement: Thank you for choosing Hfiles to manage your medical information. We&apos;re committed to providing you with a secure and convenient platform for all your healthcare needs. Your medical data is treated with the utmost confidentiality and is stored securely using the latest encryption protocols. We strictly adhere to all relevant data protection laws and regulations to ensure that your information remains private and protected. Your data will not be shared with any third parties without your explicit consent</p>";
                                //    DAL.SendCareerMail(subject, body, email);
                                //    //Response.Redirect("~/samanta.aspx");
                                //    // if (Bind() > 0)
                                //    //{
                                //    Response.Redirect("~/addbasicdetails.aspx");
                                //    //}
                                //    //else
                                //    //{
                                //    //    //err
                                //    //}
                                //}
                                //else
                                //{
                                //    ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", "alert('EmailID Or the Contact Number is already registered.')", true);
                                //}
                            }
                        }
                        else
                        {
                            errorLabel.Text = "Invalid OTP, please enter the correct OTP.";
                        }
                    }

                    connection.Close();
                }
            }
        }
    }