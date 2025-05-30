using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Drawing.Imaging;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hfiles
{
    public partial class user : System.Web.UI.MasterPage
    {
        string connectionString = ConfigurationManager.ConnectionStrings["signage"].ConnectionString;
        int requestCount;
        int userid;
        public Dictionary<int, string> bloodGroups = new Dictionary<int, string>
{
            { 0, "" },
    { 1, "A+" },
    { 2, "A-" },
    { 3, "B+" },
    { 4, "B-" },
    { 5, "AB+" },
    { 6, "AB-" },
    { 7, "O+" },
    { 8, "O-" }
};
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Userid"] is null)
            {
                if (Session["JournalPath"] != null)
                {
                    //getbasicdetails();
                }
                else
                {
                    Response.Redirect("~/login.aspx");
                }




                //Response.Redirect("~/login.aspx");
            }
            else
            {
                int userid = DAL.validateInt(Session["Userid"]);
                string plan = GetUserSubscription(userid); // e.g., "Gold"

                if (plan == "Basic")
                    profileImageContainer.Attributes["class"] += " ring-basic";
                else if (plan == "Standard")
                    profileImageContainer.Attributes["class"] += " ring-standard";
                else if (plan == "Premium")
                    profileImageContainer.Attributes["class"] += " ring-premium";

                //sesion user_membernumber replaced by username
                if (Session["username"] != null)
                {
                    // Check if there are any requests

                    //ReqCount.Text = requestCount.ToString();
                    using (MySqlConnection con = new MySqlConnection(connectionString))
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



                            //MasterPage page = new MasterPage();
                            //Label ReqCount = Master.FindControl("ReqCount") as Label;
                            ReqCount.Text = dt != null && dt.Rows.Count > 0 ? dt.Rows.Count.ToString() : "0";
                            bool hasRequests = HasRequests();
                            if (hasRequests == true)
                            {
                                // Or your condition
                                requestDot.Text = hasRequests ? "●" : "";
                                requestDot.ForeColor = System.Drawing.Color.Red;
                                requestDot.Visible = hasRequests;
                            }
                            else
                            {
                                // Handle case when requestDot is not found
                                requestDot.Text = "";
                            }
                        }
                    }
                    //managerMembersTab.Text = $"Manager Members ({requestCount})";
                    memberLabel.Text = Session["username"].ToString();
                    memberId.Text = Session["user_membernumber"].ToString();
                    if (Session["userpic"] != null && !string.IsNullOrEmpty(Session["userpic"].ToString()))
                    {
                        profile.ImageUrl = "~/upload/" + Session["userpic"].ToString();
                    }
                    else
                    {
                        profile.ImageUrl = "../My Data/default-user-profile.png";
                    }

                    getbasicdetails();


                }
            }
        }

        public void getbasicdetails()
        {
            using (MySqlConnection connection = new MySqlConnection(connectionString))
            {
                connection.Open();
                using (MySqlCommand command = new MySqlCommand("getUserDetails", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    // Add parameters to the command
                    command.Parameters.AddWithValue("_Id", DAL.validateInt(Session["Userid"]));
                    using (MySqlDataReader reader = command.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            // Populate the HTML controls with user details.
                            string Name = reader["user_firstname"].ToString() + " " + reader["user_lastname"].ToString();
                            string ubg = reader["user_bloodgroup"].ToString();
                            if (string.IsNullOrEmpty(ubg))
                            {
                                ubg = "0";
                            }
                            int BloodGroup = Convert.ToInt32(ubg);
                            string Contact = reader["user_icecontact"].ToString();
                            string Expiry = reader["date_ofExpiryPlan"].ToString();
                            string UserPlan = reader["subscriptionplan_status"].ToString();

                            string bgroup = "";

                            bloodGroups.TryGetValue(BloodGroup, out bgroup);
                            string memberIdText = memberId.Text;
                            membershipImage.ImageUrl = LoadMembershipCard(Name, bgroup, Contact, Expiry, UserPlan, memberIdText);
                        }
                    }
                    command.ExecuteNonQuery();
                    connection.Close();
                }
            }
        }
        public string LoadMembershipCard(string UnserNameText, string BloodGroupText, string EmergencyContact, string ExpiryText, string UserPlan, string memberIdText)
        {

            //Change Image According to User Plan
            string imagePath;

            //int userid = DAL.validateInt(Session["UserID"].ToString());
            string plan = GetUserSubscription(userid); // e.g., "Gold"

            if (UserPlan == "Advanced")
                imagePath = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "assets", "membershipcard", "5.png");
            else if (UserPlan == "Standard")
                imagePath = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "assets", "membershipcard", "2.png");
            else if (UserPlan == "Premium")
                imagePath = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "assets", "membershipcard", "3.png");
            else
                imagePath = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "assets", "membershipcard", "4.png");


            Bitmap bitmap = new Bitmap(imagePath);

            // Create graphics object
            Graphics graphics = Graphics.FromImage(bitmap);

            // Define the font and text format
            Font font = new Font("Arial", 12, FontStyle.Bold);
            Font userfont = new Font("Arial", 9);
            Font commonfont = new Font("Arial", 5);
            Font commondatafont = new Font("Arial", 5, FontStyle.Bold);
            Font customerServicefont = new Font("Arial", 4);
            Font customerServiceDatafont = new Font("Arial", 4, FontStyle.Bold);
            Brush brush = new SolidBrush(Color.Black); // Text color

            // Calculate the position to center the text

            string CustomerServiceContact = ConfigurationManager.AppSettings["customerServiceMobile"].ToString();

            SizeF textSize = graphics.MeasureString(memberIdText, font);
            PointF memberIdPosition = new PointF(((bitmap.Width - textSize.Width) / 2) + 80, ((bitmap.Height - textSize.Height) / 2) - 65);
            PointF userNamePosition = new PointF(((bitmap.Width - textSize.Width) / 2) + 80, ((bitmap.Height - textSize.Height) / 2) + 35);
            PointF BloodGroupPosition = new PointF(((bitmap.Width - textSize.Width) / 2) + 80, ((bitmap.Height - textSize.Height) / 2) + 105);
            PointF BloodGroupDataPosition = new PointF(((bitmap.Width - textSize.Width) / 2) + 220, ((bitmap.Height - textSize.Height) / 2) + 105);

            PointF ExpiryPosition = new PointF(((bitmap.Width - textSize.Width) / 2) + 390, ((bitmap.Height - textSize.Height) / 2) + 105);
            PointF ExpiryDataPosition = new PointF(((bitmap.Width - textSize.Width) / 2) + 465, ((bitmap.Height - textSize.Height) / 2) + 105);
            PointF ContactPosition = new PointF(((bitmap.Width - textSize.Width) / 2) + 80, ((bitmap.Height - textSize.Height) / 2) + 165);
            PointF ContactDataPosition = new PointF(((bitmap.Width - textSize.Width) / 2) + 285, ((bitmap.Height - textSize.Height) / 2) + 165);
            PointF CustomerServicePosition = new PointF(((bitmap.Width - textSize.Width) / 2) + 360, ((bitmap.Height - textSize.Height) / 2) + 275);
            PointF CustomerServiceDataPosition = new PointF(((bitmap.Width - textSize.Width) / 2) + 510, ((bitmap.Height - textSize.Height) / 2) + 275);

            // Add the text to the image
            graphics.DrawString(memberIdText, font, brush, memberIdPosition);
            graphics.DrawString(UnserNameText, userfont, brush, userNamePosition);
            graphics.DrawString("Blood Group : ", commonfont, brush, BloodGroupPosition);
            graphics.DrawString(BloodGroupText, commondatafont, brush, BloodGroupDataPosition);
            graphics.DrawString("Expiry : ", commonfont, brush, ExpiryPosition);
            graphics.DrawString(ExpiryText, commondatafont, brush, ExpiryDataPosition);
            graphics.DrawString("Emergency Contact : ", commonfont, brush, ContactPosition);
            graphics.DrawString(EmergencyContact, commondatafont, brush, ContactDataPosition);
            graphics.DrawString("Customer service : ", customerServicefont, brush, CustomerServicePosition);
            graphics.DrawString(CustomerServiceContact, customerServiceDatafont, brush, CustomerServiceDataPosition);
            // Clean up resources
            graphics.Dispose();
            // Save the image to a memory stream
            MemoryStream memoryStream = new MemoryStream();
            bitmap.Save(memoryStream, ImageFormat.Png);
            memoryStream.Seek(0, SeekOrigin.Begin);

            // Set the Image control's ImageUrl to the memory stream
            string Image = "data:image/png;base64," + Convert.ToBase64String(memoryStream.ToArray());
            // Dispose the bitmap as we don't need it anymore
            bitmap.Dispose();

            return Image;



        }





        protected bool HasRequests()
        {
            requestCount = GetRequestsCount();
            return requestCount > 0;
        }

        protected int GetRequestsCount()
        {
            int count = 0;
            using (MySqlConnection connection = new MySqlConnection(this.connectionString))
            {
                connection.Open();
                using (MySqlCommand selectCommand = new MySqlCommand("usp_getallRequests", connection))
                {
                    selectCommand.CommandType = CommandType.StoredProcedure;
                    selectCommand.Parameters.AddWithValue("_user_id", (object)DAL.validateInt(this.Session["Userid"]));
                    MySqlDataAdapter mySqlDataAdapter = new MySqlDataAdapter(selectCommand);
                    DataTable dataTable = new DataTable();
                    mySqlDataAdapter.Fill(dataTable);
                    count = dataTable.Rows.Count;
                }
            }
            return count;
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
                            profile.ImageUrl = "~/upload/" + reader["user_image"].ToString();
                        }
                    }
                    command.ExecuteNonQuery();
                    connection.Close();

                }
            }
        }

        private string GetUserSubscription(int userId)
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
        protected void upgradeMemberButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/SubscriptionPlan.aspx");
            //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "toastr.success('Member Upgraded Successfully.')", true);
        }



        protected void logout_Click(object sender, ImageClickEventArgs e)
        {
            Session.Clear();
            Response.Redirect("~/login.aspx");
        }

        protected void logoutImageButton_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("~/login.aspx");
        }

        protected void logoutButton_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("~/login.aspx");
        }

        protected void logoutLink_Load(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("~/login.aspx");
        }
    }
}