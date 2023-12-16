using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hfiles
{
    public partial class user : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Userid"] is null)
            {
                if (Session["JournalPath"]!=null)
                {

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
                    memberLabel.Text = Session["username"].ToString();
                    memberId.Text = Session["user_membernumber"].ToString();
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