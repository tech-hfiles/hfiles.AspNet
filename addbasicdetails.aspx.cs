//using AjaxControlToolkit.HTMLEditor.ToolbarButton;
using Microsoft.Graph.Models;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net.NetworkInformation;
using System.Security.Cryptography.X509Certificates;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using static System.Net.WebRequestMethods;


namespace hfiles
{
    public partial class addbasicdetails : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["signage"].ConnectionString;
        private string userState;
        private string fullNumber;
        private readonly string userCity;
        string countryCode;

        [WebMethod]
        public static object GetCityStateByPincode(string pincode)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["signage"].ConnectionString;

            using (MySqlConnection con = new MySqlConnection(connectionString))
            {
                string query = "SELECT state, city FROM scp WHERE pincode = @pincode LIMIT 1";
                using (MySqlCommand cmd = new MySqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@pincode", pincode);
                    con.Open();

                    using (MySqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            return new
                            {
                                state = reader["state"].ToString(),
                                city = reader["city"].ToString()
                            };
                        }
                    }
                }
            }

            return new { state = "", city = "" };
        }


        protected void Page_Load(object sender, EventArgs e)
        {
            //Profileupload.Attributes["onchange"] = "uploadImage();";
            if (Session["Userid"] != null)
            //newly commented for testing purpose
            //if (Session["firstname"] != null && Session["lastname"] != null && Session["email"] != null && Session["phone"] != null)
            {
                if (!IsPostBack)
                {
                    int userid = Convert.ToInt32(Session["Userid"]);


                    getbasicdetails(userid);


                    using (MySqlConnection conn = new MySqlConnection(connectionString))
                    {
                        string query = "SELECT countrycode FROM user_details WHERE user_id = @UserId";

                        using (MySqlCommand cmd = new MySqlCommand(query, conn))
                        {
                            cmd.Parameters.AddWithValue("@UserId", userid);

                            conn.Open();
                            MySqlDataReader reader = cmd.ExecuteReader();

                            if (reader.Read())
                            {
                                string countryCode = reader["countrycode"]?.ToString().Trim() ?? "";
                                Session["countryCode"] = countryCode; // ✅ Store in session
                            }
                            reader.Close();
                        }
                    }


                    getstatelist();
                    dateajax.EndDate = DateTime.Now.AddDays(0);
                   
                    string plan = GetUserSubscription(Session["Userid"].ToString()); // e.g., "Gold"

                    if (plan == "Basic")
                        profileImageContainer.Attributes["class"] += " ring-basic";
                    else if (plan == "Standard")
                        profileImageContainer.Attributes["class"] += " ring-standard";
                    else if (plan == "Premium")
                        profileImageContainer.Attributes["class"] += " ring-premium";

                    //firstNameTextBox.Value = Session["firstname"].ToString();
                    //lastNameTextBox.Value = Session["lastname"].ToString();
                    //emailTextBox.Value = Session["email"].ToString();
                    //contactTextBox.Value = Session["phone"].ToString();
                }
                HandleStateVisibility();
            }
            else
            {
                Response.Redirect("~/login.aspx");
            }
        }
        private string GetUserSubscription(string userId)
        {
            string plan = "";

            using (MySqlConnection con = new MySqlConnection(connectionString))
            {
                string query = "SELECT subscriptionplan_status FROM user_details WHERE user_id = @UserID";
                using (MySqlCommand cmd = new MySqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@UserID", userId);
                    con.Open();
                    MySqlDataReader rdr = cmd.ExecuteReader();
                    if (rdr.Read())
                    {
                        plan = rdr["subscriptionplan_status"].ToString();
                    }
                    con.Close();
                }
            }
            return plan;
        }
        public static string UploadImage(string base64String)
        {
            try
            {
                // Convert the base64 string to byte array
                byte[] bytes = Convert.FromBase64String(base64String.Split(',')[1]);

                // Specify the upload path
                string uploadPath = HttpContext.Current.Server.MapPath("~/Uploads/");

                // Generate a unique file name
                string fileName = Guid.NewGuid().ToString() + ".png";

                // Save the file to the server
                System.IO.File.WriteAllBytes(Path.Combine(uploadPath, fileName), bytes);

                // Return the file path or any other response if needed
                return $"~/Uploads/{fileName}";
            }
            catch (Exception ex)
            {
                // Handle exception (display error message, log, etc.)
                return "Error";
            }

        }
        //private void getcountrylist()
        //{
        //    MySqlConnection con = new MySqlConnection(connectionString);
        //    string com = "Select * from countrylist";
        //    MySqlDataAdapter adpt = new MySqlDataAdapter(com, con);
        //    DataTable dt = new DataTable();
        //    adpt.Fill(dt);

        //    ViewState["CountryCodeList"] = dt;
        //    //ddlCountry.DataSource = dt;
        //    //ddlCountry.DataTextField = "countryname";
        //    //ddlCountry.DataValueField = "id";
        //    //ddlCountry.DataBind();
        //    //ddlCountry.Items.Insert(0, new ListItem("Select Country", "0"));
        //    stateDropDownList.DataSource = null;
        //    stateDropDownList.DataBind();

        //    stateDropDownList.Items.Insert(0, new ListItem("No State Found", "0"));
        //    cityDropDownList.DataSource = null;
        //    cityDropDownList.DataBind();
        //    cityDropDownList.Items.Insert(0, new ListItem("No City Found", "0"));
        //}
        //private void getstatelist()
        //{
        //    stateDropDownList.Items.Clear();
        //    MySqlConnection con = new MySqlConnection(connectionString);
        //    string com = "Select state from scp group by state";
        //    MySqlDataAdapter adpt = new MySqlDataAdapter(com, con);
        //    DataTable dt = new DataTable();
        //    adpt.Fill(dt);
        //    stateDropDownList.DataSource = dt;
        //    stateDropDownList.DataTextField = "state";
        //    stateDropDownList.DataValueField = "state";
        //    stateDropDownList.DataBind();
        //    stateDropDownList.Items.Insert(0, new ListItem("Select State", "0"));
        //}
        private void getstatelist()
        {
            //stateDropDownList.Items.Clear();
            using (MySqlConnection con = new MySqlConnection(connectionString))
            {
                string query = "SELECT DISTINCT state FROM scp ORDER BY state";
                MySqlCommand cmd = new MySqlCommand(query, con);
                con.Open();
                MySqlDataReader reader = cmd.ExecuteReader();

                stateDropDownList.Items.Add(new System.Web.UI.WebControls.ListItem("Select State", "0"));

                while (reader.Read())
                {
                    string state = reader["state"].ToString();
                    stateDropDownList.Items.Add(new System.Web.UI.WebControls.ListItem(state, state));
                }

                con.Close();
            }
        }

        //private void getcitylist(string state)
        //{
        //    cityDropDownList.Items.Clear();
        //    MySqlConnection con = new MySqlConnection(connectionString);
        //    string com = "Select distinct city from scp where state='" + state + "' ";
        //    MySqlDataAdapter adpt = new MySqlDataAdapter(com, con);
        //    DataTable dt = new DataTable();
        //    adpt.Fill(dt);
        //    cityDropDownList.DataSource = dt;
        //    cityDropDownList.DataTextField = "city";
        //    cityDropDownList.DataValueField = "city";
        //    cityDropDownList.DataBind();
        //    cityDropDownList.Items.Insert(0, new ListItem("Select City", "0"));
        //}
        private void getcitylist(string state)
        {
            //cityDropDownList.Items.Clear();
            using (MySqlConnection con = new MySqlConnection(connectionString))
            {
                string query = "SELECT DISTINCT city FROM scp WHERE state = @state ORDER BY city";
                MySqlCommand cmd = new MySqlCommand(query, con);
                cmd.Parameters.AddWithValue("@state", state);
                con.Open();

                MySqlDataReader reader = cmd.ExecuteReader();

                cityDropDownList.Items.Add(new System.Web.UI.WebControls.ListItem("Select City", "0"));

                while (reader.Read())
                {
                    string city = reader["city"].ToString();
                    cityDropDownList.Items.Add(new System.Web.UI.WebControls.ListItem(city, city));
                }

                con.Close();
            }
        }

        public static string GenerateId()
        {
            Random random = new Random();
            const string chars = "0123456789";
            return new string(Enumerable.Repeat(chars, 4)
                .Select(s => s[random.Next(s.Length)]).ToArray());
        }
        protected void submitButton_Click(object sender, EventArgs e)
        {
            // Generate a unique random number (you can adjust the range as needed)
            Random random = new Random();
            int randomNumber = random.Next(1000, 9999);

            // Format the date of birth in MMDDYYYY format
            string formattedDateOfBirth = Convert.ToDateTime(txtDate.Text).ToString("MMddyy");

            // Take a portion of the last name (first three characters)
            string partialLastName = firstNameTextBox.Value.Substring(0, Math.Min(3, lastNameTextBox.Value.Length)).ToUpper();

            // Concatenate the components to create the membership number
            string membershipNumber = $"HF{formattedDateOfBirth}{partialLastName}{randomNumber}";

            #region variable
            string member = membershipNumber;
            string filePath = "";
            string reporturl = "", Extension1, fileName1, dt1;
            if (Profileupload.HasFile == true)
            {
                Extension1 = Path.GetExtension(Profileupload.PostedFile.FileName);
                //if (Extension1 == )
                //{

                //}
                fileName1 = Path.GetFileName(Profileupload.PostedFile.FileName);
                dt1 = DateTime.Now.ToString("MM_dd_yyyy_hh_mm_ss_fff");
                Profileupload.PostedFile.SaveAs(Server.MapPath("~/upload/") + dt1 + Extension1);
                filePath = dt1 + Extension1;
            }
            else
            {
                filePath = Session["ProfileImage"].ToString();
            }

            string countryCode = ""; // This will be dialingcode + isocode
            string fullNumber = contactTextBox.Value.Trim(); // "+91 8779840384"
            string dialingCode = "";
            string phoneNumber = "";

            int spaceIndex = fullNumber.IndexOf(' ');
            if (spaceIndex > 0)
            {
                dialingCode = fullNumber.Substring(0, spaceIndex); // "+91"
                phoneNumber = fullNumber.Substring(spaceIndex + 1); // "8779840384"
            }
            using (MySqlConnection conn = new MySqlConnection(connectionString))
            {
                conn.Open();
                string checkQuery = "SELECT dialingcode, isocode FROM countrylist2 WHERE dialingcode = @dialingcode LIMIT 1";
                using (MySqlCommand checkCmd = new MySqlCommand(checkQuery, conn))
                {
                    checkCmd.Parameters.AddWithValue("@dialingcode", dialingCode); // remove + if stored without it

                    using (MySqlDataReader reader = checkCmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            string iso = reader["isocode"].ToString();
                            string code = reader["dialingcode"].ToString();
                            countryCode = iso + " " + code; // e.g., "91 IN"
                        }
                    }
                }
                conn.Close();
            }
            using (MySqlConnection connection = new MySqlConnection(connectionString))
            {
                //procedure adduser replaced by add_update_userdetails
                using (MySqlCommand command = new MySqlCommand("add_update_userdetails", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    // Add parameters to the command
                    command.Parameters.AddWithValue("_user_id", DAL.validateInt(Session["Userid"]));
                    command.Parameters.AddWithValue("_user_firstname", firstNameTextBox.Value);
                    command.Parameters.AddWithValue("_user_lastname", lastNameTextBox.Value);
                    command.Parameters.AddWithValue("_user_dob", txtDate.Text);       
                    command.Parameters.AddWithValue("_user_contact", phoneNumber);
                    command.Parameters.AddWithValue("_user_email", emailTextBox.Value);
                    command.Parameters.AddWithValue("_countrycode", countryCode);
                    command.Parameters.AddWithValue("_user_gender", selectgender.Value);
                    //command.Parameters.AddWithValue("_user_dob", dobTextBox1.Value);

                    command.Parameters.AddWithValue("_user_bloodgroup", bloodgroup.Value);
                    command.Parameters.AddWithValue("_user_pincode", txtpincode.Value);
                    //command.Parameters.AddWithValue("_user_state", stateTextBox.Value);
                    command.Parameters.AddWithValue("_user_state", stateDropDownList.SelectedItem.Text);
                  
                    string userCity = "";

                    if (cityDropDownList.Visible && cityDropDownList.SelectedItem != null)
                    {
                        userCity = cityDropDownList.SelectedItem.Text;
                    }
                    else if (cityTextBox.Visible)
                    {
                        userCity = cityTextBox.Value;
                    }  
                    command.Parameters.AddWithValue("_user_city", userCity);
                    //command.Parameters.AddWithValue("_user_country", ddlCountry.SelectedItem.Text);
                    //command.Parameters.AddWithValue("_user_country", ddlCountry.SelectedValue);

                    command.Parameters.AddWithValue("_user_icecontact", icecontactTextBox.Value);
                    //command.Parameters.AddWithValue("_user_relativecontact", relativecontactTextBox.Value);

                    //command.Parameters.AddWithValue("_user_doctor", famdocTextBox.Value);
                    //command.Parameters.AddWithValue("_user_relation", "");
                    command.Parameters.AddWithValue("_user_membernumber", member);
                    command.Parameters.AddWithValue("_user_image", filePath);
                    connection.Open();
                    command.ExecuteNonQuery();
                    connection.Close();

                    //commented by chetan dated on 07/11/2023
                    //string email = emailTextBox.Value.ToString();
                    //string subject = "# Verification code";
                    //string body = $"<p style=\"text-align: justify;\">Dear {firstNameTextBox.Value},&nbsp;</p>\r\n<p style=\"text-align: justify;\">Thank you for signing up for Hfiles! We&apos;re delighted to have you as a member of our community, and we appreciate your trust in our platform.&nbsp;</p>\r\n<p style=\"text-align: justify;\">Now that you&apos;re officially part of Hfiles, you can take the first step in managing your medical data. Simply log into your account by visiting [Login Page] and use your registered credentials to access your personalized dashboard.&nbsp;</p>\r\n<p style=\"text-align: justify;\">Once you&apos;re logged in, you&apos;ll be able to:&nbsp;</p>\r\n<ol>\r\n    <li style=\"text-align: justify;\">Fill Medical Records: Easily input and update your medical history, prescriptions, and other vital information.</li>\r\n    <li style=\"text-align: justify;\">Upload Documents: Safely upload and store important medical documents, test results, and reports</li>\r\n</ol>\r\n<p style=\"text-align: justify;\">Our user-friendly interface and secure storage ensure that your medical data is organized and readily accessible when you need it most.</p>\r\n<p style=\"text-align: justify;\">If you have any questions or need assistance, our support team is here to help. Simply reach out to us at [Support Email], and we&apos;ll be happy to assist you.</p>\r\n<p style=\"text-align: justify;\">Thank you for choosing Hfiles to manage your medical information. We&apos;re committed to providing you with a secure and convenient platform for all your healthcare needs.&nbsp;</p>\r\n<p style=\"text-align: justify;\">Email footer/ Privacy Agreement: Thank you for choosing Hfiles to manage your medical information. We&apos;re committed to providing you with a secure and convenient platform for all your healthcare needs. Your medical data is treated with the utmost confidentiality and is stored securely using the latest encryption protocols. We strictly adhere to all relevant data protection laws and regulations to ensure that your information remains private and protected. Your data will not be shared with any third parties without your explicit consent</p>";
                    //DAL.SendCareerMail(subject, body, email);

                    if (Bind() > 0)
                    {
                        Response.Redirect("~/Dashboard.aspx");
                    }
                    else
                    {
                        //err
                    }
                }
            }
        }

        public void getbasicdetails(int id)
        {
            using (MySqlConnection connection = new MySqlConnection(connectionString))
            {
                connection.Open();
                using (MySqlCommand command = new MySqlCommand("getUserDetails", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    // Add parameters to the command
                    command.Parameters.AddWithValue("_Id", id);
                    using (MySqlDataReader reader = command.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            // Populate the HTML controls with user details.
                            firstNameTextBox.Value = reader["user_firstname"].ToString();
                            lastNameTextBox.Value = reader["user_lastname"].ToString();
                            selectgender.Value = reader["user_gender"].ToString();
                            //dobTextBox1.Value = reader["user_dob"].ToString();
                            DateTime dob = Convert.ToDateTime(reader["user_dob"]);
                            txtDate.Text = dob.ToString("dd-MM-yyyy");
                            bloodgroup.Value = reader["user_bloodgroup"].ToString();
                            //dialcode.Text = ddlCountry.SelectedValue.ToString();
                            //stateTextBox.Value = reader["user_state"].ToString();
                            cityTextBox.Value = reader["user_city"].ToString();
                            txtpincode.Value = reader["pincode"].ToString();
                            string userState = stateTextBox.Value;
                            string userCity = cityTextBox.Value;
                            if (reader["countrycode"].ToString() != string.Empty)
                            {
                                if (reader["countrycode"].ToString().Trim() == "IND +91")
                                {
                                    //ddlCountry.Items.FindByText(reader["user_country"].ToString()).Selected = true;
                                    //ddlCountry_SelectedIndexChanged(null, null);
                                    string dialingCode = reader["dialingcode"].ToString();
                                    //dialcode.Text = dialingCode;

                                    string countryCode = GetCountryCodeFromDialCode(dialingCode);
                                    flagImage.Src = GetFlagApiUrl(countryCode);

                                    if (reader["user_state"].ToString() != string.Empty)
                                    {
                                        getstatelist();
                                        stateDropDownList.SelectedItem.Text = reader["user_state"].ToString(); ;
                                        getcitylist(userState);
                                        cityDropDownList.SelectedItem.Text = userCity;

                                    }
                                    else if (reader["user_state"].ToString() != string.Empty)
                                    {
                                        cityDropDownList.SelectedItem.Text = userCity;
                                    }
                                }
                                else
                                {

                                    string dialingCode = reader["dialingcode"].ToString();
                                     countryCode = GetCountryCodeFromDialCode(dialingCode);
                                    Session["countryCode"] = countryCode;
                                    flagImage.Src = GetFlagApiUrl(countryCode);
                                    //ddlCountry.Items.FindByText(reader["user_country"].ToString()).Selected = true;
                                    //ddlCountry_SelectedIndexChanged(null, null);
                                    if (reader["user_state"].ToString() != string.Empty)
                                    {
                                        stateTextBox.Value = reader["user_state"].ToString();
                                        //getcitylist(stateDropDownList.SelectedItem.Text);

                                    }
                                    if (reader["user_city"].ToString() != string.Empty)
                                    {
                                        cityTextBox.Value = reader["user_city"].ToString();
                                    }
                                }

                            }

                            //ddlState.SelectedItem.Text = reader["user_state"].ToString();
                            //cityDropDownList.SelectedItem.Text = reader["user_city"].ToString();

                            else
                            {
                                //cityDropDownList.SelectedItem.Text = "Mumbai";
                            }

                            //if (ddlCountry.SelectedItem.Text == "India")
                            //{
                            //    stateDropDownList.SelectedItem.Text = reader["user_state"].ToString();
                            //    cityDropDownList.SelectedItem.Text = reader["user_city"].ToString();
                            //}
                            contactTextBox.Value = reader["user_contact"].ToString();
                            icecontactTextBox.Value = reader["user_icecontact"].ToString();
                            //relativecontactTextBox.Value = reader["user_relativecontact"].ToString();
                            emailTextBox.Value = reader["user_email"].ToString();
                            //famdocTextBox.Value = reader["user_doctor"].ToString();

                            string imagePath = "~/upload/" + reader["user_image"].ToString();

                            // Check if the database value is blank
                            if (string.IsNullOrEmpty(reader["user_image"].ToString()))
                            {
                                // Use a default image when the database value is blank
                                imagePath = "../My Data/default-user-profile.png";
                            }
                            Session["ProfileImage"] = reader["user_image"].ToString(); ;
                            imagePreview.Src = imagePath;

                            //imagePreview.Src = "~/upload/"+reader["user_image"].ToString();
                        }
                    }
                    command.ExecuteNonQuery();
                    connection.Close();
                }
            }
        }

        protected int Bind()
        {
            int result = 0;
            try
            {
                using (MySqlConnection con = new MySqlConnection(connectionString))
                {
                    con.Open();
                    using (MySqlCommand cmd = new MySqlCommand("usp_isuserexists", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("_MobileNoOrEmail", emailTextBox.Value);
                        cmd.Parameters.Add("_Result", MySqlDbType.Int32).Direction = ParameterDirection.Output;
                        cmd.ExecuteNonQuery();
                        result = DAL.validateInt(cmd.Parameters["_Result"].Value.ToString());
                        Session["Userid"] = result.ToString();
                    }
                }

            }
            catch (Exception Ex)
            {


            }
            return result;
        }

        private string GetCountryCodeFromDialCode(string dialCode)
        {
            switch (dialCode)
            {
                case "+1": return "US"; // United States
                case "+44": return "GB"; // United Kingdom
                case "+91": return "IN"; // India
                case "+81": return "JP"; // Japan
                case "+61": return "AU"; // Australia
                case "+49": return "DE"; // Germany
                case "+33": return "FR"; // France
                case "+39": return "IT"; // Italy
                case "+86": return "CN"; // China
                case "+7": return "RU"; // Russia
                case "+34": return "ES"; // Spain
                case "+55": return "BR"; // Brazil
                case "+27": return "ZA"; // South Africa
                case "+82": return "KR"; // South Korea
                case "+31": return "NL"; // Netherlands
                case "+46": return "SE"; // Sweden
                case "+41": return "CH"; // Switzerland
                case "+351": return "PT"; // Portugal
                case "+32": return "BE"; // Belgium
                case "+48": return "PL"; // Poland
                case "+47": return "NO"; // Norway
                case "+90": return "TR"; // Turkey
                case "+380": return "UA"; // Ukraine
                case "+66": return "TH"; // Thailand
                case "+60": return "MY"; // Malaysia
                case "+65": return "SG"; // Singapore
                case "+62": return "ID"; // Indonesia
                case "+63": return "PH"; // Philippines
                case "+64": return "NZ"; // New Zealand
                case "+20": return "EG"; // Egypt
                case "+971": return "AE"; // United Arab Emirates
                case "+966": return "SA"; // Saudi Arabia
                case "+98": return "IR"; // Iran
                case "+972": return "IL"; // Israel
                case "+92": return "PK"; // Pakistan
                case "+880": return "BD"; // Bangladesh
                case "+94": return "LK"; // Sri Lanka
                case "+84": return "VN"; // Vietnam
                case "+855": return "KH"; // Cambodia
                case "+856": return "LA"; // Laos
                case "+95": return "MM"; // Myanmar
                case "+977": return "NP"; // Nepal
                case "+254": return "KE"; // Kenya
                case "+255": return "TZ"; // Tanzania
                case "+256": return "UG"; // Uganda
                case "+234": return "NG"; // Nigeria
                case "+233": return "GH"; // Ghana
                case "+212": return "MA"; // Morocco
                case "+213": return "DZ"; // Algeria
                case "+216": return "TN"; // Tunisia
                case "+218": return "LY"; // Libya
                case "+251": return "ET"; // Ethiopia
                case "+252": return "SO"; // Somalia
                case "+263": return "ZW"; // Zimbabwe
                case "+260": return "ZM"; // Zambia
                case "+250": return "RW"; // Rwanda
                case "+93": return "AF"; // Afghanistan
                case "+964": return "IQ"; // Iraq
                case "+962": return "JO"; // Jordan
                case "+961": return "LB"; // Lebanon
                case "+968": return "OM"; // Oman
                case "+974": return "QA"; // Qatar
                case "+963": return "SY"; // Syria
                case "+967": return "YE"; // Yemen
                default: return "UN"; // Unknown
            }
        }

        private string GetFlagApiUrl(string countryCode)
        {
            // Using CountryFlags API
            return $"https://flagcdn.com/w40/{countryCode.ToLower()}.png";

            // For backup use FlagCDN:
            // return $"https://flagcdn.com/w40/{countryCode.ToLower()}.png";
        }

        public void clear()
        {
            firstNameTextBox.Value = null;
            lastNameTextBox.Value = null;
            stateTextBox.Value = null;
            cityTextBox.Value = null;
            //ddlCountry.ClearSelection();
            //ddlCountry.SelectedValue = null;
            contactTextBox.Value = null;
            icecontactTextBox.Value = null;
            emailTextBox.Value = null;
            //famdocTextBox.Value = null;
            dobTextBox1.Value = null;
            txtDate.Text = null;
            selectgender.Value = null;
        }
        #endregion

        //protected void ddlCountry_SelectedIndexChanged(object sender, EventArgs e)
        //{

        //    if (ViewState["CountryCodeList"] != null)
        //    {
        //        DataTable dt = (DataTable)ViewState["CountryCodeList"];
        //        if (dt != null && dt.Rows.Count > 0)
        //        {
        //            int countryId = DAL.validateInt(ddlCountry.SelectedValue.ToString());

        //            if (dt.AsEnumerable().Where(p => p["id"].ToString() == ddlCountry.SelectedValue.ToString()).AsDataView().Count > 0)
        //            {
        //                dialcode.Text = dt.AsEnumerable().Where(p => p["id"].ToString() == ddlCountry.SelectedValue.ToString()).Select(p => p.Field<string>("dialingcode")).FirstOrDefault();
        //            }

        //        }
        //    }
        //    else
        //    {

        //    }
        //    if (ddlCountry.SelectedItem.Text == "India")
        //    {
        //        getstatelist();
        //        stateTextBox.Visible = false;
        //        cityTextBox.Visible = false;
        //        stateDropDownList.Visible = true;
        //        cityDropDownList.Visible = true;
        //        rfvstateDropDownList.Enabled = true;
        //        rfvstateTextbox.Enabled = false;
        //        rfvcityTextBox.Enabled = false;
        //    }
        //    else
        //    {
        //        stateDropDownList.DataSource = null;
        //        stateDropDownList.DataBind();
        //        cityDropDownList.DataSource = null;
        //        cityDropDownList.DataBind();
        //        stateTextBox.Visible = true;
        //        cityTextBox.Visible = true;
        //        stateDropDownList.Visible = false;
        //        cityDropDownList.Visible = false;
        //        rfvstateDropDownList.Enabled = false;
        //        rfvstateTextbox.Enabled = true;
        //        rfvcityTextBox.Enabled = true;
        //    }
        //}
        //protected void stateDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        //{

        //    string selectedState = stateDropDownList.SelectedValue;
        //    if (selectedState != "0")
        //    {
        //        getcitylist(selectedState);
        //    }
        //    else
        //    {
        //        cityDropDownList.Items.Clear();
        //        cityDropDownList.Items.Add(new ListItem("Select City", "0"));
        //    }
        //}


        //[System.Web.Services.WebMethod]
        //public static object GetCityStateByPincode(string pincode)
        //{
        //    string connectionString = ConfigurationManager.ConnectionStrings["signage"].ConnectionString;

        //    using (MySqlConnection con = new MySqlConnection(connectionString))
        //    {
        //        string query = "SELECT state, city FROM scp WHERE pincode = @pincode LIMIT 1";
        //        using (MySqlCommand cmd = new MySqlCommand(query, con))
        //        {
        //            cmd.Parameters.AddWithValue("@pincode", pincode);
        //            con.Open();

        //            using (MySqlDataReader reader = cmd.ExecuteReader())
        //            {
        //                if (reader.Read())
        //                {
        //                    return new
        //                    {

        //                      state = reader["state"].ToString(),
        //                        city = reader["city"].ToString()
        //                    };
        //                }
        //            }
        //        }
        //    }

        //    // Return empty strings if no match found
        //   return new { state = "", city = "" };
        //}


        private void HandleStateVisibility()
        {
            string countrycode = (Session["countryCode"]?.ToString() ?? "").Trim().ToUpper();

            if (countrycode.StartsWith("IND"))
            {
                // Bind state dropdown
                if (!IsPostBack || stateDropDownList.Items.Count <= 1)
                {
                    getstatelist(); // 🔴 THIS IS THE KEY MISSING LINE
                }

                // Show state dropdown
                stateDropDownList.Visible = true;
                rfvstateDropDownList.Enabled = true;
                stateTextBox.Visible = false;
                rfvstateTextbox.Enabled = false;

                // Show city dropdown
                cityDropDownList.Visible = true;
                rfvcityDropDownList.Enabled = true;
                cityTextBox.Visible = false;
                rfvcityTextBox.Enabled = false;

                string selectedStateValue = stateDropDownList.SelectedValue;

                if (!IsPostBack || cityDropDownList.Items.Count <= 1)
                {
                    getcitylist(selectedStateValue);
                }

                HandleCityVisibility(selectedStateValue);
            }
            else
            {
                // For other countries, show textboxes
                stateDropDownList.Visible = false;
                rfvstateDropDownList.Enabled = false;
                stateTextBox.Visible = true;
                rfvstateTextbox.Enabled = true;

                cityDropDownList.Visible = false;
                rfvcityDropDownList.Enabled = false;
                cityTextBox.Visible = true;
                rfvcityTextBox.Enabled = true;
            }
        }

        private void HandleCityVisibility(string stateValue)
        {
            string countrycode = (Session["countryCode"]?.ToString() ?? "").Trim().ToUpper();
            bool isIndia = countrycode == "IND +91" || countrycode == "IND";

            if (!isIndia)
            {
                cityTextBox.Visible = true;
                rfvcityTextBox.Enabled = true;

                cityDropDownList.Visible = false;
                rfvcityDropDownList.Enabled = false;
                return;
            }

            string selectedCityText = cityDropDownList.SelectedItem?.Text.Trim().ToLower() ?? "";
            string selectedCityValue = cityDropDownList.SelectedValue;

            bool invalidCity = selectedCityText == "no city found" || selectedCityValue == "0" || selectedCityText.Contains("please select");

            cityTextBox.Visible =!invalidCity;
            rfvcityTextBox.Enabled = !invalidCity;

            cityDropDownList.Visible = invalidCity;
            rfvcityDropDownList.Enabled = invalidCity;
        }

        protected void stateDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            string selectedStateText = stateDropDownList.SelectedItem.Text.ToLower();
            string selectedStateValue = stateDropDownList.SelectedValue;

            // Show TextBox if "No State Found" or invalid selection
            if (selectedStateText == "no state found" || selectedStateValue == "0" || selectedStateText.Contains("please select"))
            {
                stateTextBox.Visible = true;
                rfvstateTextbox.Enabled = true;

                stateDropDownList.Visible = false;
                rfvstateDropDownList.Enabled = false;

                // Clear and reset city dropdown
                cityDropDownList.Items.Clear();
                cityDropDownList.Items.Add(new System.Web.UI.WebControls.ListItem("Select City", "0"));
            }
            else
            {
                // Valid state selected, get cities and show dropdown
                stateTextBox.Visible = false;
                rfvstateTextbox.Enabled = false;

                stateDropDownList.Visible = true;
                rfvstateDropDownList.Enabled = true;

                getcitylist(selectedStateValue); // Call your method to load city
            }
        }

        protected void ddlState_SelectedIndexChanged(object sender, EventArgs e)
        {
            string selectedStateText = stateDropDownList.SelectedItem.Text.ToLower();
            string selectedStateValue = stateDropDownList.SelectedValue;
            HandleCityVisibility(selectedStateValue);
            getcitylist(stateDropDownList.SelectedItem.Text);
        }

       
    }
}