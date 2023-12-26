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
                if (Session["Userid"] != null)
                {

                }
            }
        }
        protected void btn_Submit_ServerClick(object sender, EventArgs e)
        {
            AddMember();
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
                    // Add parameters to the command
                    cmdInsert.Parameters.AddWithValue("_user_reference", Session["Userid"].ToString());
                    cmdInsert.Parameters.AddWithValue("_user_firstname", firstnameTextBox.Value);
                    cmdInsert.Parameters.AddWithValue("_user_lastname", lastnameTextBox.Value);
                    cmdInsert.Parameters.AddWithValue("_user_dob", dobTextBox1.Value);
                    cmdInsert.Parameters.AddWithValue("_user_contact", phoneTextBox.Value);
                    cmdInsert.Parameters.AddWithValue("_user_email", emailTextBox.Value);
                    cmdInsert.Parameters.AddWithValue("_user_password", membershippasword);
                    cmdInsert.Parameters.AddWithValue("_user_membernumber", member);
                    cmdInsert.Parameters.AddWithValue("_user_isactive", false);
                    cmdInsert.Parameters.AddWithValue("_user_uniquekey", uniqueid);

                    cmdInsert.Parameters.Add("_Result", MySqlDbType.Int32);
                    cmdInsert.Parameters["_Result"].Direction = ParameterDirection.Output;
                    cmdInsert.ExecuteNonQuery();
               
                    int result = DAL.validateInt(cmdInsert.Parameters["_Result"].Value.ToString());
                    if (result == 1)
                    {
                        string email = emailTextBox.Value.ToString();
                        //string subject = "# Verification code";
                        string subject = "Welcome to HFiles - Start Managing Your Medical Data";
                        string body = $"<p style=\"text-align: justify;\">Dear {firstnameTextBox.Value},&nbsp;</p>\r\n<p style=\"text-align: justify;\">Please verify your Email Id to complete signup process.&nbsp;</p>\r\n<p style=\"text-align: justify;\">Use below link to verify your Email Id.&nbsp;<br> http://68.178.164.174//membersignup.aspx/?id={uniqueid}</p> <p style=\"text-align: justify;\">Use below password for sigining up {membershippasword}.&nbsp;</p>";
                        DAL.SendCareerMail(subject, body, email);
                        Response.Write("<script>alert('Memeber added successfully.')</script>");
                        Response.Redirect("avatar.aspx");
                    }
                    else if (result == 0)
                    {
                        Response.Write("<script>alert('Memeber already exists with same email id!')</script>");
                        Response.Redirect("avatar.aspx");
                    }
                }
                //using (MySqlCommand cmd = new MySqlCommand("usp_addmember", con))
                //{
                //    cmd.CommandType = CommandType.StoredProcedure;
                //    cmd.Parameters.AddWithValue("_UserReferenceId", DAL.validateInt(Session["Userid"])); //Session["Userid"];
                //    cmd.Parameters.AddWithValue("_MemberType", DAL.validateInt(hfMemberType.Value)); //Session["Userid"];
                //    cmd.Parameters.AddWithValue("_FirstName", (name.Value));
                //    cmd.Parameters.AddWithValue("_LastName", (lastname.Value));
                //    cmd.Parameters.AddWithValue("_RelationType", DAL.validateInt(hfMemberType.Value) == 1 ? (relation.Value) : "friend");
                //    cmd.Parameters.AddWithValue("_EmailId", (emailid.Value));
                //    cmd.Parameters.AddWithValue("_PhoneNo", (phoneno.Value));
                //    cmd.Parameters.AddWithValue("_AltPhoneNo", (""));
                //    cmd.Parameters.Add("_Result", MySqlDbType.Int32).Direction = ParameterDirection.Output;
                //    cmd.ExecuteNonQuery();
                //    int result = DAL.validateInt(cmd.Parameters["_Result"].Value.ToString());
                //    if (result == 1)
                //    {
                //        Response.Write("<script>alert('Memeber added successfully.')</script>");
                //        Response.Redirect("avatar.aspx");
                //    }
                //    else if (result == 0)
                //    {
                //        Response.Write("<script>alert('Memeber already exists with same email id!')</script>");
                //        Response.Redirect("avatar.aspx");
                //    }
                //    // hfId.Value =
                //}
            }
        }
    }
}
#endregion