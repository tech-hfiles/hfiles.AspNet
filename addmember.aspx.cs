using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Diagnostics.Metrics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hfiles
{
    public partial class addmember : System.Web.UI.Page
    {
        #region variable
        string cs = ConfigurationManager.ConnectionStrings["signage"].ConnectionString, img, ext;

        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //if (Session["Userid"] != null)
                //{
                //    bindData(DAL.validateInt(Session["Userid"].ToString()));
                //}
                //else
                //{
                //    Response.Redirect("~/login.aspx");
                //}
                //PopulateUserDetails(Session["Userid"].ToString());
                if (Session["Userid"] != null || Session["Userid"] == "")
                {
                    PopulateUserDetails(Session["Userid"].ToString());
                    //added for getting email and password on page load
                    //int Userid = Convert.ToInt32(Session["Userid"].ToString());
                    //PopulateUserDetails(Session["Userid"].ToString());
                }
                else
                {
                    Response.Redirect("~/login.aspx");
                }
                if (Request.QueryString["UserId"] != null)
                {
                    string userId = Request.QueryString["UserId"];

                    // Use the userId to fetch user details from the database
                    // and pre-fill the form fields
                    PopulateUserDetails(userId);
                }
            }
        }
        protected void btn_Submit_ServerClick(object sender, EventArgs e)
        {
            AddMember();
        }

        private void PopulateUserDetails(string userId)
        {
            using (MySqlConnection connection = new MySqlConnection(cs))
            {
                connection.Open();
                using (MySqlCommand command = new MySqlCommand("getUserDetails", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    // Add parameters to the command
                    command.Parameters.AddWithValue("_Id", userId);
                    using (MySqlDataReader reader = command.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            //firstnameTextBox.Value = reader["user_firstname"].ToString();
                           // lastnameTextBox.Value = reader["user_lastname"].ToString();
                            phoneTextBox.Value = reader["user_contact"].ToString();
                            emailTextBox.Value = reader["user_email"].ToString();
                            //relation.Value = reader["user_relation"].ToString();
                            //dobTextBox1.Value = reader["user_dob"].ToString();
                        }
                    }
                    command.ExecuteNonQuery();
                    connection.Close();
                }
            }
            //usp_getuserdetailsbyId
        }
        protected void request_Click(object sender, EventArgs e)
        {
            using (MySqlConnection connection = new MySqlConnection(this.cs))
            {
                connection.Open();
                using (MySqlCommand mySqlCommand = new MySqlCommand("usp_existingmember", connection))
                {
                    mySqlCommand.CommandType = CommandType.StoredProcedure;
                    mySqlCommand.Parameters.AddWithValue("_hf_number", (object)this.hfnumber.Text);
                    mySqlCommand.Parameters.AddWithValue("_user_id", (object)Convert.ToInt32(this.Session["Userid"].ToString()));
                    mySqlCommand.Parameters.AddWithValue("_spType", "check"); // Pass 'check' for checking existence and inserting request
                    mySqlCommand.Parameters.Add("_Result", MySqlDbType.Int32).Direction = ParameterDirection.Output;
                    mySqlCommand.ExecuteNonQuery();

                    int result = Convert.ToInt32(mySqlCommand.Parameters["_Result"].Value);
                    if (result == 1)
                    {
                        using (MySqlCommand mySqlCommand1 = new MySqlCommand("usp_existingmember", connection))
                        {
                            mySqlCommand1.CommandType = CommandType.StoredProcedure;
                            mySqlCommand1.Parameters.AddWithValue("_hf_number", (object)this.hfnumber.Text);
                            mySqlCommand1.Parameters.AddWithValue("_user_id", (object)Convert.ToInt32(this.Session["Userid"].ToString()));
                            mySqlCommand1.Parameters.AddWithValue("_spType", 'C');
                            mySqlCommand1.Parameters.Add("_Result", MySqlDbType.Int32).Direction = ParameterDirection.Output;
                            mySqlCommand1.ExecuteNonQuery();

                            int result1 = Convert.ToInt32(mySqlCommand1.Parameters["_Result"].Value);

                            if (result1 == 1)
                            {
                                // Request sent
                                System.Web.UI.ScriptManager.RegisterClientScriptBlock((Page)this, this.GetType(), "alertMessage", "alert('Request Sent')", true);
                            }
                            else if (result1 == 2)
                            {
                                // Request already sent
                                System.Web.UI.ScriptManager.RegisterClientScriptBlock((Page)this, this.GetType(), "alertMessage", "alert('Request Already Sent')", true);
                            }
                            //else if (result1 == 0)
                            //{
                            //    // User does not exist
                            //    System.Web.UI.ScriptManager.RegisterClientScriptBlock((Page)this, this.GetType(), "alertMessage", "alert('User Does Not Exist')", true);
                            //}
                            //else
                            //{
                            //    // Handle other cases if needed
                            //}
                            //Member exists and request sent
                            System.Web.UI.ScriptManager.RegisterClientScriptBlock((Page)this, this.GetType(), "alertMessage", "alert('Request Sent')", true);
                            connection.Close();
                        }
                    }
                    else
                    {
                        // Member does not exist
                        System.Web.UI.ScriptManager.RegisterClientScriptBlock((Page)this, this.GetType(), "alertMessage", "alert('Member does not exist')", true);
                    }
                    //connection.Close();
                }
                connection.Close();
            }
        }

        protected void AddMember()
        {
            Random random = new Random();
            int randomNumber = random.Next(1000, 9999);
            int randomNumber2 = random.Next(10, 99);

            // Format the date of birth in MMDDYYYY format
            string formattedDateOfBirth = Convert.ToDateTime(dobTextBox1.Value).ToString("MMddyy");

            // Take a portion of the last name (first three characters)
            string partialLastName = firstnameTextBox.Value.Substring(0, Math.Min(3, lastnameTextBox.Value.Length)).ToUpper();

            // Concatenate the components to create the membership number
            string membershipNumber = $"HF{formattedDateOfBirth}{partialLastName}{randomNumber}";
            string membershippasword = $"HF{partialLastName}{randomNumber}";

            #region variable
            string member = membershipNumber;
            string password = membershippasword;
            string uniqueid = randomNumber + membershipNumber + randomNumber2;

            using (MySqlConnection con = new MySqlConnection(cs))
            {
                con.Open();
                using (MySqlCommand cmdInsert = new MySqlCommand("usp_signup", con))
                {
                    cmdInsert.CommandType = CommandType.StoredProcedure;

                    string selectedRelation = relation.Value;

                    int age = CalculateAge(Convert.ToDateTime(dobTextBox1.Value));
                    //if ((selectedRelation == "son" || selectedRelation == "daughter" || selectedRelation == "grandfather" || selectedRelation == "grandmother" || selectedRelation == "cat" || selectedRelation == "dog") && (age < 17 || age > 70)) 
                    int gender = 0;
                    if (selectedRelation == "son" || selectedRelation == "grandfather" || selectedRelation == "uncle")
                    {
                        gender = 1;
                    }
                    else if (selectedRelation == "daughter" || selectedRelation == "grandmother" || selectedRelation == "aunt")
                    {
                        gender = 2;
                    }
                    else if (selectedRelation == "cat")
                    {
                        gender = 4;
                    }
                    else if (selectedRelation == "dog")
                    {
                        gender = 5;
                    }
                    if (age < 17 || age > 70)
                    {
                        cmdInsert.Parameters.AddWithValue("_user_reference", Session["Userid"].ToString());
                        cmdInsert.Parameters.AddWithValue("_user_firstname", firstnameTextBox.Value);
                        cmdInsert.Parameters.AddWithValue("_user_lastname", lastnameTextBox.Value);
                        cmdInsert.Parameters.AddWithValue("_user_dob", dobTextBox1.Value);
                        cmdInsert.Parameters.AddWithValue("_user_relation", selectedRelation);
                        cmdInsert.Parameters.AddWithValue("_user_email", Session["user_email"].ToString());
                        cmdInsert.Parameters.AddWithValue("_user_contact", Session["user_contact"].ToString());
                        cmdInsert.Parameters.AddWithValue("_user_gender", gender);
                        cmdInsert.Parameters.AddWithValue("_user_password", "0");
                        cmdInsert.Parameters.AddWithValue("_user_membernumber", member);
                        cmdInsert.Parameters.AddWithValue("_user_uniquekey", "0");
                        cmdInsert.Parameters.AddWithValue("_user_isactive", true);
                        cmdInsert.Parameters.AddWithValue("_chkmail", 0);
                        cmdInsert.Parameters.Add("_Result", MySqlDbType.Int32);
                        cmdInsert.Parameters["_Result"].Direction = ParameterDirection.Output;
                        cmdInsert.ExecuteNonQuery();
                        int result = DAL.validateInt(cmdInsert.Parameters["_Result"].Value.ToString());
                        if (result == 0)
                        {
                            Response.Write("<script>alert('Memeber already exists with same email id !')</script>");
                            //Response.Write("<script>alert('Memeber added successfully !')</script>");
                            Response.Redirect("avatar.aspx");
                        }
                    }
                    else
                    {
                        cmdInsert.Parameters.AddWithValue("_user_reference", Session["Userid"].ToString());
                        cmdInsert.Parameters.AddWithValue("_user_firstname", firstnameTextBox.Value);
                        cmdInsert.Parameters.AddWithValue("_user_lastname", lastnameTextBox.Value);
                        cmdInsert.Parameters.AddWithValue("_user_dob", dobTextBox1.Value);
                        cmdInsert.Parameters.AddWithValue("_user_relation", selectedRelation);
                        cmdInsert.Parameters.AddWithValue("_user_email", emailTextBox.Value);
                        cmdInsert.Parameters.AddWithValue("_user_contact", phoneTextBox.Value);
                        cmdInsert.Parameters.AddWithValue("_user_password", membershippasword);
                        cmdInsert.Parameters.AddWithValue("_user_gender", gender);
                        cmdInsert.Parameters.AddWithValue("_user_membernumber", member);
                        cmdInsert.Parameters.AddWithValue("_user_uniquekey", uniqueid);
                        cmdInsert.Parameters.AddWithValue("_user_isactive", false);
                        cmdInsert.Parameters.AddWithValue("_chkmail", 1);
                        cmdInsert.Parameters.Add("_Result", MySqlDbType.Int32);
                        cmdInsert.Parameters["_Result"].Direction = ParameterDirection.Output;
                        cmdInsert.ExecuteNonQuery();
                        int result = DAL.validateInt(cmdInsert.Parameters["_Result"].Value.ToString());
                        if (result == 1)
                        {
                            string email = emailTextBox.Value.ToString();
                            //string subject = "# Verification code";
                            string subject = "Welcome to HFiles";
                            string body = $"<p style=\"text-align: justify;\">Dear {firstnameTextBox.Value},&nbsp;</p>\r\n<p style=\"text-align: justify;\"> {Session["username"].ToString()} has added you to HFiles Portal,&nbsp;</p>\r\n<p style=\"text-align: justify;\">Please verify your Email Id to complete signup process.&nbsp;</p>\r\n<p style=\"text-align: justify;\">Use below link to verify your Email Id.&nbsp;<br> http://68.178.164.174//membersignup.aspx/?id={uniqueid}</p> <p style=\"text-align: justify;\">&nbsp;</p>";
                            //Use below password for sigining up { membershippasword}

                            DAL.SendCareerMail(subject, body, email);
                            Response.Write("<script>alert('Memeber added successfully.')</script>");
                            //newly added below code(usign block) for sending requests to created members
                            using (MySqlCommand mySqlCommand1 = new MySqlCommand("usp_existingmember", con))
                            {
                                mySqlCommand1.CommandType = CommandType.StoredProcedure;
                                mySqlCommand1.Parameters.AddWithValue("_hf_number", member);
                                mySqlCommand1.Parameters.AddWithValue("_user_id", (object)Convert.ToInt32(this.Session["Userid"].ToString()));
                                mySqlCommand1.Parameters.AddWithValue("_spType", 'C');
                                mySqlCommand1.Parameters.Add("_Result", MySqlDbType.Int32).Direction = ParameterDirection.Output;
                                mySqlCommand1.ExecuteNonQuery();
                                // Member exists and request sent
                                System.Web.UI.ScriptManager.RegisterClientScriptBlock((Page)this, this.GetType(), "alertMessage", "alert('Request Sent')", true);
                                //connection.Close();
                                Response.Redirect("avatar.aspx");


                            }
                        }
                        Response.Write("<script>alert('Memeber already exists with same email id !')</script>");
                    }

                    //cmdInsert.Parameters.Add("_Result", MySqlDbType.Int32);
                    //cmdInsert.Parameters["_Result"].Direction = ParameterDirection.Output;
                    //cmdInsert.ExecuteNonQuery();

                    //int result = DAL.validateInt(cmdInsert.Parameters["_Result"].Value.ToString());
                    //if (result == 1)
                    //{
                    //    string email = emailTextBox.Value.ToString();
                    //    //string subject = "# Verification code";
                    //    string subject = "Welcome to HFiles";
                    //    string body = $"<p style=\"text-align: justify;\">Dear {firstnameTextBox.Value},&nbsp;</p>\r\n<p style=\"text-align: justify;\">Please verify your Email Id to complete signup process.&nbsp;</p>\r\n<p style=\"text-align: justify;\">Use below link to verify your Email Id.&nbsp;<br> http://68.178.164.174//membersignup.aspx/?id={uniqueid}</p> <p style=\"text-align: justify;\">&nbsp;</p>";
                    //    //Use below password for sigining up { membershippasword}

                    //    DAL.SendCareerMail(subject, body, email);
                    //    Response.Write("<script>alert('Memeber added successfully.')</script>");
                    //    Response.Redirect("avatar.aspx");
                    //}
                    //else if (result == 0)
                    //{
                    //    Response.Write("<script>alert('Memeber already exists with same email id!')</script>");
                    //    Response.Redirect("avatar.aspx");
                    //}
                }
            }
        }
        private int CalculateAge(DateTime birthdate)
        {
            DateTime currentDate = DateTime.Now;
            int age = currentDate.Year - birthdate.Year;

            if (currentDate.Month < birthdate.Month || (currentDate.Month == birthdate.Month && currentDate.Day < birthdate.Day))
            {
                age--;
            }

            return age;
        }
    }
}
#endregion