using MySql.Data.MySqlClient;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using static hfiles.MedicalHistory;

namespace hfiles
{
    public partial class FamilyPrescription1 : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["signage"].ConnectionString;

        private static readonly string TempDirectory = HttpContext.Current.Server.MapPath("~/TempPDFs/");
        
        protected void Page_Load(object sender, EventArgs e)
        {
            
            // Ensure Temp directory exists
            if (!Directory.Exists(TempDirectory))
                Directory.CreateDirectory(TempDirectory);
        }


        [System.Web.Services.WebMethod]
        public static string UserData()
        {
            FamilyPrescription1 fb = new FamilyPrescription1();
            return fb.getbasicdetails();
        }

       

        public string getbasicdetails()
        {
            int id = DAL.validateInt(Session["Userid"]);
            DataTable dt = new DataTable();
            using (MySqlConnection connection = new MySqlConnection(cs))
            {
                connection.Open();
                using (MySqlCommand command = new MySqlCommand("getUserDetails", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("_Id", id);
                    MySqlDataAdapter da = new MySqlDataAdapter(command);
                    
                    da.Fill(dt);
                }
            }
            return JsonConvert.SerializeObject(dt);
        }
        protected void user_members()
        {
            using (MySqlConnection con = new MySqlConnection(cs))
            {
                con.Open();
                using (MySqlCommand cmd = new MySqlCommand("usp_getmember", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("_UserId", DAL.validateInt(Session["Userid"])); //Session["Userid"];
                    cmd.Parameters.AddWithValue("_MemberId", 0); //Session["Userid"];
                    cmd.Parameters.AddWithValue("_SpType", "LS"); //Session["Userid"];
                    cmd.Parameters.AddWithValue("_ReportId", 0); //Session["Userid"];
                    cmd.Parameters.AddWithValue("_RId", 0); //Session["Userid"];
                                                            // cmd.Parameters.AddWithValue("_AccessMappingId", 0); //Session["Userid"];
                    MySqlDataAdapter da = new MySqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                }
            }
        }        
        
        [System.Web.Services.WebMethod]
        public static int[] GetAccessFamilyPrescription()
        {
            FamilyPrescription1 fp = new FamilyPrescription1();
            int[] AccessMember = fp.GetAccessToArrayByUserId();
            return AccessMember;
        }
        private int[] GetAccessToArrayByUserId()
        {
            int userId = DAL.validateInt(Session["Userid"]);
            int[] accessToArray = Array.Empty<int>();

            // Define the query to fetch AccessTo for the provided UserId
            string query = @"
            SELECT AccessTo
            FROM user_prescriptionAccess
            WHERE UserId = @UserId";

            // Use MySqlConnection to interact with the MySQL database
            using (MySqlConnection con = new MySqlConnection(cs))
            {
                con.Open();
                using (MySqlCommand cmd = new MySqlCommand(query, con))
                {
                    // Add the UserId parameter
                    cmd.Parameters.AddWithValue("@UserId", userId);

                    using (MySqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            // Read the AccessTo as a string
                            string accessToString = reader["AccessTo"].ToString();

                            // Convert the string to an array of integers
                            accessToArray = accessToString.Split(',')
                                                          .Select(int.Parse)
                                                          .ToArray();
                        }
                    }
                }
            }

            return accessToArray;
        }

        [System.Web.Services.WebMethod]
        public static void SetAccessFamilyPrescription(string Access)
        {
            FamilyPrescription1 fp = new FamilyPrescription1();
            fp.SetAccessToArrayByUserId(Access);
        }
        [System.Web.Services.WebMethod]
        public static string SaveFamilyPrescription(string jsonData)
        {
            try
            {
                // Deserialize JSON string into a List<FamilyPrescription>
                List<FamilyPrescription> prescriptions = JsonConvert.DeserializeObject<List<FamilyPrescription>>(jsonData);

                FamilyPrescription1 med = new FamilyPrescription1();
                med.AddUpdateFamilyPrescription(prescriptions);

                return JsonConvert.SerializeObject(new { success = true, message = "Saved successfully" });
            }
            catch (Exception ex)
            {
                return JsonConvert.SerializeObject(new { success = false, message = ex.Message });
            }
        }

        private void AddUpdateFamilyPrescription(List<FamilyPrescription> prescriptions)
        {


            using (var connection = new MySqlConnection(cs))
            {
                connection.Open();

                foreach (var prescription in prescriptions)
                {
                    // Call stored procedure for each prescription record
                    var command = new MySqlCommand("InsertOrUpdateUserFamilyPrescription", connection);
                    command.CommandType = CommandType.StoredProcedure;
                    var Id = Convert.ToInt32((prescription.Id != "") ? prescription.Id : "0");
                    command.Parameters.AddWithValue("_Id", Id);
                    command.Parameters.AddWithValue("_MemberId", Convert.ToInt32(prescription.MemberId));
                    command.Parameters.AddWithValue("_Conditions", prescription.Condition);
                    command.Parameters.AddWithValue("_otherConditions", prescription.otherCondition);
                    command.Parameters.AddWithValue("_Medication", prescription.Medication);
                    command.Parameters.AddWithValue("_Power", prescription.Power);
                    command.Parameters.AddWithValue("_Dosage", prescription.Dosage);
                    command.Parameters.AddWithValue("_Timings", prescription.Timings);
                    command.Parameters.AddWithValue("_UserId", DAL.validateInt(Session["Userid"]));

                    command.ExecuteNonQuery();
                }
            }

        }

        [System.Web.Services.WebMethod]
        public static void RemoveFamilyPrescription(string recordId)
        {
            FamilyPrescription1 med = new FamilyPrescription1();
            med.DeleteFamilyPrescription(Convert.ToInt32(recordId));
            //Testing
        }


        protected string DeleteFamilyPrescription(int recordId)
        {
            using (MySqlConnection conn = new MySqlConnection(cs))
            {
                conn.Open();
                string query = "DELETE FROM user_familyprescription WHERE Id = @id";
                using (MySqlCommand cmd = new MySqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@id", recordId);
                    int rowsAffected = cmd.ExecuteNonQuery();
                }
            }
            return "Success";
        }
        private void SetAccessToArrayByUserId(string accessTo)
        {
            int userId = DAL.validateInt(Session["Userid"]);
            // SQL queries
            string checkQuery = "SELECT COUNT(*) FROM user_prescriptionAccess WHERE UserId = @UserId";
            string updateQuery = "UPDATE user_prescriptionAccess SET AccessTo = @AccessTo WHERE UserId = @UserId";
            string insertQuery = "INSERT INTO user_prescriptionAccess (UserId, AccessTo) VALUES (@UserId, @AccessTo)";

            using (MySqlConnection con = new MySqlConnection(cs))
            {
                con.Open();

                // Check if the UserId exists
                bool userExists;
                using (MySqlCommand checkCmd = new MySqlCommand(checkQuery, con))
                {
                    checkCmd.Parameters.AddWithValue("@UserId", userId);
                    userExists = Convert.ToInt32(checkCmd.ExecuteScalar()) > 0;
                }

                if (userExists)
                {
                    // If UserId exists, update the AccessTo
                    using (MySqlCommand updateCmd = new MySqlCommand(updateQuery, con))
                    {
                        updateCmd.Parameters.AddWithValue("@UserId", userId);
                        updateCmd.Parameters.AddWithValue("@AccessTo", accessTo);
                        updateCmd.ExecuteNonQuery();
                        Console.WriteLine("AccessTo updated successfully.");
                    }
                }
                else
                {
                    // If UserId does not exist, insert a new row
                    using (MySqlCommand insertCmd = new MySqlCommand(insertQuery, con))
                    {
                        insertCmd.Parameters.AddWithValue("@UserId", userId);
                        insertCmd.Parameters.AddWithValue("@AccessTo", accessTo);
                        insertCmd.ExecuteNonQuery();
                        Console.WriteLine("New user added and AccessTo set successfully.");
                    }
                }
            }
        }      


        [System.Web.Services.WebMethod]
        public static string ShareFileAsLink(string base64PDF,string shareTo)
        {
            
            try
            {
                string whatsstring = "https://wa.me/?text=";
                string gmailUrl = "https://mail.google.com/mail/?view=cm&fs=1&to=&su=";
                // Convert Base64 string to byte array
                byte[] pdfBytes = Convert.FromBase64String(base64PDF);

                // Generate unique file name
                string fileName = Guid.NewGuid().ToString() + ".pdf";
                string filePath = Path.Combine(TempDirectory, fileName);

                // Save the file to server
                File.WriteAllBytes(filePath, pdfBytes);

                // Schedule file deletion after 1 hour
                ScheduleFileDeletion(filePath);

                // Return the relative file path (for reference or download link)
                string fileurl =  $"/TempPDFs/{fileName}";
                AllReports obj = new AllReports();
                if(shareTo == "WhatsApp")
                {
                    whatsstring += HttpUtility.UrlEncode(obj.GenerateWhatsAppUrlFP(fileurl));
                    return whatsstring;
                }
                else
                {
                    string subject = "Report Link";
                    string body = obj.GenerateWhatsAppUrlFP(fileurl);
                    gmailUrl += $"{Uri.EscapeDataString(subject)}&body={Uri.EscapeDataString(body)}";
                    return gmailUrl;
                }                
            }
            catch (Exception ex)
            {
                string logPath = HttpContext.Current.Server.MapPath("~/Logs/ErrorLog.txt");
                string errorDetails = $"Message: {ex.Message}\nStackTrace: {ex.StackTrace}\nInnerException: {ex.InnerException?.Message}";
                File.AppendAllText(logPath, errorDetails);

                // Throw full error for debugging
                throw new Exception("Error saving PDF to the server.", ex);
            }
        }
        public void WhatsAppRedirect()
        {

        }

        private static void ScheduleFileDeletion(string filePath)
        {
            // Use a Task to schedule file deletion
            System.Threading.Tasks.Task.Delay(TimeSpan.FromHours(1)).ContinueWith(_ =>
            {
                try
                {
                    if (File.Exists(filePath))
                        File.Delete(filePath);
                }
                catch (Exception ex)
                {
                    // Log error (e.g., unable to delete file)
                    // Example: Log to a file or monitoring system
                }
            });
        }

    }
}