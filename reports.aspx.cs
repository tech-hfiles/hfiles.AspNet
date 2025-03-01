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
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.IO;
using System.Xml.Linq;
using static System.Net.WebRequestMethods;
using MimeKit;
using System.Web.Mail;
using System.Web.Services.Description;
using MimeKit.Text;
using MimeKit.Utils;
using MySqlX.XDevAPI;
using System.Web.SessionState;
using System.Text.RegularExpressions;
using System.Diagnostics;
using System.Data.SqlClient;
using System.Runtime.InteropServices.ComTypes;
using Org.BouncyCastle.Asn1.Cmp;
using System.Text;
using System.IO.Compression;
using System.Web.Caching;
using Azure;
using Microsoft.Graph.Models.TermStore;

namespace hfiles
{
    public partial class reports : System.Web.UI.Page
    {
        #region Variable
        string cs = ConfigurationManager.ConnectionStrings["signage"].ConnectionString;
        string reporturl;
        #endregion
        string memberRelation, message, icon;
        int RId;
        DataTable dtMemberList = new DataTable();
        private string fileName;
        private SqlConnection con;
        private object ReportId;
        private object UserId;
        private LinkButton sender;
        private object dr;
        private object Id;
        private object token;
        private string baseUrl;
        private string fileExtension;
        private string fileUrl;


        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!IsPostBack)
            //{
            //    FetchData(21);
            //}


            Panel1.Visible = false;
            int RId = DAL.validateInt(Request.QueryString["rid"]);

            if (!IsPostBack)
            {
               

                if (Session["Userid"] != null)
                {
                    getMembersList();
                    getReportType(RId);
                    getReportMaster();
                    // ShowPreview();
                    BindRepeater();



                }
                else
                {
                    Response.Redirect("~/login.aspx");
                }
                if (Request.QueryString["rid"] != null)
                {
                    //int RId = DAL.validateInt(Request.QueryString["rid"]);
                    if (RId > 0)
                    {
                        //int UserId = DAL.validateInt(Session["Userid"].ToString());
                        int UserId = int.Parse(Session["Userid"].ToString());
                        //Reports(UserId, RId);
                        //below condition is added newly for reports access
                        if (Session["memberId"] != null && Convert.ToInt32(Session["memberId"]) > 0)
                        {
                            UserReports(Convert.ToInt32(Session["memberId"]), RId);
                            string Membersname = Session["Membersname"].ToString();
                            lblusermIreport.Text = Session["Membersname"].ToString() + "'S";
                        }
                        else
                        {
                            UserReports(UserId, RId);
                            string Membersname = Session["username"].ToString();
                            lblusermIreport.Text = Session["username"].ToString() + "'S";
                        }

                        //UserReports(UserId, RId);
                    }
                }
                //Session[""];
            }
        }
        //protected string getName(int user_id)
        //{
        //    //usp_commonproductvariation
        //    //string sptype = "BIND";
        //    string username = "";
        //    using (MySqlConnection con = new MySqlConnection(cs))
        //    {
        //        con.Open();
        //        using (MySqlCommand cmd = new MySqlCommand("usp_getuserdetailsbyId", con))
        //        {
        //            cmd.CommandType = CommandType.StoredProcedure;
        //            cmd.Parameters.AddWithValue("_user_id", DAL.validateInt(user_id));
        //            //cmd.Parameters.AddWithValue("_SpType", sptype);
        //            //cmd.Parameters.Add("_Result", MySqlDbType.Int32).Direction = ParameterDirection.Output;

        //            MySqlDataAdapter da = new MySqlDataAdapter(cmd);
        //            DataTable dt = new DataTable();
        //            da.Fill(dt);
        //            if (dt != null && dt.Rows.Count > 0)
        //            {


        //                username= dt.Rows[0]["user_firstname"].ToString();




        //            }

        //        }
        //    }
        //}

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
                int loginuser = Convert.ToInt32(Session["Userid"]);

                int DependentUserIdMember = DAL.validateInt(Session["DependentUserIdMember"]);
                int Dependent_User_Reference = DAL.validateInt(Session["Dependent_User_Reference"]);
                int user_referenceId = Convert.ToInt32(Session["user_reference"]);

                if (Session["memberRelation"] == null || Session["memberRelation"] == "")
                {
                    memberRelation = "Self";
                }
                else
                {
                    memberRelation = Session["memberRelation"].ToString();
                }

                //if (memberRelation == "Son" || memberRelation == "daughter" || memberRelation == "cat" || memberRelation == "Dog" || memberRelation == "GrandFather" || memberRelation == "GrandMother") //&& age < 17 || age > 70
                //{

                //}
                //if (user_referenceId > 0 && memberId > 0 && ((IsValidEmail(Session["user_reference_email"]) == true && IsValidEmail(Session["user_email"]) == true) ? Session["user_reference_email"].ToString() == Session["user_email"].ToString() : false))
                if (user_referenceId > 0 && memberId > 0 && user_referenceId == loginuser)
                {
                    using (MySqlConnection con = new MySqlConnection(cs))
                    {
                        con.Open();
                        using (MySqlCommand cmd = new MySqlCommand("usp_addreportwithaccess", con))
                        {
                            cmd.CommandType = CommandType.StoredProcedure;
                            cmd.Parameters.AddWithValue("_UserId", loginuser);// memberId);/* DAL.validateInt(Session["Userid"].ToString())*/
                            cmd.Parameters.AddWithValue("_reportId", DAL.validateInt(ReportId));
                            cmd.Parameters.AddWithValue("_memberId", user_referenceId);// DAL.validateInt(Session["Userid"].ToString()));/*UserId*/
                            cmd.Parameters.AddWithValue("_reportname", "");
                            cmd.Parameters.AddWithValue("_rId", memberId);
                            cmd.Parameters.AddWithValue("_reporturl", "");
                            cmd.Parameters.AddWithValue("_FileSize", 0);
                            cmd.Parameters.AddWithValue("_SpType", "LR");
                            cmd.Parameters.AddWithValue("_UploadType", "dependent");
                            cmd.Parameters.AddWithValue("_Result", SqlDbType.Int);
                            cmd.Parameters["_Result"].Direction = ParameterDirection.Output;
                            MySqlDataAdapter da = new MySqlDataAdapter(cmd);
                            DataTable dt = new DataTable();
                            da.Fill(dt);
                            if (dt != null && dt.Rows.Count > 0)
                            {
                                //if (memberId != Convert.ToInt32(Session["Userid"].ToString()))
                                //{

                                //}
                                //tcount.InnerHtml = dt.Rows.Count.ToString();
                                rptReports.DataSource = dt;
                                rptReports.DataBind();
                                divUpload_Doc.Visible = false;
                                MySqlDataReader sdr = cmd.ExecuteReader();
                                while (sdr.Read())
                                {
                                    reporturl = sdr["ReportUrl"].ToString();
                                    Session["reporturl"] = reporturl;
                                }
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
                else if (memberId > 0 && memberId == DependentUserIdMember)
                {
                    using (MySqlConnection con = new MySqlConnection(cs))
                    {
                        con.Open();
                        using (MySqlCommand cmd = new MySqlCommand("usp_addreportwithaccess", con))
                        {
                            cmd.CommandType = CommandType.StoredProcedure;
                            cmd.Parameters.AddWithValue("_UserId", DAL.validateInt(Session["Userid"].ToString()));// memberId);/* DAL.validateInt(Session["Userid"].ToString())*/
                            cmd.Parameters.AddWithValue("_reportId", DAL.validateInt(ReportId));
                            cmd.Parameters.AddWithValue("_memberId", user_referenceId);// memberId);// DAL.validateInt(Session["Userid"].ToString()));/*UserId*/
                            cmd.Parameters.AddWithValue("_reportname", "");
                            cmd.Parameters.AddWithValue("_rId", memberId);
                            cmd.Parameters.AddWithValue("_reporturl", "");
                            cmd.Parameters.AddWithValue("_FileSize", 0);
                            cmd.Parameters.AddWithValue("_SpType", "LR");
                            cmd.Parameters.AddWithValue("_UploadType", "dependent");
                            cmd.Parameters.AddWithValue("_Result", SqlDbType.Int);
                            cmd.Parameters["_Result"].Direction = ParameterDirection.Output;
                            MySqlDataAdapter da = new MySqlDataAdapter(cmd);
                            DataTable dt = new DataTable();
                            da.Fill(dt);
                            if (dt != null && dt.Rows.Count > 0)
                            {
                                //if (memberId != Convert.ToInt32(Session["Userid"].ToString()))
                                //{

                                //}
                                //tcount.InnerHtml = dt.Rows.Count.ToString();
                                rptReports.DataSource = dt;
                                rptReports.DataBind();
                                divUpload_Doc.Visible = false;
                                MySqlDataReader sdr = cmd.ExecuteReader();
                                while (sdr.Read())
                                {
                                    reporturl = sdr["ReportUrl"].ToString();
                                    Session["reporturl"] = reporturl;
                                }
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
                else if (memberId > 0)
                {
                    using (MySqlConnection con = new MySqlConnection(cs))
                    {
                        con.Open();
                        using (MySqlCommand cmd = new MySqlCommand("usp_addreportwithaccess", con))
                        {
                            cmd.CommandType = CommandType.StoredProcedure;
                            cmd.Parameters.AddWithValue("_UserId", DAL.validateInt(Session["Userid"].ToString()));// memberId);/* DAL.validateInt(Session["Userid"].ToString())*/
                            cmd.Parameters.AddWithValue("_reportId", DAL.validateInt(ReportId));

                            cmd.Parameters.AddWithValue("_reportname", "");
                            cmd.Parameters.AddWithValue("_rId", memberId);
                            cmd.Parameters.AddWithValue("_reporturl", "");
                            cmd.Parameters.AddWithValue("_FileSize", 0);
                            cmd.Parameters.AddWithValue("_SpType", "LR");
                            if (user_referenceId > 0)
                            {
                                cmd.Parameters.AddWithValue("_UploadType", "dependent");
                                cmd.Parameters.AddWithValue("_memberId", user_referenceId);// DAL.validateInt(Session["Userid"].ToString()));/*UserId*/
                            }
                            else
                            {
                                cmd.Parameters.AddWithValue("_memberId", memberId);// DAL.validateInt(Session["Userid"].ToString()));/*UserId*/
                                cmd.Parameters.AddWithValue("_UploadType", "");
                            }

                            cmd.Parameters.AddWithValue("_Result", SqlDbType.Int);
                            cmd.Parameters["_Result"].Direction = ParameterDirection.Output;
                            MySqlDataAdapter da = new MySqlDataAdapter(cmd);
                            DataTable dt = new DataTable();
                            da.Fill(dt);
                            if (dt != null && dt.Rows.Count > 0)
                            {
                                //if (memberId != Convert.ToInt32(Session["Userid"].ToString()))
                                //{

                                //}
                                //tcount.InnerHtml = dt.Rows.Count.ToString();
                                rptReports.DataSource = dt;
                                rptReports.DataBind();
                                divUpload_Doc.Visible = false;
                                MySqlDataReader sdr = cmd.ExecuteReader();
                                while (sdr.Read())
                                {
                                    reporturl = sdr["ReportUrl"].ToString();
                                    Session["reporturl"] = reporturl;
                                }
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
                                DataView dv = dt.DefaultView;
                                dv.RowFilter = "UploadType <> 'dependent'"; // Exclude "dependent"
                                DataTable filteredDt = dv.ToTable();

                                rptReports.DataSource = filteredDt;
                                //tcount.InnerHtml = dt.Rows.Count.ToString();
                                rptReports.DataBind();
                                divUpload_Doc.Visible = false;
                                MySqlDataReader sdr = cmd.ExecuteReader();
                                while (sdr.Read())
                                {
                                    reporturl = sdr["ReportUrl"].ToString();
                                    Session["reporturl"] = reporturl;
                                }
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
                //Session["memberId"] = 0;
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
                        cmd.Parameters.AddWithValue("_memberId", DAL.validateInt(RId));
                        cmd.Parameters.AddWithValue("_SpType", "UR");
                        cmd.Parameters.AddWithValue("_Result", SqlDbType.Int);
                        cmd.Parameters["_Result"].Direction = ParameterDirection.Output;
                        MySqlDataAdapter da = new MySqlDataAdapter(cmd);
                        dt = new DataTable();
                        da.Fill(dt);

                        if (dt != null && dt.Rows.Count > 0)
                        {
                            string searchTerm = SearchInput.Text.Trim();

                            // Clone the structure of the original DataTable
                            DataTable filteredData = dt.Clone();

                            // Perform case-insensitive search
                            foreach (DataRow row in dt.Rows)
                            {
                                if (row["ReportName"].ToString().IndexOf(searchTerm, StringComparison.OrdinalIgnoreCase) >= 0)
                                {
                                    filteredData.ImportRow(row);
                                }
                            }

                            // Bind filtered data (or original if no matches)
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
                        ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", " toastr.success('Report deleted successfully');", true);
                        UserReports(UserId, RId);
                        //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Report deleted successfully')", true);
                        //Reports(UserId, RId);
                        //icon = "assets/select.png";
                        //message = "Report Deleted Sucessfully !";
                        //string script = "<script type=\"text/javascript\"> launch_toast('" + message + "','\"+icon+\"'); </script>";
                        //ClientScript.RegisterStartupScript(this.GetType(), "reportalert", script);
                        //lbtn_GetClickedCategoryData(DAL.validateInt(Session["CatId"]));
                        //Session["CatId"] = null;
                    }
                    else
                    {
                        //icon = "assets/not-select-red.png";
                        //message = "Please Try Again !";
                        //string script = "<script type=\"text/javascript\"> launch_toast('" + message + "','" + icon + "'); </script>";
                        //ClientScript.RegisterStartupScript(this.GetType(), "reportalert", script);
                        //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please try again')", true);
                        ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", " toastr.success('No rights');", true);
                        UserReports(UserId, RId);
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

        //protected void lbtnShareMail_Click(object sender, EventArgs e)
        //{
        //    reporturl = Session["reporturl"].ToString();
        //    System.Net.Mail.MailMessage mailMessage = new System.Net.Mail.MailMessage();
        //    string url = Request.Url.AbsoluteUri;
        //    string email = "chetan@digitaledgetech.in";
        //    string subject = "HFiles - Report";
        //    string body = $"<p style=\"text-align: justify\">Thank You For Using HFiles.</p>\r\n\r\n<p style=\"text-align: justify\">Thanks,&nbsp;</p><p style=\"text-align: justify\">Team Health Files.</p>";
        //    //string pdfFilePath = Server.MapPath("~/");
        //    //Attachment attachment = new Attachment(pdfFilePath, MediaTypeNames.Application.Pdf);
        //    //mailMessage.Attachments.Add(attachment);
        //    string attachmentFilePath = Server.MapPath("~/upload/report/" + Session["reporturl"].ToString());
        //    //string attachmentFilePath = "http://68.178.164.174//upload/report/ "+ reporturl;

        //    SendMail(subject, body, email, attachmentFilePath);
        //    DAL.SendCareerMail(subject, body, email);
        //    //DAL.SendMailPDF(subject, body, email, pdfFilePath);
        //    //SendEmailWithAttachment();
        //}

        public static void SendMail(string Subject, string messageBody, string ToEmail, string attachmentFilePath)
        {
            string fromMail = ConfigurationManager.AppSettings["careermailUserId"].ToString();
            string mailPassword = ConfigurationManager.AppSettings["careermailPassword"].ToString();
            int mailPort = Convert.ToInt32(ConfigurationManager.AppSettings["mailPort"]);
            string mailServer = ConfigurationManager.AppSettings["mailServer"].ToString();
            var email = new MimeMessage();
            email.From.Add(new MailboxAddress("H-Files", fromMail));
            email.To.Add(new MailboxAddress("H-FIles-User", ToEmail));
            email.Subject = Subject;
            var body = new TextPart("html")
            {
                Text = messageBody
            };
            var multipart = new Multipart("mixed");
            multipart.Add(body);

            var attachment = new MimeKit.MimePart("application", "pdf")
            {
                Content = new MimeContent(System.IO.File.OpenRead(attachmentFilePath), ContentEncoding.Default),
                ContentDisposition = new MimeKit.ContentDisposition(MimeKit.ContentDisposition.Attachment),
                ContentTransferEncoding = ContentEncoding.Base64,
                //FileName = Path.GetFileName(attachmentFilePath)
                FileName = attachmentFilePath
            };
            multipart.Add(attachment);
            email.Body = multipart;
            using (var smtp = new MailKit.Net.Smtp.SmtpClient())
            {
                smtp.Connect(mailServer, mailPort, true);
                smtp.Authenticate(fromMail, mailPassword);
                smtp.Send(email);
                smtp.Disconnect(true);
            }
        }

        protected void okLinkButton_Click(object sender, EventArgs e)
        {
            //mp1.Hide();

        }
        protected void lbtnEdit_Click(object sender, EventArgs e)
        {


            int memberId = Convert.ToInt32(Session["memberId"]);
            int user_referenceId = Convert.ToInt32(Session["user_reference"]);
            //if (user_referenceId > 0 && memberId > 0 && ((IsValidEmail(Session["user_reference_email"]) == true && IsValidEmail(Session["user_email"]) == true) ? Session["user_reference_email"].ToString() == Session["user_email"].ToString() : false))
            //{
            //    ddlMembers2.Visible = false;
            //}
            //else
            //{
            //    ddlMembers2.Visible = true;
            //}
            ddlMembers2.ClearSelection();
            lblNoMember.Text = string.Empty;
            LinkButton lnk = sender as LinkButton;
            int reportId = Convert.ToInt16(lnk.CommandArgument);
            Session["ReportUniqueId"] = reportId;

            mp1.Show();
            int Id = DAL.validateInt(lnk.CommandArgument.ToString());

            RId = DAL.validateInt(Request.QueryString["rid"]);
            int UserId = DAL.validateInt(Session["Userid"].ToString());
            try
            {
                //ddlMembers2.Items.Clear();
                using (MySqlConnection con = new MySqlConnection(cs))
                {
                    con.Open();
                    using (MySqlCommand cmd = new MySqlCommand("usp_getmember", con)) /*usp_getMembers*/
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("_UserId", UserId);
                        cmd.Parameters.AddWithValue("_MemberId", 0);
                        cmd.Parameters.AddWithValue("_SpType", "E");
                        cmd.Parameters.AddWithValue("_ReportId", RId);
                        cmd.Parameters.AddWithValue("_RId", reportId);
                        cmd.ExecuteNonQuery();
                        MySqlDataAdapter da = new MySqlDataAdapter(cmd);
                        DataTable dt = new DataTable();
                        da.Fill(dt);

                        Console.WriteLine($"DataTable Rows: {dt.Rows.Count}");

                        if (dt != null)
                        {

                            //DataTable sessionTable = Session["dtMemberList"] as DataTable;
                            //if (sessionTable == null)
                            //{
                            //    Console.WriteLine("Session['dtMemberList'] is null");
                            //}
                            //for merging 2 datatables
                            DataTable mergedTable = MergeDataTables(Session["dtMemberList"] as DataTable, dt);

                            var filteredRows = mergedTable.AsEnumerable()
     .Where(row =>
     {
         var isDependentValue = row["IsDependent"];

         // Ensure value is not null and is convertible to an integer
         if (isDependentValue != DBNull.Value && int.TryParse(isDependentValue.ToString(), out int isDependent))
         {
             return isDependent == 0; // Only independent members
         }
         return false; // Exclude if null or not valid
     });

                            if (filteredRows.Any())
                            {
                                mergedTable = filteredRows.CopyToDataTable();
                            }
                            else
                            {
                                mergedTable = mergedTable.Clone(); // Empty table with same structure
                            }

                            //ddlMembers2.DataSource = dt;

                            ddlMembers2.DataSource = mergedTable;
                            ddlMembers2.DataTextField = "user_FirstName";
                            ddlMembers2.DataValueField = "user_Id";
                            ddlMembers2.DataBind();
                            //ddlMembers2.Items.Insert(0, new ListItem("Select Member", "0"));

                            // Get selected members based on report ID
                            List<string> selectedMembers = new List<string>();
                            foreach (DataRow row in dt.Rows)
                            {
                                selectedMembers.Add(row["user_Id"].ToString());
                            }

                            // Iterate through DropDownList items to select pre-selected members
                            foreach (ListItem item in ddlMembers2.Items)
                            {
                                if (selectedMembers.Contains(item.Value))
                                {
                                    item.Selected = true;
                                }
                            }
                            mp1.Show();
                            Panel1.Visible = true;
                        }
                        else
                        {
                            //ddlMembers2.Items.Insert(0, new ListItem("No Members", "0"));
                            //    ddlMembers2.DataSource = null;
                            //    ddlMembers2.DataBind();
                            //    ddlMembers2.Items.Clear();
                            //    lblNoMember.Text = "No Members";
                        }
                    }
                }
            }
            catch (Exception Ex)
            {

            }
            //mp1.Show();

            getReportName(Id);


        }

        protected void getReportName(int Id)
        {


            // string reportname = txtReportName.Text;
            txtReportName.Text = "";
            lbtnSave.CommandArgument = "";


            MySqlConnection con = new MySqlConnection(cs);




            con.Open();


            string query = "SELECT ReportId, Id, ReportName FROM user_reports where Id =" + Id;



            MySqlCommand cmd = new MySqlCommand(query, con);
            //         cmd.Parameters.AddWithValue("@Id", Id);


            MySqlDataReader dr = cmd.ExecuteReader();

            while (dr.Read())
            {
                txtReportName.Text = dr["ReportName"].ToString();
                lbtnSave.CommandArgument = Convert.ToString(Id);
            }


            con.Close();





        }


        private DataTable MergeDataTables(DataTable dt1, DataTable dt2)
        {
            // Create a new DataTable
            DataTable mergedTable = new DataTable();

            // Add columns from dt1 to mergedTable
            foreach (DataColumn column in dt1.Columns)
            {
                mergedTable.Columns.Add(new DataColumn(column.ColumnName, column.DataType));
            }

            // Add columns from dt2 to mergedTable
            foreach (DataColumn column in dt2.Columns)
            {
                if (!mergedTable.Columns.Contains(column.ColumnName))
                {
                    mergedTable.Columns.Add(new DataColumn(column.ColumnName, column.DataType));
                }
            }

            // Create a HashSet to track added userids
            HashSet<string> userIdSet = new HashSet<string>();

            // Merge rows from dt1
            foreach (DataRow row1 in dt1.Rows)
            {
                string userId = row1["user_id"].ToString();
                if (!userIdSet.Contains(userId))
                {
                    DataRow newRow = mergedTable.Rows.Add();
                    foreach (DataColumn column in dt1.Columns)
                    {
                        newRow[column.ColumnName] = row1[column.ColumnName];
                    }
                    userIdSet.Add(userId);
                }
            }

            // Merge rows from dt2
            foreach (DataRow row2 in dt2.Rows)
            {
                string userId = row2["user_id"].ToString();
                if (!userIdSet.Contains(userId))
                {
                    DataRow newRow = mergedTable.Rows.Add();
                    foreach (DataColumn column in dt2.Columns)
                    {
                        newRow[column.ColumnName] = row2[column.ColumnName];
                    }
                    userIdSet.Add(userId);
                }
            }

            return mergedTable;
        }

        protected void getMembersList()
        {
            int UserId = DAL.validateInt(Session["Userid"].ToString());
            try
            {
                using (MySqlConnection con = new MySqlConnection(cs))
                {
                    con.Open();
                    using (MySqlCommand cmd = new MySqlCommand("usp_getmember", con)) /*usp_getMembers*/
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("_UserId", UserId);
                        cmd.Parameters.AddWithValue("_MemberId", 0);
                        cmd.Parameters.AddWithValue("_SpType", "LS");
                        //cmd.Parameters.AddWithValue("_AccessMappingId", 0);
                        cmd.Parameters.AddWithValue("_ReportId", 0);
                        cmd.Parameters.AddWithValue("_RId", 0);
                        cmd.ExecuteNonQuery();
                        MySqlDataAdapter da = new MySqlDataAdapter(cmd);

                        da.Fill(dtMemberList);
                        if (dtMemberList != null && dtMemberList.Rows.Count > 0)
                        {
                            //ddlMembers.DataSource = dt;
                            //ddlMembers.DataTextField = "user_FirstName";
                            //ddlMembers.DataValueField = "user_Id";
                            //ddlMembers.DataBind();
                            //ddlMembers.Items.Insert(0, new ListItem("Select Member", "0"));

                            //ddlMembers1.DataSource = dt;
                            //ddlMembers1.DataTextField = "user_FirstName";
                            //ddlMembers1.DataValueField = "user_Id";
                            //ddlMembers1.DataBind();
                            //ddlMembers1.Items.Insert(0, new ListItem("Select Member", "0"));

                            ddlMembers2.DataSource = dtMemberList;
                            Session["dtMemberList"] = dtMemberList;
                            ddlMembers2.DataTextField = "user_FirstName";
                            ddlMembers2.DataValueField = "user_Id";
                            ddlMembers2.DataBind();
                            //ddlMembers2.Items.Insert(0, new ListItem("Select Member", "0"));
                        }
                        else
                        {
                            ddlMembers2.Items.Insert(0, new ListItem("No Members", "0"));
                        }
                    }
                }
            }
            catch (Exception Ex)
            {

            }
        }
        protected void lbtnSave_Click(object sender, EventArgs e)
        {
            //LinkButton lnk = sender as LinkButton;
            //int Id = Convert.ToInt32(lnk.CommandArgument);
            //string ReportName = Convert.ToString(txtReportName.Text);
            int RId = DAL.validateInt(Request.QueryString["rid"]);
            int memberId = Convert.ToInt32(Session["memberId"]);
            List<int> selectedIds = new List<int>();
            int user_referenceId = Convert.ToInt32(Session["user_reference"]);

            foreach (ListItem item in ddlMembers2.Items)
            {
                if (item.Selected)
                {
                    selectedIds.Add(Convert.ToInt32(item.Value));
                }
            }
            if (memberId > 0 && user_referenceId > 0)
            {
                selectedIds.Add(memberId);
            }

            string memberIdList = string.Join(",", selectedIds);
            //int memberId = Convert.ToInt32(ddlMembers2.SelectedItem.Value);
            int result = 0;
            try
            {
                //int age= Convert.ToInt32(Session["MemberAge"].ToString());
                int age = 0;

                using (MySqlConnection con = new MySqlConnection(cs))
                {
                    con.Open();
                    using (MySqlCommand cmd = new MySqlCommand("usp_addreportwithaccess", con))
                    {
                        //if (memberId > 0)
                        if (Session["memberRelation"] == null)
                        {
                            Session["memberRelation"] = "Self";
                        }



                        if (Session["memberRelation"].ToString() == "Self" || Session["memberRelation"].ToString() == "Son" || Session["memberRelation"].ToString() == "daughter" || Session["memberRelation"].ToString() == "cat" || Session["memberRelation"].ToString() == "Dog" || Session["memberRelation"].ToString() == "GrandFather" || Session["memberRelation"].ToString() == "GrandMother" || Session["memberRelation"].ToString() == "Uncle" || Session["memberRelation"].ToString() == "Aunt" || Session["memberRelation"].ToString() == "Son" && age < 17 || age > 70)
                        {
                            cmd.CommandType = CommandType.StoredProcedure;
                            cmd.Parameters.AddWithValue("_UserId", int.Parse(Session["Userid"].ToString()));
                            cmd.Parameters.AddWithValue("_reportname", "");
                            cmd.Parameters.AddWithValue("_reporturl", "");
                            cmd.Parameters.AddWithValue("_reportId", DAL.validateInt(RId));
                            // cmd.Parameters.AddWithValue("_memberId", memberId);
                            cmd.Parameters.AddWithValue("_memberId", memberIdList);
                            cmd.Parameters.AddWithValue("_rId", Convert.ToInt32(Session["ReportUniqueId"].ToString()));
                            cmd.Parameters.AddWithValue("_SpType", "U");
                            cmd.Parameters.AddWithValue("_UploadType", "");
                            cmd.Parameters.AddWithValue("_FileSize", 0);
                            cmd.Parameters.AddWithValue("_Result", SqlDbType.Int);
                            cmd.Parameters["_Result"].Direction = ParameterDirection.Output;
                            cmd.ExecuteNonQuery();
                            int retVal = Convert.ToInt32(cmd.Parameters["_Result"].Value);
                            result = DAL.validateInt(retVal);
                            //ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", " toastr.success('Report Updated successfully');location.reload();", true);




                            Session["memberId"] = 0;

                        }
                        else if (memberId == int.Parse(Session["Userid"].ToString()))
                        {
                            //using (MySqlCommand cmd = new MySqlCommand("usp_addreport", con))
                            //{
                            cmd.CommandType = CommandType.StoredProcedure;
                            cmd.Parameters.AddWithValue("_UserId", int.Parse(Session["Userid"].ToString()));
                            cmd.Parameters.AddWithValue("_reportname", "");
                            cmd.Parameters.AddWithValue("_reporturl", "");
                            cmd.Parameters.AddWithValue("_reportId", DAL.validateInt(RId));
                            // cmd.Parameters.AddWithValue("_memberId", memberId);
                            cmd.Parameters.AddWithValue("_memberId", memberIdList);
                            cmd.Parameters.AddWithValue("_rId", Convert.ToInt32(Session["ReportUniqueId"].ToString()));
                            cmd.Parameters.AddWithValue("_SpType", "U");
                            cmd.Parameters.AddWithValue("_UploadType", "");
                            cmd.Parameters.AddWithValue("_FileSize", 0);
                            cmd.Parameters.AddWithValue("_Result", SqlDbType.Int);
                            cmd.Parameters["_Result"].Direction = ParameterDirection.Output;
                            cmd.ExecuteNonQuery();
                            int retVal = Convert.ToInt32(cmd.Parameters["_Result"].Value);
                            result = DAL.validateInt(retVal);
                            //ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", " toastr.success('Report Updated successfully');location.reload();", true);



                        }
                        else
                        {
                            //using (MySqlCommand cmd = new MySqlCommand("usp_addreport", con))
                            //{
                            cmd.CommandType = CommandType.StoredProcedure;
                            cmd.Parameters.AddWithValue("_UserId", int.Parse(Session["Userid"].ToString()));
                            cmd.Parameters.AddWithValue("_reportname", "");
                            cmd.Parameters.AddWithValue("_reporturl", "");
                            cmd.Parameters.AddWithValue("_reportId", DAL.validateInt(RId));
                            // cmd.Parameters.AddWithValue("_memberId", memberId);
                            cmd.Parameters.AddWithValue("_memberId", memberIdList);
                            cmd.Parameters.AddWithValue("_rId", Convert.ToInt32(Session["ReportUniqueId"].ToString()));
                            cmd.Parameters.AddWithValue("_SpType", "U");
                            cmd.Parameters.AddWithValue("_UploadType", "");
                            cmd.Parameters.AddWithValue("_FileSize", 0);
                            cmd.Parameters.AddWithValue("_Result", SqlDbType.Int);
                            cmd.Parameters["_Result"].Direction = ParameterDirection.Output;
                            cmd.ExecuteNonQuery();
                            int retVal = Convert.ToInt32(cmd.Parameters["_Result"].Value);
                            result = DAL.validateInt(retVal);
                            // ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", " toastr.success('Report Updated successfully');", true);
                            //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Report Updated Successfully')", true);
                            //else
                            //{
                            //    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('You don't have permission to add reports for this member')", true);
                            //}
                        }
                    }
                }
            }
            catch (Exception Ex)
            {
                result = 0;
            }
            //return result;
            //getReportNameupdate();


            try
            {


                LinkButton lbtnimg = (LinkButton)sender;
                string commandArgument = lbtnimg.CommandArgument;

                //int Id = DAL.validateInt(lbtnimg.CommandArgument.ToString());
                Console.WriteLine($"CommandArgument: {commandArgument}");

                int _Id = DAL.validateInt(commandArgument);

                //int reportId = 340;
                string rid = Request.QueryString["rid"];
                // Call the method
                int updatedId = GetReportNameUpdate(sender, _Id);

                // Optionally, handle the returned ID or display a success message
                // ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", " toastr.success('Report Name Updated');", true);
                ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", $"reportUpdatedSuccessfully('{rid}');", true);


            }
            catch (Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", " toastr.fail('ReportName Updated fail');location.reload();", true);

            }


        }

        public int GetReportNameUpdate(object sender, int Id)
        {
            try
            {
                LinkButton lbtnimg = (LinkButton)(sender);
                string commandArgument = lbtnimg.CommandArgument;

                Console.WriteLine($"CommandArgument: {commandArgument}");

                //int _Id = DAL.validateInt(lbtnimg.CommandArgument.ToString());




                //LinkButton lbtn = (LinkButton)sender;
                //string commandArgument = lbtn.CommandArgument;

                int id = Id;
                string reportName = txtReportName.Text;

                using (MySqlConnection con = new MySqlConnection(cs))
                {


                    using (MySqlCommand cmd = new MySqlCommand("GetReportNameByUserId", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@p_ID", id);
                        cmd.Parameters.AddWithValue("@p_ReportName", reportName);
                        cmd.Parameters["@p_ReportName"].MySqlDbType = MySqlDbType.VarChar;
                        cmd.Parameters["@p_ReportName"].Size = 255;

                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();
                    }
                }
                return Id;
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error: {ex.Message}");
                return Id;
            }

        }



        protected void btnSubmit_Click(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            mp1.Hide();
        }

        protected void rptReports_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            Repeater reportRepeater = e.Item.FindControl("rptReports") as Repeater;
        }



        protected void whatsappLinkButton_Click(object sender, EventArgs e)
        {
            //LinkButton lnk = sender as LinkButton;
            //string fileUrl = "/upload/report/" + lnk;//lnk.CommandArgument;

            //string whatsappUrl = GenerateWhatsAppUrl(fileUrl);
            //Response.Redirect(whatsappUrl);



            LinkButton lnk = sender as LinkButton;
            string fileUrl = "https://hfiles.in" + lnk.CommandArgument;
            string whatsappUrl = GenerateWhatsAppUrl(fileUrl);
            Response.Redirect(whatsappUrl);

        }


        private string GenerateWhatsAppUrl(string filePath)
        {


            DateTime utcNow = DateTime.UtcNow;

            // Define the IST timezone
            TimeZoneInfo istTimeZone = TimeZoneInfo.FindSystemTimeZoneById("India Standard Time");

            // Convert UTC to IST
            DateTime indiaTime = TimeZoneInfo.ConvertTimeFromUtc(utcNow, istTimeZone).AddMinutes(60);



            Guid tokenId = Guid.NewGuid();

            var tokenData = new { FilePath = filePath, Expiry = indiaTime };

            // Storing data in Cache using tokenId as key
            HttpContext.Current.Cache.Insert(
                tokenId.ToString(),      // Key
                tokenData,               // Value
                null,                    // Dependencies (none in this case)
                indiaTime.AddMinutes(30), // Absolute Expiry Time
                Cache.NoSlidingExpiration, // No sliding expiration
                CacheItemPriority.Normal, // Cache item priority
                null);
            string signedUrl = $"https://hfiles.in/ContentDeliver.aspx?token={tokenId}";
            // Callback (if needed)
            // Store token data using tokenId as key (e.g., in MemoryCache, Database, etc.)



            // Return the WhatsApp-ready link
            return "https://wa.me/?text=" + HttpUtility.UrlEncode(signedUrl);
        }











        protected void btnShareEmail_Command(object sender, CommandEventArgs e)
        {
            try
            {
                // Define the email details
                string subject = "View Report";
                //string body = "Hi, You might find this interesting: " + Request.Url.AbsoluteUri;
                string body = "Hi, View Report ";

                // Construct the email message
                System.Net.Mail.MailMessage message = new System.Net.Mail.MailMessage();
                message.Subject = subject;
                message.Body = body;
                message.IsBodyHtml = false; // Set to true if your body contains HTML

                // Add attachment
                //string documentPath = @"D:\Chetan\GitHub\HFiles\upload\report\11_01_2023_01_06_11_239.png";
                string documentPath = Server.MapPath("~/upload/report\\11_01_2023_01_06_11_239.png");
                //string documentPath = "http://68.178.164.174//upload/report/112_19_2023_02_04_21_002.jpeg";
                if (System.IO.File.Exists(documentPath))
                {
                    Attachment attachment = new Attachment(documentPath);
                    message.Attachments.Add(attachment);
                }
                else
                {
                    // Handle the case where the document doesn't exist
                    // You may want to display an error message or take appropriate action
                    Response.Write("The specified document does not exist.");
                    return;
                }

                // Construct the email link
                string emailLink = "mailto:?subject=" + Uri.EscapeDataString(subject) + "&body=" + Uri.EscapeDataString(message.Body);
                string emailLink1 = "mailto:?subject=" + Uri.EscapeDataString(subject) + "&body=" + documentPath;

                // Redirect to default email client
                Response.Redirect(emailLink);
            }
            catch (Exception ex)
            {
                // Handle exceptions, log, or display an error message
                Response.Write("An error occurred: " + ex.Message);
            }
        }



        protected void lbtnShareMail_Click1(object sender, EventArgs e)
        {
            reporturl = Session["reporturl"].ToString();
            System.Net.Mail.MailMessage mailMessage = new System.Net.Mail.MailMessage();
            string url = Request.Url.AbsoluteUri;
            string email = "chetan@digitaledgetech.in";
            string subject = "HFiles - Report";
            string body = $"<p style=\"text-align: justify\">Thank You For Using HFiles.</p>\r\n\r\n<p style=\"text-align: justify\">Thanks,&nbsp;</p><p style=\"text-align: justify\">Team Health Files.</p>";
            //string pdfFilePath = Server.MapPath("~/");
            //Attachment attachment = new Attachment(pdfFilePath, MediaTypeNames.Application.Pdf);
            //mailMessage.Attachments.Add(attachment);
            string attachmentFilePath = Server.MapPath("~/upload/report/" + Session["reporturl"].ToString());
            //string attachmentFilePath = "http://68.178.164.174//upload/report/ "+ reporturl;

            SendMail(subject, body, email, attachmentFilePath);
            DAL.SendCareerMail(subject, body, email);
            //DAL.SendMailPDF(subject, body, email, pdfFilePath);
            //SendEmailWithAttachment();
        }

        

        protected bool IsValidEmail(object sessionvalue)
        {
            string email = sessionvalue as string;
            if (email == null)
            {
                return false;
            }
            else
            {
                return true;
            }
        }

        protected void rptReports_ItemDataBound1(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                // Get controls inside the repeater item
                Literal litFileName = (Literal)e.Item.FindControl("litFileName");
                System.Web.UI.WebControls.Image imgPreview = (System.Web.UI.WebControls.Image)e.Item.FindControl("imgPreview");
                System.Web.UI.HtmlControls.HtmlIframe pdfPreview = (System.Web.UI.HtmlControls.HtmlIframe)e.Item.FindControl("pdfPreview");
                System.Web.UI.HtmlControls.HtmlVideo videoPreview = (System.Web.UI.HtmlControls.HtmlVideo)e.Item.FindControl("videoPreview");

                // Get data for the current repeater item
                DataRowView row = (DataRowView)e.Item.DataItem;
                string ReportUrl = row["ReportUrl"].ToString();

                // Assign file name
                if (litFileName != null)
                {
                    litFileName.Text = ReportUrl;
                }

                // Extract file extension
                string fileExtension = Path.GetExtension(ReportUrl).ToLower();
                string relativeUrl = ResolveUrl($"~/upload/report/{ReportUrl}");

                // Show preview based on file extension
                if (fileExtension == ".jpg" || fileExtension == ".jpeg" || fileExtension == ".png" || fileExtension == ".gif")
                {
                    if (imgPreview != null)
                    {
                        imgPreview.ImageUrl = relativeUrl;
                        imgPreview.Visible = true;
                    }
                    if (pdfPreview != null) pdfPreview.Visible = false;
                    if (videoPreview != null) videoPreview.Visible = false;
                }
                else if (fileExtension == ".pdf")
                {
                    if (pdfPreview != null)
                    {
                        pdfPreview.Attributes["src"] = relativeUrl;
                        pdfPreview.Visible = true;
                    }
                    if (imgPreview != null) imgPreview.Visible = false;
                    if (videoPreview != null) videoPreview.Visible = false;
                }
                else if (fileExtension == ".mp4" || fileExtension == ".webm" || fileExtension == ".ogg")
                {
                    if (videoPreview != null)
                    {
                        videoPreview.Attributes["src"] = relativeUrl;
                        videoPreview.Visible = true;
                    }
                    if (imgPreview != null) imgPreview.Visible = false;
                    if (pdfPreview != null) pdfPreview.Visible = false;
                }
            }
        }
        private void BindRepeater()
        {
            int UserId = int.Parse(Session["Userid"].ToString());

            using (MySqlConnection con = new MySqlConnection(cs))
            {
                try
                {
                    con.Open();
                    string query = "SELECT Id,UserId,ReportName, ReportUrl,CreatedDate FROM user_reports WHERE IsActive = 1 AND UserId = @UserId";

                    using (MySqlCommand cmd = new MySqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@UserId", UserId);
                        using (MySqlDataAdapter da = new MySqlDataAdapter(cmd))
                        {
                            DataTable dt = new DataTable();
                            da.Fill(dt);

                            rptReports.DataSource = dt;
                            rptReports.DataBind();
                        }
                    }
                }
                catch (Exception ex)
                {
                    Console.WriteLine("Error: " + ex.Message);
                }
            }
        }
       

    }
}

