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

namespace hfiles
{

    public partial class login : System.Web.UI.Page
    {
        #region Variable
        string cs = ConfigurationManager.ConnectionStrings["signage"].ConnectionString;
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                divOtp.Visible = false;
                otpButton.Text = "GET OTP";
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
                // Usage:
                string email = emailTextBox.Value.ToString();
                if (Bind() > 0)
                {
                    string otp = GenerateOTP(6); // Generate a 6-digit OTP
                    string subject = "One-Time Password (OTP)";
                    string body = $"Your OTP is: {otp}";
                    ViewState["OTPvalue"] = otp;
                    Session["Userid"] = hfId.Value;
                    DAL.SendCareerMail("HFiles, OTP - ", body, email);
                    otpButton.Text = "SIGN IN";
                    divOtp.Visible = true;
                }
                else
                {
                    Session["Userid"] = null;
                    otpButton.Text = "GET OTP";
                    divOtp.Visible = true;
                    //Pop Up Message
                    //Response.Redirect("~/signup.aspx"); //Redirect to registration page
                }
            }
            else if (otpButton.Text == "SIGN IN")
            {
                if (ViewState["OTPvalue"] != null)
                {
                    if (otpTextBox.Value == ViewState["OTPvalue"].ToString())
                    {
                        errorLabel.Text = "";
                        Response.Redirect("~/Samanta.aspx");//Redirect to registration page
                    }
                    else
                    {
                        errorLabel.Text = "Inavlid OTP, please enter the correct OTP.";
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
                        cmd.Parameters.AddWithValue("_MobileNoOrEmail", emailTextBox.Value);
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
    }
}