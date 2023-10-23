using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
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

            using (MySqlConnection con = new MySqlConnection(cs))
            {
                con.Open();
                using (MySqlCommand cmd = new MySqlCommand("usp_addmember", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("_UserId", DAL.validateInt(Session["Userid"])); //Session["Userid"];
                    cmd.Parameters.AddWithValue("_MemberType", DAL.validateInt(hfMemberType.Value)); //Session["Userid"];
                    cmd.Parameters.AddWithValue("_Name", (name.Value));
                    cmd.Parameters.AddWithValue("_LastName", (lastname.Value));
                    cmd.Parameters.AddWithValue("_Relation", DAL.validateInt(hfMemberType.Value) == 1 ? (relation.Value) : "friend");
                    cmd.Parameters.AddWithValue("_EmailId", (emailid.Value));
                    cmd.Parameters.AddWithValue("_MobileNo", (phoneno.Value));
                    cmd.Parameters.AddWithValue("_AltMobileNo", (altphoneno.Value));
                    cmd.ExecuteNonQuery();
                }
            }
        }

    }
}