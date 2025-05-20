using System;
using System.Collections.Generic;
using System.Net.Mail;
using System.Net;
using System.Security.Cryptography;
using System.Text;
using Microsoft.Graph.Models;
using MySql.Data.MySqlClient;
using System.Data;
using System.Web;
using System.Configuration;
using static System.Windows.Forms.VisualStyles.VisualStyleElement.StartPanel;
using System.Web.UI;
using System.Data.SqlClient;

namespace hfiles
{
    public partial class Charge : System.Web.UI.Page
    {
        public static string cs = ConfigurationManager.ConnectionStrings["signage"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            string paymentId = Request.Form["razorpay_payment_id"];
            string orderId = Request.Form["razorpay_order_id"];
            string signature = Request.Form["razorpay_signature"];

            if (string.IsNullOrEmpty(paymentId) || string.IsNullOrEmpty(orderId) || string.IsNullOrEmpty(signature))
            {
                Response.Write("<script>alert('Missing one or more Razorpay fields');</script>");
                return;
            }

            // Replace this with your Razorpay Secret Key
            string secret = "e1kqeFIRJDAdEoL7V6wq7N7b";

            try
            {

                string payload = orderId + "|" + paymentId;
                string useremail;
                using (var hmac = new HMACSHA256(Encoding.UTF8.GetBytes(secret)))
                {
                    byte[] hash = hmac.ComputeHash(Encoding.UTF8.GetBytes(payload));
                    string plan = Request.Form["plan"];
                    string generatedSignature = BitConverter.ToString(hash).Replace("-", "").ToLower();

                    int userId = DAL.validateInt(HttpContext.Current.Session["Userid"]);
                    string userName;
                    if (generatedSignature == signature)
                    {
                        using (MySqlConnection con = new MySqlConnection(cs))
                        {

                            string com = "SELECT user_email, CONCAT(user_firstname, ' ', user_lastname) AS username\r\nFROM user_details\r\nWHERE user_id =" + userId.ToString();
                            MySqlDataAdapter adpt = new MySqlDataAdapter(com, con);
                            DataTable dt = new DataTable();
                            adpt.Fill(dt);
                            useremail = dt.Rows[0]["user_email"].ToString();
                            userName = dt.Rows[0]["username"].ToString();
                        }
                        // Save to DB if needed here
                        SendConfirmationEmail(useremail, orderId, paymentId, userName);
                        using (MySqlConnection con = new MySqlConnection(cs))
                        {
                            string query = @"UPDATE user_details 
                     SET subscriptionplan_status = @plan, 
                         date_ofsubscriptionPlan = @startDate, 
                         date_ofExpiryPlan = @expiryDate 
                     WHERE user_id = @userId OR user_reference = @userId";

                            using (MySqlCommand cmd = new MySqlCommand(query, con))
                            {
                                DateTime startDate = DateTime.Now;
                                DateTime expiryDate = startDate.AddYears(1); // 1 year from today

                                cmd.Parameters.AddWithValue("@plan", plan);
                                cmd.Parameters.AddWithValue("@startDate", startDate);
                                cmd.Parameters.AddWithValue("@expiryDate", expiryDate);
                                cmd.Parameters.AddWithValue("@userId", userId);

                                con.Open();
                                cmd.ExecuteNonQuery();
                                con.Close();
                            }
                        }

                        Response.Redirect("addbasicdetails.aspx");
                    }
                    else
                    {
                        // Signature mismatch
                        throw new Exception("Signature mismatch");
                    }
                }

                // If signature matches

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Signature verification failed: " + ex.Message.Replace("'", "\\'") + "');</script>");
            }
        }
        private static void SendConfirmationEmail(string toEmail, string orderId, string paymentId, string username)
        {
            MailMessage mail = new MailMessage();
            mail.From = new MailAddress("noreply@hfiles.in", "Health Files Medico Pvt. Ltd.");
            mail.To.Add(toEmail);
            mail.Subject = "Payment Confirmation";
            mail.IsBodyHtml = true;

            mail.Body = $@"
Dear {username},<br><br>

Thank you for your payment!<br><br>

We have successfully received your payment with the following details:<br><br>

<table style='border-collapse: collapse; font-family: Arial;'>
  <tr>
    <td style='padding: 5px 10px;'><strong>Order ID:</strong></td>
    <td style='padding: 5px 10px;'>{orderId}</td>
  </tr>
  <tr>
    <td style='padding: 5px 10px;'><strong>Payment ID:</strong></td>
    <td style='padding: 5px 10px;'>{paymentId}</td>
  </tr>
  <tr>
    <td style='padding: 5px 10px;'><strong>Date:</strong></td>
    <td style='padding: 5px 10px;'>{DateTime.Now.ToString("MMMM dd, yyyy")}</td>
  </tr>
</table><br>

We truly appreciate your business and are grateful for your trust in us.<br>
If you have any questions or need further assistance, feel free to contact our support team.<br><br>

Best regards,<br>
<strong>Health Files Medico Pvt. Ltd.</strong><br>
📧contact@hfiles.in<br>
🌐 hfiles.in
";


            SmtpClient smtp = new SmtpClient();
            smtp.Send(mail);
        }

    }
}
