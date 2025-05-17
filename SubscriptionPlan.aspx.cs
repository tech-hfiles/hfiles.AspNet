using Razorpay.Api;
using System;
using System.Collections.Generic;
using System.Net.Mail;
using System.Web.UI;
using static System.Windows.Forms.VisualStyles.VisualStyleElement.ListView;
namespace hfiles
{
    public partial class SubscriptionPlan : System.Web.UI.Page
    {
        public string orderId;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GenerateOrderID();
            }
        }

        private void GenerateOrderID()
        {
            try
            {
                string key = "rzp_live_kpCWRpxOkiH9M7";
                string secret = "e1kqeFIRJDAdEoL7V6wq7N7b";

                // Create Razorpay client
                RazorpayClient client = new RazorpayClient(key, secret);

                // Define order parameters
                Dictionary<string, object> options = new Dictionary<string, object>()
            {
                { "amount", 9900 },  // Amount in paise (99 INR)
                { "currency", "INR" },
                { "payment_capture", 1 }
            };

                // Create order
                Order order = client.Order.Create(options);

                string orderId = order.Attributes["id"];  // Extract ID correctly


                // Store order ID in ViewState
                orderId = order["id"].ToString();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
            }
        }
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                string toEmail = "contact@hfiles.in"; // Where you want to receive the query
                string fromEmail = txtemail.Text.ToString();
                string message = query.Text.ToString();    // The user’s message

                MailMessage mail = new MailMessage();
                mail.To.Add(toEmail);
                mail.From = new MailAddress(fromEmail);
                mail.Subject = "New Query from Website";
                mail.Body = $"<b>From:</b> {fromEmail}<br/><b>Query:</b><br/>{message}";
                mail.IsBodyHtml = true;

                SmtpClient smtp = new SmtpClient();
                smtp.Send(mail);
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "toastr.success('Thank you! Your message has been sent successfully.')", true);

                // Optionally, you can hide the modal here or keep it open

            }
            catch (Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "toastr.error('Oops! Something went wrong')", true);

            }

            // Keep the modal open after postback
            ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowModal", "$('#queryModal').modal('show');", true);
        }


    }
}
