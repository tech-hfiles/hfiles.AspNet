using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using MySql.Data.MySqlClient;
using MimeKit;
using System.IO;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using Newtonsoft.Json;

namespace hfiles
{
    public class DAL
    {
        public static DataTable ExecuteQuery(string query, CommandType commandType, MySqlParameter[] p)
        {
            string cs = ConfigurationManager.ConnectionStrings["signage"].ConnectionString;
            DataTable dt = new DataTable();
            using (MySqlConnection con = new MySqlConnection(cs))
            {
                con.Open();
                using (MySqlCommand cmd = new MySqlCommand(query, con))
                {
                    cmd.CommandType = commandType;
                    if (p != null)
                        foreach (MySqlParameter param in p)
                            cmd.Parameters.Add(new MySqlParameter { ParameterName = param.ParameterName, Value = param.Value });
                    MySqlDataAdapter da = new MySqlDataAdapter(cmd);
                    da.Fill(dt);
                }
            }
            return dt;
        }
        public static void SendCareerMail(string Subject, string Message, string ToEmail)
        {
            string fromMail = ConfigurationManager.AppSettings["careermailUserId"].ToString();
            string mailPassword = ConfigurationManager.AppSettings["careermailPassword"].ToString();
            int mailPort = Convert.ToInt32(ConfigurationManager.AppSettings["mailPort"]);
            string mailServer = ConfigurationManager.AppSettings["mailServer"].ToString();
            var email = new MimeMessage();
            email.From.Add(new MailboxAddress("H-Files", fromMail));
            email.To.Add(new MailboxAddress("H-FIles-User", ToEmail));
            email.Subject = Subject;
            //email.Body = new TextPart("html")
            //{
            //    Text = Message
            //};

            var bodyBuilder = new BodyBuilder();

            bodyBuilder.HtmlBody = Message;
            //bodyBuilder.Attachments.Add("");
            email.Body = bodyBuilder.ToMessageBody();

            using (var smtp = new MailKit.Net.Smtp.SmtpClient())
            {
                smtp.Connect(mailServer, mailPort, true);
                smtp.Authenticate(fromMail, mailPassword);
                smtp.Send(email);
                smtp.Disconnect(true);
            }
        }
        public void SendMailPDF(string Subject, string Message, string ToEmail, MemoryStream Attachment)
        {
            string fromMail = ConfigurationManager.AppSettings["careermailUserId"].ToString();
            string mailPassword = ConfigurationManager.AppSettings["careermailPassword"].ToString();
            int mailPort = Convert.ToInt32(ConfigurationManager.AppSettings["mailPort"]);
            string mailServer = ConfigurationManager.AppSettings["mailServer"].ToString();
            var email = new MimeMessage();
            email.From.Add(new MailboxAddress("H-Files", fromMail));
            email.To.Add(new MailboxAddress("H-FIles-User", ToEmail));

            email.Subject = Subject;
            var bodyBuilder = new BodyBuilder();

            bodyBuilder.HtmlBody = Message;
            bodyBuilder.Attachments.Add("Document", Attachment.ToArray(), ContentType.Parse("application/pdf"));
            email.Body = bodyBuilder.ToMessageBody();

            using (var smtp = new MailKit.Net.Smtp.SmtpClient())
            {
                smtp.Connect(mailServer, mailPort, false);
                smtp.Authenticate(fromMail, mailPassword);
                smtp.Send(email);
                smtp.Disconnect(true);
            }
        }
        public static void SendOTPApiRequest(string OTP, string MobileNo)
        {
            string url = ConfigurationManager.AppSettings["interaktApiurl"].ToString();
            string apiKey = ConfigurationManager.AppSettings["interaktApiKey"].ToString();

            var requestBody = new
            {
                countryCode = "+91",
                phoneNumber = MobileNo,
                type = "Template",
                callbackData = "some_callback_data",
                template = new
                {
                    name = "otp_template",
                    languageCode = "en",
                    headerValues = new[] { "Alert" },
                    bodyValues = new[] { OTP },
                    buttonValues = new
                    {
                        _0 = new[] { OTP }
                    }
                }
            };

            string jsonContent = JsonConvert.SerializeObject(requestBody);
            string newjsonContent = jsonContent.ToString().Replace("_0", "0");
            var content = new StringContent(newjsonContent, Encoding.UTF8, "application/json");

            using (HttpClient client = new HttpClient())
            {
                client.DefaultRequestHeaders.Add("Authorization", $"Basic {apiKey}");

                try
                {
                    HttpResponseMessage response = client.PostAsync(url, content).Result;

                    if (response.IsSuccessStatusCode)
                    {
                        string responseBody =  response.Content.ReadAsStringAsync().Result;
                        //lblResponse.Text = "Response received: " + responseBody;
                    }
                    else
                    {
                        string errorResponse =  response.Content.ReadAsStringAsync().Result;
                        //lblResponse.Text = $"Error: {response.StatusCode}, Details: {errorResponse}";
                    }
                }
                catch (Exception ex)
                {
                    //lblResponse.Text = $"Exception: {ex.Message}";
                }
            }
        }
        public static DataTable validateDataTable(DataTable dt)
        {
            try
            {
                if (dt != null)
                    if (dt.Rows.Count > 0)
                        return dt;
                    else
                        return dt = new DataTable();
                else
                    return dt = new DataTable();
            }
            catch
            {
                return dt = new DataTable();
            }
        }
        public static decimal validateDouble(object value)
        {
            decimal amount;
            try
            {
                amount = Convert.ToDecimal(value);
            }
            catch
            {
                amount = 0;
            }
            return amount;
        }
        public static double validateDouble_(object value)
        {
            double amount;
            try
            {
                amount = Convert.ToDouble(value);
            }
            catch
            {
                amount = 0;
            }
            return amount;
        }
        public static int validateInt(object value)
        {
            int amount;
            try
            {
                amount = Convert.ToInt32(value);
            }
            catch
            {
                amount = 0;
            }
            return amount;
        }

    }
    public class RequestBody
    {
        public string countryCode { get; set; }
        public string phoneNumber { get; set; }
        public string type { get; set; }
        public string callbackData { get; set; }
        public Template template { get; set; }
    }

    public class Template
    {
        public string name { get; set; }
        public string languageCode { get; set; }
        public string[] headerValues { get; set; }
        public string[] bodyValues { get; set; }
        public ButtonValues buttonValues { get; set; }
    }

    public class ButtonValues
    {
        public string[] _0 { get; set; }
    }


}