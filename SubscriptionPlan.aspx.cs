using Newtonsoft.Json.Linq;
using Newtonsoft.Json;
using Razorpay.Api;
using System;
using System.Collections.Generic;
using System.Net.Http;
using System.Net.Mail;
using System.Web.UI;
using System.Text;

namespace hfiles
{
    public partial class SubscriptionPlan : System.Web.UI.Page
    {
      //  public string orderId;
        protected void Page_Load(object sender, EventArgs e)
        {


            //if (IsPostBack)
            //{
            GenerateOrderID();
            GenerateOrderID1();
            // }
        }
        private void GenerateOrderID()
        {
            CreateOrder("orderId_basic", 100, "receipt_basic");
        }

        private void GenerateOrderID1()
        {
            CreateOrder("orderId_premium", 500, "receipt_premium");
        }

        private void CreateOrder(string sessionKey, int amount, string receipt)
        {
            try
            {
                string key = "rzp_live_kpCWRpxOkiH9M7";
                string secret = "e1kqeFIRJDAdEoL7V6wq7N7b";

                var client = new HttpClient();
                var byteArray = Encoding.ASCII.GetBytes($"{key}:{secret}");
                client.DefaultRequestHeaders.Authorization = new System.Net.Http.Headers.AuthenticationHeaderValue("Basic", Convert.ToBase64String(byteArray));

                var postData = new
                {
                    amount = amount, // in paise
                    currency = "INR",
                    receipt = receipt,
                    payment_capture = 1
                };

                var json = JsonConvert.SerializeObject(postData);
                var content = new StringContent(json, Encoding.UTF8, "application/json");

                var response = client.PostAsync("https://api.razorpay.com/v1/orders", content).Result;
                var responseString = response.Content.ReadAsStringAsync().Result;

                var result = JsonConvert.DeserializeObject<JObject>(responseString);
                Session[sessionKey] = result["id"]?.ToString();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Order Error: " + ex.Message.Replace("'", "\\'") + "');</script>");
            }
        }
        //private void GenerateOrderID()
        //{
        //    try
        //    {
        //        string key = "rzp_live_kpCWRpxOkiH9M7";
        //        string secret = "e1kqeFIRJDAdEoL7V6wq7N7b";

        //        var client = new HttpClient();
        //        var byteArray = Encoding.ASCII.GetBytes($"{key}:{secret}");
        //        client.DefaultRequestHeaders.Authorization = new System.Net.Http.Headers.AuthenticationHeaderValue("Basic", Convert.ToBase64String(byteArray));

        //        var postData = new
        //        {
        //            amount = 100, // in paise
        //            currency = "INR",
        //            receipt = "receipt#1",
        //            payment_capture = 1
        //        };

        //        var json = JsonConvert.SerializeObject(postData);
        //        var content = new StringContent(json, Encoding.UTF8, "application/json");

        //        var response = client.PostAsync("https://api.razorpay.com/v1/orders", content).Result;
        //        var responseString = response.Content.ReadAsStringAsync().Result;

        //        var result = JsonConvert.DeserializeObject<JObject>(responseString);
        //        Session["orderId"] = result["id"]?.ToString();
        //    }
        //    catch (Exception ex)
        //    {
        //        Response.Write("<script>alert('Order Error: " + ex.Message.Replace("'", "\\'") + "');</script>");
        //    }
        //}

        //private void GenerateOrderID1()
        //{
        //    try
        //    {
        //        string key = "rzp_live_kpCWRpxOkiH9M7";
        //        string secret = "e1kqeFIRJDAdEoL7V6wq7N7b";

        //        var client = new HttpClient();
        //        var byteArray = Encoding.ASCII.GetBytes($"{key}:{secret}");
        //        client.DefaultRequestHeaders.Authorization = new System.Net.Http.Headers.AuthenticationHeaderValue("Basic", Convert.ToBase64String(byteArray));

        //        var postData = new
        //        {
        //            amount = 100, // in paise
        //            currency = "INR",
        //            receipt = "receipt#1",
        //            payment_capture = 1
        //        };

        //        var json = JsonConvert.SerializeObject(postData);
        //        var content = new StringContent(json, Encoding.UTF8, "application/json");

        //        var response = client.PostAsync("https://api.razorpay.com/v1/orders", content).Result;
        //        var responseString = response.Content.ReadAsStringAsync().Result;

        //        var result = JsonConvert.DeserializeObject<JObject>(responseString);
        //        Session["orderId"] = result["id"]?.ToString();
        //    }
        //    catch (Exception ex)
        //    {
        //        Response.Write("<script>alert('Order Error: " + ex.Message.Replace("'", "\\'") + "');</script>");
        //    }
        //}

        //private void GenerateOrderID()
        //{
        //    try
        //    {
        //        System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls12;

        //        Dictionary<string, object> input = new Dictionary<string, object>();
        //        input.Add("amount", 100); // this amount should be same as transaction amount
        //        input.Add("currency", "INR");
        //        input.Add("receipt", "13131");
        //        input.Add("payment_capture", 1);

        //        string key = "rzp_live_kpCWRpxOkiH9M7";
        //        string secret = "e1kqeFIRJDAdEoL7V6wq7N7b";

        //        RazorpayClient client = new RazorpayClient(key, secret);

        //        Razorpay.Api.Order order = client.Order.Create(input);
        //        Session["orderId"] = order["id"].ToString();


        //    }
        //    catch (Exception ex)
        //    {
        //        Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
        //    }
        //}
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
