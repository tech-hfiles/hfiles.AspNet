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
                //sesion user_membernumber replaced by username
                if (Session["username"] != null)
                {
                    // Check if there are any requests
                    bool hasRequests = HasRequests();
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
                    LoadMembershipCard();
                }
            }
        }

        public void LoadMembershipCard()
        {
            string imagePath = Server.MapPath("~/path-to-your-image.png");
            Bitmap bitmap = new Bitmap(imagePath);

            // Create graphics object
            Graphics graphics = Graphics.FromImage(bitmap);

            // Define the font and text format
            Font font = new Font("Arial", 24, FontStyle.Bold);
            Brush brush = new SolidBrush(Color.White); // Text color

            // Calculate the position to center the text
            string text = "Your Text Here";
            SizeF textSize = graphics.MeasureString(text, font);
            PointF position = new PointF((bitmap.Width - textSize.Width) / 2, (bitmap.Height - textSize.Height) / 2);

            // Add the text to the image
            graphics.DrawString(text, font, brush, position);

            // Clean up resources
            graphics.Dispose();

            // Save the image to a memory stream
            MemoryStream memoryStream = new MemoryStream();
            bitmap.Save(memoryStream, ImageFormat.Png);
            memoryStream.Seek(0, SeekOrigin.Begin);

            // Set the Image control's ImageUrl to the memory stream
            imgWithText.ImageUrl = "data:image/png;base64," + Convert.ToBase64String(memoryStream.ToArray());

            // Dispose the bitmap as we don't need it anymore
            bitmap.Dispose();
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