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
using System.Threading;
using System.Resources;
using System.Globalization;
using System.Reflection;
using System.Text.RegularExpressions;
using System.Security.Cryptography;
using System.Text;

namespace hfiles
{
    public partial class login : System.Web.UI.Page
    {
        #region Variable
        string cs = ConfigurationManager.ConnectionStrings["signage"].ConnectionString;
        ResourceManager rm;
        CultureInfo ci;
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            //ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", " toastr.success('OTP sent on ');", true);
            if (!IsPostBack)
            {
                Session.RemoveAll();
                Session.Abandon();
                Thread.CurrentThread.CurrentCulture = new System.Globalization.CultureInfo("en-US");
                rm = new ResourceManager("hfiles.App_GlobalResources.Strings", Assembly.GetExecutingAssembly());
                //rm = new ResourceManager("hfiles.App_GlobalResources.Strings", Assembly.Load("App_GlobalResources"));
                ci = Thread.CurrentThread.CurrentCulture;
                //LoadString(ci);
                //Session["Userid"] = 126; Response.Redirect("~/Dashboard.aspx");
                if (Session["Userid"] != null)
                {
                    var sessionuserid = Session["Userid"];
                    Response.Redirect("~/Dashboard.aspx");
                }
                //rm = new ResourceManager();
                //rm = new ResourceManager("Resources.Strings", System.Reflection.Assembly.Load("App_GlobalResources"));
                //ci = Thread.CurrentThread.CurrentCulture;
                //LoadString(ci);
                divOtp.Visible = false;
                otpButton.Text = "Get OTP";
            }
            else
            {
                //rm = new ResourceManager("Resources.Strings", System.Reflection.Assembly.Load("App_GlobalResources"));
                //ci = Thread.CurrentThread.CurrentCulture;
                //LoadString(ci);
            }

        }

        protected override void InitializeCulture()
        {
            base.InitializeCulture();
        }
        private void LoadString(CultureInfo ci)
        {
            emailTextBox.ToolTip = rm.GetString("emailfield", ci);
            emailTextBox.Text = rm.GetString("emailfield", ci);
            btnSubmit.Text = rm.GetString("login", ci);
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
            if (otpButton.Text.ToLower() == "get otp")
            {
                // Usage:
                string email = emailTextBox.Text.ToString();
                if (emailTextBox.Text != string.Empty)
                {
                    int re = Bind();
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
                        Session["Userid"] = null;
                        otpButton.Text = "GET OTP";
                        divOtp.Visible = false;
                        //ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", " toastr.info('Please register with us');", true);
                        //Pop Up Message
                        Response.Redirect("~/signup.aspx");//Redirect to registration page
                    }
                    else
                    {
                        Session["Userid"] = null;
                        otpButton.Text = "GET OTP";
                        divOtp.Visible = false;
                        ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", " toastr.error('Invalid contact or mobile no');", true);
                    }
                }

            }
            else if (otpButton.Text == "SIGN IN")
            {
                if (ViewState["OTPvalue"] != null)
                {
                    if (otpTextBox.Value == ViewState["OTPvalue"].ToString())
                    {
                        Session["Userid"] = hfId.Value;
                        ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", " toastr.success('Logged in successfully');", true);
                        errorLabel.Text = "";
                        Response.Redirect("~/Dashboard.aspx");
                    }
                    else
                    {
                        Session["Userid"] = null;
                        ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", " toastr.success('Inavlid OTP, please enter the correct OTP');", true);
                        errorLabel.Text = "";
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
            return Regex.IsMatch(input, @"^\d{10}$");
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

        protected void resendLinkButton_Click(object sender, EventArgs e)
        {

            //string email = emailTextBox.Text.ToString();
            //if (Bind() > 0)
            //{
            //    string otp = GenerateOTP(6); // Generate a 6-digit OTP
            //    string subject = "# Verification code";
            //    string body = $"<p style=\"text-align: justify\">Please use the verification code below to sign in. If you didn&rsquo;t request this, you can ignore this email.</p>\r\n<p><strong style=\"font-size: 130%\">{otp}</strong>\r\n</span></p>\r\n<p style=\"text-align: justify\">Thanks,&nbsp;</p><p style=\"text-align: justify\">Team Health Files.</p>";
            //    ViewState["OTPvalue"] = otp;
            //    // Session["Userid"] = hfId.Value;
            //    DAL.SendCareerMail(subject, body, email);
            //    otpButton.Text = "SIGN IN";
            //    divOtp.Visible = true;
            //}
            //else
            //{
            //    Session["Userid"] = null;
            //    otpButton.Text = "GET OTP";
            //    divOtp.Visible = true;
            //    //Pop Up Message
            //    Response.Redirect("~/signup.aspx"); //Redirect to registration page
            //}
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




        public string HashPassword(string password)
        {
            using (SHA256 sha256 = SHA256.Create())
            {
                byte[] hashBytes = sha256.ComputeHash(Encoding.UTF8.GetBytes(password));
                return BitConverter.ToString(hashBytes).Replace("-", "").ToLower(); // 64-character hash
            }
        }


        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            using (MySqlConnection con = new MySqlConnection(cs))
            {
                con.Open();
                using (MySqlCommand cmd = new MySqlCommand("usp_login", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    string hashedPassword = HashPassword(txtPassword.Text);

                    cmd.Parameters.AddWithValue("_username", emailTextBox.Text);
                    cmd.Parameters.AddWithValue("_Password", hashedPassword);
                    using (MySqlDataReader dr = cmd.ExecuteReader())
                    {
                        
                        if (dr.Read())
                        {
                           string storedPassword = dr["user_password"].ToString();

                            if (hashedPassword == storedPassword)
                            {

                                Session["IsCustomer"] = true;
                                Session["UserId"] = dr["user_id"].ToString();
                                //Session["role"] = dr["RoleType"].ToString();
                                Session["user_email"] = dr["user_email"].ToString();
                                Session["contact"] = dr["user_contact"].ToString();
                                //FormsAuthentication.RedirectFromLoginPage(emailTextBox.Text, false);
                                //ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", " toastr.success('Logged in successfully');", true);
                                //FormsAuthentication.RedirectFromLoginPage(dr["user_firstname"].ToString() + " " + dr["user_lastname"].ToString(), false);
                                Response.Redirect("Dashboard.aspx");
                                divpassword.Visible = true;
                                ScriptManager.RegisterStartupScript((sender as Control), this.GetType(), Guid.NewGuid().ToString(), "changemodevalue();", true);
                                ScriptManager.RegisterStartupScript((sender as Control), this.GetType(), Guid.NewGuid().ToString(), "handleLogin();", true);
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
                                divOtp.Visible = false;
                                divpassword.Visible = true;
                                ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", " toastr.success('invalid username or password');", true);
                            }
                        }
                        else
                        {
                            divOtp.Visible = false;
                            divpassword.Visible = true;
                            ScriptManager.RegisterStartupScript((sender as Control), this.GetType(), Guid.NewGuid().ToString(), "changemodevalue();", true);
                            ScriptManager.RegisterStartupScript((sender as Control), this.GetType(), Guid.NewGuid().ToString(), "handleLogin();", true);
                            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", " toastr.success('invalid username or password');", true);
                            //ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", "alert('invalid username or password')", true);
                        }
                    }
                }
            }

        }


    }
}