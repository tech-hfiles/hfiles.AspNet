using MySql.Data.MySqlClient;
using Org.BouncyCastle.Utilities;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Net.Mail;
using System.Net.Mime;
using System.Net;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Xml.Linq;
using static System.Net.WebRequestMethods;
using MimeKit;
using System.Web.Mail;
using System.Web.Services.Description;

namespace hfiles
{
    public partial class reports : System.Web.UI.Page
    {
        #region Variable
        string cs = ConfigurationManager.ConnectionStrings["signage"].ConnectionString;
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            int RId = DAL.validateInt(Request.QueryString["rid"]);

            if (!IsPostBack)
            {
                getReportType(RId);
                getReportMaster();
                if (Request.QueryString["rid"] != null)
                {
                    //int RId = DAL.validateInt(Request.QueryString["rid"]);
                    if (RId > 0)
                    {
                        //int UserId = DAL.validateInt(Session["Userid"].ToString());
                        int UserId = int.Parse(Session["Userid"].ToString());
                        //Reports(UserId, RId);
                        UserReports(UserId, RId);
                    }
                }
                //Session[""];
            }
        }

        public void getReportType(int RId)
        {
            try
            {
                using (MySqlConnection con = new MySqlConnection(cs))
                {
                    con.Open();
                    using (MySqlCommand cmd = new MySqlCommand("usp_GetReportType", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("_reportId", DAL.validateInt(RId));
                        cmd.Parameters.AddWithValue("_SpType", "R");
                        cmd.Parameters.AddWithValue("_Result", SqlDbType.Int);
                        cmd.Parameters["_Result"].Direction = ParameterDirection.Output;

                        MySqlDataReader sdr = cmd.ExecuteReader();
                        while (sdr.Read())
                        {
                            string reporttype = sdr["Name"].ToString();
                            //lbltype.Text = reporttype;
                            lblReportType.Text = reporttype;
                        }
                        con.Close();
                    }
                }
            }
            catch (Exception Ex)
            {
            }
        }


        public void Reports(int UserId, int reportId)
        {
            int memberId = Convert.ToInt32(Session["memberId"]);
            int result = 0;
            try
            {
                using (MySqlConnection con = new MySqlConnection(cs))
                {
                    con.Open();
                    using (MySqlCommand cmd = new MySqlCommand("usp_addreport", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("_UserId", DAL.validateInt(UserId));
                        cmd.Parameters.AddWithValue("_reportname", "");
                        cmd.Parameters.AddWithValue("_reporturl", "");
                        cmd.Parameters.AddWithValue("_reportId", DAL.validateInt(reportId));
                        cmd.Parameters.AddWithValue("_memberId", DAL.validateInt(memberId));
                        cmd.Parameters.AddWithValue("_SpType", "R");
                        cmd.Parameters.AddWithValue("_Result", SqlDbType.Int);
                        cmd.Parameters["_Result"].Direction = ParameterDirection.Output;
                        MySqlDataAdapter da = new MySqlDataAdapter(cmd);
                        DataTable dt = new DataTable();
                        da.Fill(dt);
                        if (dt != null && dt.Rows.Count > 0)
                        {
                            //tcount.InnerHtml = dt.Rows.Count.ToString();
                            rptReports.DataSource = dt;
                            rptReports.DataBind();
                            divUpload_Doc.Visible = false;
                        }
                        else
                        {
                            divUpload_Doc.Visible = true;
                            rptReports.DataSource = null;
                            rptReports.DataBind();

                        }
                    }
                }
            }
            catch (Exception Ex)
            {
            }
        }
        public void UserReports(int UserId, int ReportId)
        {
            int result = 0;
            try
            {
                int memberId = Convert.ToInt32(Session["memberId"]);
                if (memberId > 0)
                {
                    using (MySqlConnection con = new MySqlConnection(cs))
                    {
                        con.Open();
                        using (MySqlCommand cmd = new MySqlCommand("usp_getreport", con))
                        {
                            cmd.CommandType = CommandType.StoredProcedure;
                            cmd.Parameters.AddWithValue("_UserId", DAL.validateInt(memberId));
                            cmd.Parameters.AddWithValue("_reportId", DAL.validateInt(ReportId));

                            MySqlDataAdapter da = new MySqlDataAdapter(cmd);
                            DataTable dt = new DataTable();
                            da.Fill(dt);
                            if (dt != null && dt.Rows.Count > 0)
                            {
                                //tcount.InnerHtml = dt.Rows.Count.ToString();
                                rptReports.DataSource = dt;
                                rptReports.DataBind();
                                divUpload_Doc.Visible = false;
                            }
                            else
                            {
                                divUpload_Doc.Visible = true;
                                rptReports.DataSource = null;
                                rptReports.DataBind();

                            }
                        }
                    }
                }
                else
                {
                    using (MySqlConnection con = new MySqlConnection(cs))
                    {
                        con.Open();
                        using (MySqlCommand cmd = new MySqlCommand("usp_getreport", con))
                        {
                            cmd.CommandType = CommandType.StoredProcedure;
                            cmd.Parameters.AddWithValue("_UserId", DAL.validateInt(UserId));
                            cmd.Parameters.AddWithValue("_reportId", DAL.validateInt(ReportId));

                            MySqlDataAdapter da = new MySqlDataAdapter(cmd);
                            DataTable dt = new DataTable();
                            da.Fill(dt);
                            if (dt != null && dt.Rows.Count > 0)
                            {
                                //tcount.InnerHtml = dt.Rows.Count.ToString();
                                rptReports.DataSource = dt;
                                rptReports.DataBind();
                                divUpload_Doc.Visible = false;
                            }
                            else
                            {
                                divUpload_Doc.Visible = true;
                                rptReports.DataSource = null;
                                rptReports.DataBind();

                            }
                        }
                    }
                }
                Session["memberId"] = 0;
            }
            catch (Exception Ex)
            {
            }
        }
        protected void getReportMaster()
        {
            try
            {
                using (MySqlConnection con = new MySqlConnection(cs))
                {
                    con.Open();
                    using (MySqlCommand cmd = new MySqlCommand("usp_getreportmaster", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.ExecuteNonQuery();

                        MySqlDataAdapter da = new MySqlDataAdapter(cmd);
                        DataTable dt = new DataTable();
                        da.Fill(dt);
                        if (dt != null && dt.Rows.Count > 0)
                        {

                            //ddlReports.DataSource = dt;
                            //ddlReports.DataTextField = "Name";
                            //ddlReports.DataValueField = "Id";
                            //ddlReports.DataBind();

                            //ddlReports.Items.Insert(0, new ListItem("Select Report", "0"));
                        }
                        else
                        {
                            //ddlReports.Items.Insert(0, new ListItem("No Reports", "0"));
                        }

                    }
                }

            }
            catch (Exception Ex)
            {

            }
        }

        protected void SearchInput_TextChanged(object sender, EventArgs e)
        {
            int RId = DAL.validateInt(Request.QueryString["rid"]);
            DataTable dt;

            try
            {
                using (MySqlConnection con = new MySqlConnection(cs))
                {
                    con.Open();
                    using (MySqlCommand cmd = new MySqlCommand("usp_addreport", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("_UserId", DAL.validateInt(Session["Userid"].ToString()));
                        cmd.Parameters.AddWithValue("_reportname", "");
                        cmd.Parameters.AddWithValue("_reporturl", "");
                        cmd.Parameters.AddWithValue("_reportId", DAL.validateInt(RId));
                        cmd.Parameters.AddWithValue("_SpType", "R");
                        cmd.Parameters.AddWithValue("_Result", SqlDbType.Int);
                        cmd.Parameters["_Result"].Direction = ParameterDirection.Output;
                        MySqlDataAdapter da = new MySqlDataAdapter(cmd);
                        dt = new DataTable();
                        da.Fill(dt);
                        if (dt != null && dt.Rows.Count > 0)
                        {
                            //tcount.InnerHtml = dt.Rows.Count.ToString();
                            string searchTerm = SearchInput.Text;

                            // Filter the DataTable based on the search term.
                            DataTable filteredData = new DataTable();
                            filteredData = dt.Clone(); // Clone the structure of the original DataTable.

                            foreach (DataRow row in dt.Rows)
                            {
                                if (row["reportname"].ToString().Contains(searchTerm))
                                {
                                    filteredData.ImportRow(row);
                                }
                            }

                            // Bind the filtered DataTable to the Repeater.
                            rptReports.DataSource = filteredData;
                            rptReports.DataBind();
                        }
                        else
                        {
                            rptReports.DataSource = dt;
                            rptReports.DataBind();
                        }
                    }
                }
            }
            catch (Exception Ex)
            {
            }
        }

        protected void lbtnremove_Click(object sender, EventArgs e)
        {
            int RId = DAL.validateInt(Request.QueryString["rid"]);
            LinkButton lbtnimg = (LinkButton)(sender);

            string commandArgument = lbtnimg.CommandArgument;
            //string[] values = commandArgument.Split('|');

            //int ReportId = 0;
            //int Id = 0;


            //if (values.Length == 2)
            //{
            //    string RId = values[0];
            //    string UId = values[1];
            //    Session["U"]
            //    int ReportId = Convert.ToInt32(RId);
            //    int Id = Convert.ToInt32(UId);
            //}

            //int ReportId = DAL.validateInt(lbtnimg.CommandArgument.ToString());
            int Id = DAL.validateInt(lbtnimg.CommandArgument.ToString());
            int UserId = DAL.validateInt(Session["Userid"].ToString());//
            using (MySqlConnection connection = new MySqlConnection(cs))
            {
                connection.Open();
                using (MySqlCommand cmd = new MySqlCommand("removeReport", connection))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("_UserId", UserId);
                    cmd.Parameters.AddWithValue("_Id", Id);
                    cmd.Parameters.AddWithValue("_Result", SqlDbType.Int);
                    cmd.Parameters["_Result"].Direction = ParameterDirection.Output;
                    cmd.ExecuteNonQuery();
                    int retVal = Convert.ToInt32(cmd.Parameters["_Result"].Value);

                    if (retVal == 1)
                    {
                        //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Report deleted successfully')", true);
                        //Reports(UserId, RId);
                        string script = "<script type=\"text/javascript\"> launch_toast('Done'); </script>";
                        ClientScript.RegisterStartupScript(this.GetType(), "reportalert", script);
                        //lbtn_GetClickedCategoryData(DAL.validateInt(Session["CatId"]));
                        //Session["CatId"] = null;
                    }
                    else
                    {
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please try again')", true);
                    }
                }
            }

        }

        protected void lbtnShare_Click(object sender, EventArgs e)
        {
            LinkButton lnk = sender as LinkButton;
            int reportId = Convert.ToInt16(lnk.CommandArgument);
            //int reportId = Convert.ToInt32(Session["memberId"]);
            //nt UserId = Convert.ToInt32(Session["Userid"].ToString());
            //int reportId = Convert.ToInt32(Session["memberId"]);
            using (MySqlConnection con = new MySqlConnection(cs))
            {
                con.Open();

                using (MySqlCommand cmd = new MySqlCommand("usp_addreport", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("_UserId", DAL.validateInt(Session["Userid"].ToString()));
                    cmd.Parameters.AddWithValue("_reportname", "");
                    cmd.Parameters.AddWithValue("_reporturl", "");
                    cmd.Parameters.AddWithValue("_reportId", DAL.validateInt(reportId));
                    cmd.Parameters.AddWithValue("_memberId", 0);
                    cmd.Parameters.AddWithValue("_SpType", "R");
                    cmd.Parameters.AddWithValue("_Result", SqlDbType.Int);
                    cmd.Parameters["_Result"].Direction = ParameterDirection.Output;
                    MySqlDataAdapter da = new MySqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    if (dt != null && dt.Rows.Count > 0)
                    {
                        MySqlDataReader sdr = cmd.ExecuteReader();
                        while (sdr.Read())
                        {
                            string message3 = sdr["ReportUrl"].ToString();
                            string whatsappLink2 = "https://wa.me/?text=" + Uri.EscapeDataString(message3);
                            Response.Redirect(whatsappLink2);

                        }
                        //string message1 = dt.ToString();

                        //string whatsappLink1 = "https://wa.me/?text=" + Uri.EscapeDataString(message1);
                        //Response.Redirect(whatsappLink1);
                    }
                    else
                    {
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Report Not Found')", true);

                    }
                }
            }
            string message = "Check out this cool content: " + Request.Url.AbsoluteUri;

            string whatsappLink = "https://wa.me/?text=" + Uri.EscapeDataString(message);
            Response.Redirect(whatsappLink);
        }

        
        protected void SendEmailWithAttachment()
        {
            // Replace these values with your SMTP server details
            string smtpServer = "your-smtp-server.com";
            int smtpPort = 587;
            string smtpUsername = "your-username";
            string smtpPassword = "your-password";

            // Sender and recipient email addresses
            string senderEmail = "chetan@digitaledgetech.in";
            string recipientEmail = "chetanpattan01@gmail.com";

            // Create the email message
            System.Net.Mail.MailMessage mailMessage = new System.Net.Mail.MailMessage(senderEmail, recipientEmail);
            mailMessage.Subject = "Subject of the email";
            mailMessage.Body = "Body of the email";

            var bodybuilder = new BodyBuilder();
            //bodybuilder.HtmlBody = ;

            // Attach the PDF file
            string pdfFilePath = Server.MapPath("~/path-to-your-pdf/your-file.pdf");
            Attachment attachment = new Attachment(pdfFilePath, MediaTypeNames.Application.Pdf);
            System.Net.Mime.ContentDisposition disposition = attachment.ContentDisposition;
            disposition.CreationDate = System.IO.File.GetCreationTime(pdfFilePath);
            disposition.ModificationDate = System.IO.File.GetLastWriteTime(pdfFilePath);
            disposition.ReadDate = System.IO.File.GetLastAccessTime(pdfFilePath);
            mailMessage.Attachments.Add(attachment);

            // Configure the SMTP client
            SmtpClient smtpClient = new SmtpClient(smtpServer, smtpPort);
            smtpClient.Credentials = new NetworkCredential(smtpUsername, smtpPassword);
            smtpClient.EnableSsl = true;

            try
            {
                // Send the email
                smtpClient.Send(mailMessage);
                // Optionally, display a success message or redirect to another page
                Response.Write("Email sent successfully!");
            }
            catch (Exception ex)
            {
                // Handle exceptions, e.g., display an error message
                Response.Write("Error sending email: " + ex.Message);
            }
        }

        protected void lbtnShareMail_Click(object sender, EventArgs e)
        {
            string url = Request.Url.AbsoluteUri;
            string email = "chetan@digitaledgetech.in";
            string subject = "# Verification code";
            string body = $"<p style=\"text-align: justify\">Please click on the below lick to view reports.</p>\r\n<p><strong style=\"font-size: 130%\">{url}</strong>\r\n</span></p>\r\n<p style=\"text-align: justify\">Thanks,&nbsp;</p><p style=\"text-align: justify\">Team Health Files.</p>";
            string pdfFilePath = Server.MapPath("~/path-to-your-pdf/your-file.pdf");
            Attachment attachment = new Attachment(pdfFilePath, MediaTypeNames.Application.Pdf);
            DAL.SendCareerMail(subject, body, email);
            DAL.SendMailPDF(subject, body, email, pdfFilePath);
            //SendEmailWithAttachment();
        }
    }
}
