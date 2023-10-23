using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using MySql.Data.MySqlClient;
using MimeKit;

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
            email.Body = new TextPart("html")
            {
                Text = Message
            };

            using (var smtp = new MailKit.Net.Smtp.SmtpClient())
            {
                smtp.Connect(mailServer, mailPort, true);
                smtp.Authenticate(fromMail, mailPassword);
                smtp.Send(email);
                smtp.Disconnect(true);
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


}