using System;
using System.Collections.Generic;
using Razorpay.Api;
namespace hfiles
{
    public partial class Charge : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string paymentId = Request.Form["razorpay_payment_id"];
            string orderId = Request.Form["razorpay_order_id"];
            string signature = Request.Form["razorpay_signature"];
            string key = "rzp_live_kpCWRpxOkiH9M7";
            string secret = "e1kqeFIRJDAdEoL7V6wq7N7b";

            try
            {
                // Verify the signature
                Dictionary<string, string> attributes = new Dictionary<string, string>();
                attributes.Add("razorpay_payment_id", paymentId);
                attributes.Add("razorpay_order_id", orderId);
                attributes.Add("razorpay_signature", signature);

                Utils.verifyPaymentSignature(attributes);
                Response.Redirect("MyHFiles.aspx");
                // Payment is successful, update your database
                Response.Write("<h2>Payment Successful!</h2>");
               

            }
            catch (Exception ex)
            {
                // Payment verification failed
                Response.Write("<h2>Payment Failed!</h2>");
                Response.Write($"Error: {ex.Message}");
            }
        }
    }
}