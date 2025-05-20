using Microsoft.Graph.Models;
using MySql.Data.MySqlClient;
using Ghostscript.NET;
using Ghostscript.NET.Rasterizer;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Drawing;
using PDFiumSharp;
using PdfiumViewer;



namespace hfiles
{
    public partial class Membershipcard : System.Web.UI.Page
    {
        public static string cs = ConfigurationManager.ConnectionStrings["signage"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindUserAccordion();
                //BindAbhaAccordion();

            }

            if (Session["showToastr"] != null && (bool)Session["showToastr"])
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "showToastr", "showToastr('success', 'Updated successfully');", true);
                Session["showToastr"] = null; // Clear the flag
            }

        }
        private void BindUserAccordion()
        {
            DataTable dt = GetUserDetails();
            user masterclass = new user();

            // Check if "user_image" column exists, if not, add it
            if (!dt.Columns.Contains("user_image"))
            {
                dt.Columns.Add("user_image", typeof(string));  // Add column of type string
            }

            // Loop through DataTable and update the "user_image" column
            foreach (DataRow row in dt.Rows)
            {
                string ubg = row["user_bloodgroup"].ToString();
                if (string.IsNullOrEmpty(ubg))
                {
                    ubg = "0";
                }
                int BloodGroup = Convert.ToInt32(ubg);
                string bloodGroupText = "";
                _ = masterclass.bloodGroups.TryGetValue(BloodGroup, out bloodGroupText);


                string userNameText = row["user_firstname"].ToString() + " " + row["user_lastname"].ToString();
                string emergencyContactText = row["user_icecontact"].ToString();
                string expiryText = row["user_expiry"].ToString();
                string userPlan = row["subscriptionplan_status"].ToString();
                string memberIdText = row["user_membernumber"].ToString();
                string image = masterclass.LoadMembershipCard(userNameText, bloodGroupText, emergencyContactText, expiryText, userPlan, memberIdText);
                row["user_image"] = image;
            }



            if (dt.Rows.Count > 0)
            {
                rptUsers.DataSource = dt;
                rptUsers.DataBind();
            }
        }
        public DataTable GetUserDetails()
        {
            DataTable dt = new DataTable();

            using (MySqlConnection con = new MySqlConnection(cs))
            {
                int userId = DAL.validateInt(Session["Userid"]);
                con.Open();
                string query = @"
                SELECT 
                    user_id, 
                    user_firstname, 
                    user_lastname, 
                    user_gender, 
                    user_dob, 
                    user_bloodgroup, 
                    user_state, 
                    user_city, 
                    user_country, 
                    user_contact, 
                    user_icecontact, 
                    user_relativecontact, 
                    user_email, 
                    user_relation, 
                    user_doctor, 
                    user_membernumber, 
                    user_image, 
                    c.dialingcode, 
                    '11/25' AS user_expiry, 
                    subscriptionplan_status,
                    abha_card_image
                FROM user_details u
                LEFT JOIN countrylist c ON u.user_country = c.countryname
                where u.user_isactive = 1 and u.user_reference = " + userId + ";";

                using (MySqlCommand cmd = new MySqlCommand(query, con))
                using (MySqlDataAdapter da = new MySqlDataAdapter(cmd))
                {
                    da.Fill(dt);
                }
            }

            return dt;
        }

        protected void LinkButtonEdit_Click(object sender, EventArgs e)
        {
            LinkButton editButton = (LinkButton)sender;
            string userId = editButton.CommandArgument;

            ViewState["UserId"] = userId; // Store User ID
            GetUserDetails(userId);

            //ScriptManager.RegisterStartupScript(this, this.GetType(), "showModal", "$('#exampleModal').modal('show');", true);
        }
        protected void GetUserDetails(string userId)
        {


            using (MySqlConnection connection = new MySqlConnection(cs))
            {
                connection.Open();
                string query = "SELECT user_bloodgroup, user_icecontact FROM user_details WHERE user_id =" + userId;
                using (MySqlCommand cmd = new MySqlCommand(query, connection))
                {

                    MySqlDataReader reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {

                        DropDownbloodgrp.Text = reader["user_bloodgroup"].ToString();
                        txtEmerContact.Text = reader["user_icecontact"].ToString();
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "showModal", "$('#exampleModal').modal('show');", true);

                    }

                }
            }

        }
        protected void lbtnSave_Click(object sender, EventArgs e)
        {
            try
            {
                string Bloodgrp = DropDownbloodgrp.SelectedValue;
                string Emergencyno = txtEmerContact.Text;

                string userId = ViewState["UserId"] as string;


                UpdateUserDetails(userId, Bloodgrp, Emergencyno);


                //ScriptManager.RegisterStartupScript(this, this.GetType(), "showToastr", "showToastr('success', 'Updated successfully');", true);

                Session["showToastr"] = true;
                Response.Redirect(Request.Url.AbsoluteUri);

            }
            catch (Exception ex)
            {
                // Display error message
                ScriptManager.RegisterStartupScript(this, this.GetType(), "showToastr", "showToastr('error', 'Update failed');", true);
            }
        }

        private void UpdateUserDetails(string userId, string Bloodgrp, string Emergencyno)
        {
            using (MySqlConnection con = new MySqlConnection(cs))
            {
                string query = "UPDATE user_details SET user_bloodgroup = @user_bloodgroup, user_icecontact = @user_icecontact WHERE user_id = @UserID";
                using (MySqlCommand cmd = new MySqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@UserID", userId);
                    cmd.Parameters.AddWithValue("@user_bloodgroup", Bloodgrp);
                    cmd.Parameters.AddWithValue("@user_icecontact", Emergencyno);

                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
        }

        //private void BindAbhaAccordion()
        //{
        //    DataTable dt = GetUserDetails(); // Fetch user details

        //    // Remove the extra column logic — we will use abha_card_image from DB
        //    List<DataRow> filteredRows = new List<DataRow>();

        //    foreach (DataRow row in dt.Rows)
        //    {
        //        string userRelation = row["user_relation"].ToString().ToLower();

        //        // Skip "cat" or "dog" entries
        //        if (!userRelation.Contains("cat") && !userRelation.Contains("dog"))
        //        {
        //            // Check if abha_card_image is available and prefix with folder path
        //            string fileName = row["abha_card_image"]?.ToString() ?? "";
        //            if (!string.IsNullOrWhiteSpace(fileName))
        //            {
        //                row["abha_card_image"] = "/Uploaded_Abha_cards/" + fileName;
        //            }

        //            filteredRows.Add(row);
        //        }
        //    }

        //    if (filteredRows.Count > 0)
        //    {
        //        DataTable filteredDataTable = filteredRows.CopyToDataTable();
        //        rptAbhaUsers.DataSource = filteredDataTable;
        //        rptAbhaUsers.DataBind();
        //    }
        //    else
        //    {
        //        rptAbhaUsers.DataSource = null;
        //        rptAbhaUsers.DataBind();
        //    }
        //}





        //protected void btnUploadABHA_Click(object sender, EventArgs e)
        //{
        //    Button btn = sender as Button;
        //    RepeaterItem item = btn.NamingContainer as RepeaterItem;
        //    FileUpload fileUpload = item.FindControl("fileUploadABHA") as FileUpload;
        //  System.Web.UI.WebControls.Image imgPreview = item.FindControl("imgPreview") as System.Web.UI.WebControls.Image; // ✅ Find the image control
        //    string userId = btn.CommandArgument;

        //    if (fileUpload != null && fileUpload.HasFile)
        //    {
        //        string ext = Path.GetExtension(fileUpload.FileName).ToLower();

        //        if (ext == ".png" || ext == ".jpg" || ext == ".jpeg" || ext == ".pdf")
        //        {
        //            string filename = Path.GetFileName(fileUpload.FileName);
        //            string folderPath = Server.MapPath("~/Uploaded_Abha_cards/");

        //            if (!Directory.Exists(folderPath))
        //            {
        //                Directory.CreateDirectory(folderPath);
        //            }

        //            string filepath = Path.Combine(folderPath, filename);
        //            fileUpload.SaveAs(filepath);

        //            // Save to DB
        //            SaveAbhaCardPath(userId, filename);

        //            // ✅ Show uploaded image (only if not PDF)
        //            if (imgPreview != null && ext != ".pdf")
        //            {
        //                imgPreview.ImageUrl = "~/Uploaded_Abha_cards/" + filename;
        //                imgPreview.Visible = true;
        //            }

        //            // ✅ Convert PDF to image
        //            if (ext == ".pdf")
        //            {
        //                string imageFilename = Path.GetFileNameWithoutExtension(filename) + ".png";
        //                string imageFilePath = Path.Combine(folderPath, imageFilename);

        //                ConvertPdfToImage(filepath, imageFilePath);

        //                // Optionally update DB or show the converted image
        //                if (imgPreview != null)
        //                {
        //                    imgPreview.ImageUrl = "~/Uploaded_Abha_cards/" + imageFilename;
        //                    imgPreview.Visible = true;
        //                }

        //                // Optional: Save the image name in DB instead of PDF
        //                // SaveAbhaCardPath(userId, imageFilename);
        //            }

        //            BindAbhaAccordion();

        //            ScriptManager.RegisterStartupScript(this, this.GetType(), "UploadSuccess",
        //                "showToastr('success', 'ABHA Card uploaded successfully!');", true);
        //        }
        //        else
        //        {
        //            ScriptManager.RegisterStartupScript(this, this.GetType(), "InvalidFile",
        //                "showToastr('error', 'Invalid file type. Only .png, .jpg, .jpeg, and .pdf are allowed.');", true);
        //        }
        //    }
        //    else
        //    {
        //        ScriptManager.RegisterStartupScript(this, this.GetType(), "InvalidFile",
        //            "showToastr('error', 'No file selected. Please choose a file to upload.');", true);
        //    }
        //}





        //protected void rptAbhaUsers_ItemDataBound(object sender, RepeaterItemEventArgs e)
        //{
        //    if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        //    {
        //        Button btnUpload = (Button)e.Item.FindControl("btnUploadABHA");
        //        if (btnUpload != null)
        //        {
        //            ScriptManager scriptManager = ScriptManager.GetCurrent(this.Page);
        //            scriptManager.RegisterPostBackControl(btnUpload);
        //        }
        //        System.Web.UI.WebControls.Image imgPreview = (System.Web.UI.WebControls.Image)e.Item.FindControl("imgPreview");
        //        HiddenField hiddenImage = (HiddenField)e.Item.FindControl("hfAbhaImage");

        //        string imageName = DataBinder.Eval(e.Item.DataItem, "abha_card_image")?.ToString();
        //        if (!string.IsNullOrEmpty(imageName))
        //        {
        //            imgPreview.ImageUrl = "~/Uploaded_Abha_cards/" + imageName;
        //            imgPreview.Visible = true;
        //        }
        //    }
        //}




        //protected void btnUploadMyABHA_Click(object sender, EventArgs e)
        //{
        //    string userId = DAL.validateInt(Session["Userid"]).ToString();
        //    if (fileUploadMyABHA.HasFile)
        //    {
        //        // Get file extension
        //        string ext = Path.GetExtension(fileUploadMyABHA.FileName).ToLower();
        //        string filename = fileUploadMyABHA.FileName;

        //        // Define the path for the uploaded file
        //        string filepath = Server.MapPath("~/upload/" + filename);

        //        // Check if the uploaded file is a PDF
        //        if (ext == ".pdf")
        //        {
        //            // Save the original PDF file first
        //            fileUploadMyABHA.SaveAs(filepath);

        //            // Convert the PDF to an image (You can save this image with a different name or as required)
        //            string imageFilePath = Server.MapPath("~/upload/") + Path.GetFileNameWithoutExtension(filename) + ".png"; // You can change to .jpg or .jpeg
        //            ConvertPdfToImage(filepath, imageFilePath);

        //            // Update the UI to show the generated image
        //            imgMyAbha.ImageUrl = "~/upload/" + Path.GetFileName(imageFilePath);
        //            imgMyAbha.Visible = true;

        //            // Save the image path to the database
        //            SaveAbhaCardPath(userId, Path.GetFileName(imageFilePath));

        //            // Notify the user
        //            ScriptManager.RegisterStartupScript(this, this.GetType(), "uploadSuccess",
        //                "alert('ABHA Card PDF uploaded and converted successfully!');", true);
        //        }
        //        else if (ext == ".png" || ext == ".jpg" || ext == ".jpeg")
        //        {
        //            // If the uploaded file is an image (like png, jpg), just save it as is
        //            fileUploadMyABHA.SaveAs(filepath);

        //            // Update the UI to show the image
        //            imgMyAbha.ImageUrl = "~/upload/" + filename;
        //            imgMyAbha.Visible = true;

        //            // Save the image path to the database
        //            SaveAbhaCardPath(userId, filename);

        //            // Notify the user
        //            ScriptManager.RegisterStartupScript(this, this.GetType(), "uploadSuccess",
        //                "alert('ABHA Card image uploaded successfully!');", true);
        //        }
        //        else
        //        {
        //            // Notify the user if the file is not valid
        //            ScriptManager.RegisterStartupScript(this, this.GetType(), "invalidFile",
        //                "alert('Invalid file type. Please upload a PDF or an image.');", true);
        //        }
        //    }
        //    else
        //    {
        //        // Notify the user if no file is selected
        //        ScriptManager.RegisterStartupScript(this, this.GetType(), "noFile",
        //            "alert('Please select a file first.');", true);
        //    }
        //}
        //public void ConvertPdfToImage(string pdfFilePath, string imageFilePath)
        //{
        //    // Specify the path to the Ghostscript executable
        //    string ghostscriptPath = @"C:\Program Files\gs\gs9.54.0\bin\gswin64c.exe"; // Adjust to your installation path

        //    // Initialize Ghostscript rasterizer
        //    using (var rasterizer = new GhostscriptRasterizer())
        //    {
        //        // Set the Ghostscript executable path
        //        rasterizer.Open(pdfFilePath); // You don't need to pass the path to the constructor

        //        // Convert the first page of the PDF to an image
        //        // You can adjust DPI (e.g., 300 for high resolution)
        //        System.Drawing.Image image = rasterizer.GetPage(300,1); // 300 DPI, page number 1

        //        // Save the image to the specified file path
        //        image.Save(imageFilePath, System.Drawing.Imaging.ImageFormat.Png);
        //    }
        //}
        //private void SaveAbhaCardPath(string userId, string filename)
        //    {
        //        using (MySqlConnection con = new MySqlConnection(cs))
        //        {
        //            con.Open();
        //            string query = "UPDATE user_details SET abha_card_image = @img WHERE user_id = @UserId";
        //            using (MySqlCommand cmd = new MySqlCommand(query, con))
        //            {
        //                cmd.Parameters.AddWithValue("@img", filename);
        //                cmd.Parameters.AddWithValue("@UserId", userId);
        //                cmd.ExecuteNonQuery();
        //            }
        //        }
        //    }


    }
}
