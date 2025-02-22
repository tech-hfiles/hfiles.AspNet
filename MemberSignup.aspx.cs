using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hfiles
{
    public partial class MemberSignup : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["signage"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["id"] != null)
            {
                // Retrieve the parameter value
                string paramValue = Server.UrlDecode(Request.QueryString["id"]);
                divOtp.Visible = false;
                //otpButton.Text = "GET OTP";
                //GetUserMail(paramValue);
                //GetUserId();
                //emailTextBox.Value= Session["user_email"].ToString();
                // Now, you can use the paramValue as needed
                // For example, display it in a label
            }
            else
            {
                Response.Redirect("Signup.aspx");
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
                            //Session["userid"] = reader["user_email"].ToString();
                            Session["generated_key"] = reader["generated_key"].ToString();
                        }
                    }
                }
            }
        }
        protected void GetUserMail(string key)
        {
            using (MySqlConnection con = new MySqlConnection(cs))
            {
                con.Open();
                using (MySqlCommand cmd = new MySqlCommand("getUserMailByKey", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("_user_key", key);
                    using (MySqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            //Session["userid"] = reader["user_email"].ToString();
                            Session["user_email"] = reader["user_email"].ToString();
                        }
                    }
                }
            }
        }

        protected void signup_Click(object sender, EventArgs e)
        {
            if (otpButton.Text.ToLower() == "get otp")
            {
                string email = emailTextBox.Text.ToString();

                if (!string.IsNullOrEmpty(email))
                {
                    int re = Bind(); // Call Bind function for validation (check if user exists)

                    if (re > 0)
                    {
                        string _MobileNoOrEmail = emailTextBox.Text;
                        if (IsEmail(_MobileNoOrEmail))
                        {
                            string otp = GenerateOTP(6); // Generate a 6-digit OTP
                            string subject = "# Verification code";
                            string body = $"<p style=\"text-align: justify\">Please use the verification code below to sign in. If you didn&rsquo;t request this, you can ignore this email.</p>\r\n<p><strong style=\"font-size: 130%\">{otp}</strong>\r\n</span></p>\r\n<p style=\"text-align: justify\">Thanks,&nbsp;</p><p style=\"text-align: justify\">Team Health Files.</p>";
                            ViewState["OTPvalue"] = otp;
                            DAL.SendCareerMail(subject, body, email);
                            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", " toastr.success('OTP sent on " + emailTextBox.Text + "');", true);
                            otpButton.Text = "SIGN IN";
                            divOtp.Visible = true;
                        }
                        else if (IsMobileNumber(_MobileNoOrEmail))
                        {
                            string otp = GenerateOTP(6); // Generate a 6-digit OTP
                            ViewState["OTPvalue"] = otp;
                            DAL.SendOTPApiRequest(otp, _MobileNoOrEmail);
                            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", " toastr.success('OTP sent on " + emailTextBox.Text + "');", true);
                            otpButton.Text = "SIGN IN";
                            divOtp.Visible = true;
                        }
                        else
                        {
                            Session["Userid"] = null;
                            otpButton.Text = "GET OTP";
                            divOtp.Visible = false;
                            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", " toastr.error('Invalid contact or mobile no');", true);
                            //Pop Up Message
                        }
                        //string otp = GenerateOTP(6); // Generate a 6-digit OTP
                        //string subject = "# Verification code";
                        //string body = $"<p style=\"text-align: justify\">Please use the verification code below to sign in. If you didn&rsquo;t request this, you can ignore this email.</p>\r\n<p><strong style=\"font-size: 130%\">{otp}</strong>\r\n</span></p>\r\n<p style=\"text-align: justify\">Thanks,&nbsp;</p><p style=\"text-align: justify\">Team Health Files.</p>";
                        //ViewState["OTPvalue"] = otp;
                        //DAL.SendCareerMail(subject, body, email);
                        //ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", " toastr.success('OTP sent on " + emailTextBox.Text + "');", true);
                        //otpButton.Text = "SIGN IN";
                        //divOtp.Visible = true;
                    }
                    else if (re == 0)
                    {
                        // If user is not registered, redirect to signup page
                        Session["Userid"] = null;
                        otpButton.Text = "GET OTP";
                        divOtp.Visible = false;
                        Response.Redirect("~/signup.aspx"); // Redirect to registration page
                    }
                    else
                    {
                        // Error handling for other cases
                        Session["Userid"] = null;
                        otpButton.Text = "GET OTP";
                        divOtp.Visible = false;
                        ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", "toastr.error('Invalid contact or mobile no');", true);
                    }
                }
            }
            else if (otpButton.Text == "SIGN IN") // Validate OTP
            {
                if (ViewState["OTPvalue"] != null)
                {
                    if (otpTextBox.Value == ViewState["OTPvalue"].ToString()) // If OTP matches
                    {
                        Session["Userid"] = hfId.Value; // Set user session
                        ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", "toastr.success('Logged in successfully');", true);
                        Response.Redirect("~/addbasicdetails.aspx"); // Redirect to dashboard or other page
                    }
                    else
                    {
                        Session["Userid"] = null;
                        ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", "toastr.error('Invalid OTP, please try again');", true);
                    }
                }
            }
        }

        public bool IsEmail(string input)
        {
            // Simple regex for validating email format
            return Regex.IsMatch(input, @"^[^@\s]+@[^@\s]+\.[^@\s]+$", RegexOptions.IgnoreCase);
        }

        public bool IsMobileNumber(string input)
        {
            // Assuming mobile number contains only digits and is 10 digits long (adjust pattern as needed)
            return Regex.IsMatch(input, @"^(\+?\d{1,4})?\d{10}$");
        }

        protected int Bind()
        {
            int result = 0;
            int mobileorEmail = 0;
            try
            {
                string _MobileNoOrEmail = emailTextBox.Text;
                if (IsEmail(_MobileNoOrEmail))
                {
                    mobileorEmail = 1;
                }
                else if (IsMobileNumber(_MobileNoOrEmail))
                {
                    mobileorEmail = 1;
                }
                else
                {
                    mobileorEmail = 0;
                    result = -1;
                }

                if (mobileorEmail == 1)
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
            }
            catch (Exception Ex)
            {


            }
            return result;
        }
        public static string GenerateOTP(int length)
        {
            Random random = new Random();
            const string chars = "0123456789";
            return new string(Enumerable.Repeat(chars, length)
                .Select(s => s[random.Next(s.Length)]).ToArray());
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            using (MySqlConnection con = new MySqlConnection(cs))
            {
                con.Open();
                using (MySqlCommand cmd = new MySqlCommand("usp_login", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("_username", emailTextBox.Text);
                    //cmd.Parameters.AddWithValue("_Password", txtPassword.Text);
                    MySqlDataReader dr = cmd.ExecuteReader();
                    if (dr.Read())
                    {
                        Session["IsCustomer"] = true;
                        Session["UserId"] = dr["user_id"].ToString();
                        //Session["role"] = dr["RoleType"].ToString();
                        Session["user_email"] = dr["user_email"].ToString();

                        //FormsAuthentication.RedirectFromLoginPage(emailTextBox.Text + " " + txtPassword.Text, false);
                        //FormsAuthentication.RedirectFromLoginPage(dr["user_firstname"].ToString() + " " + dr["user_lastname"].ToString(), false);
                        Response.Redirect("Dashboard.aspx");
                        //if (Session["cartprevPath"] != null)
                        //{
                        //    Response.Redirect("~/" + Session["cartprevPath"].ToString());
                        //}
                        //else if (Session["prevPath"] != null)
                        //{
                        //    Response.Redirect(Session["prevPath"].ToString());
                        //}
                        //else if (Session["wishprevPath"] != null)
                        //{
                        //    Response.Redirect(Session["wishprevPath"].ToString());
                        //}
                        //else
                        //{
                        //    Response.Redirect("~/user/");
                        //}
                    }
                    else
                    {
                        ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", "alert('invalid username or password')", true);
                    }
                }
            }
        }
        protected void resendLinkButton_Click(object sender, EventArgs e)
        {

            string _MobileNoOrEmail = emailTextBox.Text;
            if (IsEmail(_MobileNoOrEmail))
            {
                string otp = GenerateOTP(6); // Generate a 6-digit OTP
                string subject = "# Verification code";
                string body = $"<p style=\"text-align: justify\">Please use the verification code below to sign in. If you didn&rsquo;t request this, you can ignore this email.</p>\r\n<p><strong style=\"font-size: 130%\">{otp}</strong>\r\n</span></p>\r\n<p style=\"text-align: justify\">Thanks,&nbsp;</p><p style=\"text-align: justify\">Team Health Files.</p>";
                ViewState["OTPvalue"] = otp;
                DAL.SendCareerMail(subject, body, _MobileNoOrEmail);
                ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", " toastr.success('OTP sent on " + emailTextBox.Text + "');", true);
                otpButton.Text = "SIGN IN";
                divOtp.Visible = true;
            }
            else if (IsMobileNumber(_MobileNoOrEmail))
            {
                string otp = GenerateOTP(6); // Generate a 6-digit OTP
                ViewState["OTPvalue"] = otp;
                DAL.SendOTPApiRequest(otp, _MobileNoOrEmail);
                ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", " toastr.success('OTP sent on " + emailTextBox.Text + "');", true);
                otpButton.Text = "SIGN IN";
                divOtp.Visible = true;
            }
            else
            {
                Session["Userid"] = null;
                otpButton.Text = "GET OTP";
                divOtp.Visible = false;
                //Pop Up Message
                Response.Redirect("~/signup.aspx"); //Redirect to registration page
            }

        }
    }

}