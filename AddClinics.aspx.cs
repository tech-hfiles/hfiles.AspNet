using System;
using System.Configuration;
using System.IO;
using MySql.Data.MySqlClient;  

namespace hfiles
{
    public partial class AddClinics : System.Web.UI.Page
    {
        #region DB
        string cs = ConfigurationManager.ConnectionStrings["signage"].ConnectionString;
        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string clinicName = txtClinicName.Text;
            string clinicOffer = txtClinicOffer.Text;
            string clinicAddress = txtClinicAddress.Text;
            string clinicCategory = ddlClinicCategory.SelectedValue;

            if (fileClinicLogo.HasFile)
            {
                try
                {
                    string fileName = Path.GetFileName(fileClinicLogo.PostedFile.FileName);
                    string fileExtension = Path.GetExtension(fileName).ToLower();

                    if (fileExtension == ".jpg" || fileExtension == ".jpeg" || fileExtension == ".png" || fileExtension == ".gif")
                    {
                        string folderPath = Server.MapPath("~/ClinicLogo/");

                        if (!Directory.Exists(folderPath))
                        {
                            Directory.CreateDirectory(folderPath);
                        }

                        string uniqueFileName = Guid.NewGuid().ToString() + fileExtension;

                        string filePath = Path.Combine(folderPath, uniqueFileName);

                        fileClinicLogo.PostedFile.SaveAs(filePath);

                        string relativeFilePath = "~/ClinicLogo/" + uniqueFileName;

                        string query = "INSERT INTO dental_clinics (clinic, offer, address, Category, image) " +
                                       "VALUES (@clinic, @offer, @address, @Category, @image)";

                        using (MySqlConnection conn = new MySqlConnection(cs))  
                        {
                            using (MySqlCommand cmd = new MySqlCommand(query, conn))  
                            {
                                cmd.Parameters.AddWithValue("@clinic", clinicName);
                                cmd.Parameters.AddWithValue("@offer", clinicOffer);
                                cmd.Parameters.AddWithValue("@address", clinicAddress);
                                cmd.Parameters.AddWithValue("@Category", clinicCategory);
                                cmd.Parameters.AddWithValue("@image", relativeFilePath); 

                                conn.Open();
                                cmd.ExecuteNonQuery();

                                string script = "Swal.fire({ title: 'Success!', text: 'Clinic added successfully!', icon: 'success', confirmButtonText: 'OK' });";
                                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", script, true);

                                txtClinicName.Text = "";
                                txtClinicOffer.Text = "";
                                txtClinicAddress.Text = "";
                                ddlClinicCategory.SelectedIndex = 0;

                                Response.Redirect("WellnessKit.aspx");
                            }
                        }
                    }
                    else
                    {
                        string script = "Swal.fire({ title: 'Error!', text: 'Please upload a valid image file (jpg, jpeg, png, gif).', icon: 'error', confirmButtonText: 'OK' });";
                        ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", script, true);
                    }
                }
                catch (Exception ex)
                {
                    string script = "Swal.fire({ title: 'Error!', text: '" + ex.Message.Replace("'", "") + "', icon: 'error', confirmButtonText: 'OK' });";
                    ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", script, true);
                }
            }
            else
            {
                string script = "Swal.fire({ title: 'Error!', text: 'Please upload a logo.', icon: 'error', confirmButtonText: 'OK' });";
                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", script, true);
            }
        }
    }
}
