using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace hfiles
{
    public partial class avatar2 : System.Web.UI.Page
    {
        #region Variable
        string cs = ConfigurationManager.ConnectionStrings["signage"].ConnectionString;
        string relation, gender, dob;
        int age = 0;
        DataTable dt;
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            //showmembersdiv();
            // mp1.Show();
            if (imageFileUpload1.HasFile)
            {

            }
            //if(Session["user_dob"]==null)
            //{
            //    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please Fill up Basic Details')", true);
            //    Response.Redirect("addbasicdetails.aspx");
            //}
            if (Session["username"] != null)
            {
                if (Session["user_dob"] != null && Session["user_dob"].ToString() != string.Empty)
                {
                    Session["age"] = GetAge(DateTime.Now, Convert.ToDateTime(Session["user_dob"]));
                }
                if (!IsPostBack)
                {
                    getMembers();
                    getReports();
                    getMembersList();
                    showmembersdiv(sender);
                    getUsedStorage();
                    //bindData(Convert.ToInt32(Session["memberId"].ToString()));

                    selectedmembername.InnerText = lblUserName.Text = lbluser.Text = Session["username"].ToString();
                    if (Session["gender_string"] != null && Session["age"] != null)
                    {
                        imgAvatar.ImageUrl = GetImagePath(DAL.validateInt(Session["age"].ToString()), Session["gender_string"].ToString());
                        //imgAvatar.ImageUrl = GetImagePath(age, gender);
                    }
                    else
                    {

                        //imgAvatar.ImageUrl = "~/Avatar/default.png";
                        imgAvatar.ImageUrl = "~/Avatar/Asset_50.png";
                        //imgAvatar.ImageUrl = GetImagePath(age, gender);
                    }
                }

                if (Session["memberId"] != null && Session["memberRelation"] != null)
                {
                    foreach (RepeaterItem item in rptMember.Items)
                    {
                        HiddenField hfmemberid = item.FindControl("hfmemberid") as HiddenField;
                        LinkButton linkButton1 = item.FindControl("member1") as LinkButton;

                        if (DAL.validateInt(hfmemberid.Value) == DAL.validateInt(Session["memberId"]))
                        {
                            linkButton1.Style.Add("font-weight", "900");
                            member1_Click(linkButton1, null);
                        }
                        else
                        {
                            linkButton1.Style.Add("font-weight", "450");
                        }

                    }
                }
            }
            else
            {
                Response.Redirect("~/login.aspx");
            }
        }
        public void showmembersdiv(object sender)
        {
            listmembers.Controls.Clear();
            int remainingCount = 7 - rptMember.Items.Count;
            //int remainingCount1 = 7 - Repeater1.Items.Count;

            if (remainingCount == 7)
            {
                repeaterdiv.Visible = false;
                //repeaterdiv1.Visible = false;
            }
            if (remainingCount == 0)
            {
                //repeaterdiv.Visible = false;
                // ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('You can add only 7 members !')", true);
                //ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", " toastr.success('Logged in successfully');", true);
            }
            // Generate additional list items
            for (int i = 0; i < remainingCount; i++)
            {
                HtmlGenericControl li = new HtmlGenericControl("li");
                li.Attributes["class"] = "Huz_AddmembersideotherPlusli";

                HtmlAnchor a = new HtmlAnchor();
                a.HRef = "addmember.aspx";

                HtmlImage img = new HtmlImage();
                img.Src = "../Avatar2/add-icon.png";
                img.Alt = "";

                HtmlGenericControl div = new HtmlGenericControl("div");

                HtmlGenericControl small = new HtmlGenericControl("small");
                small.Attributes["class"] = "";
                small.InnerHtml = "add member";

                div.Controls.Add(small);
                a.Controls.Add(img);
                a.Controls.Add(div);
                li.Controls.Add(a);

                listmembers.Controls.Add(li);
            }

            //newly added for mobile view
            //for (int i = 0; i < remainingCount1; i++)
            //{
            //    HtmlGenericControl li1 = new HtmlGenericControl("li1");
            //    li1.Attributes["class"] = "border-bottom w-100px text-center mb-2 mb-lg-2 mb-xxl-4";

            //    HtmlAnchor a = new HtmlAnchor();
            //    a.HRef = "addmember.aspx";

            //    HtmlImage img = new HtmlImage();
            //    img.Src = "../Avatar/add-icon.png";
            //    img.Alt = "";
            //    img.Width = 30;

            //    HtmlGenericControl div = new HtmlGenericControl("div");

            //    HtmlGenericControl small = new HtmlGenericControl("small");
            //    small.Attributes["class"] = "add-member-name";
            //    small.InnerHtml = "add member";

            //    div.Controls.Add(small);
            //    a.Controls.Add(img);
            //    a.Controls.Add(div);
            //    li1.Controls.Add(a);

            //    listmembers1.Controls.Add(li1);
            //}
        }

        public static int GetAge(DateTime reference, DateTime birthday)
        {
            int age = reference.Year - birthday.Year;
            if (reference < birthday.AddYears(age))
                age--;

            return age;
        }
        protected void lbtnAddReport_Click(object sender, EventArgs e)
        {
            showmembersdiv(sender);
            mp1.Show();
        }
        protected void okLinkButton_Click(object sender, EventArgs e)
        {
            showmembersdiv(sender);
            mp1.Hide();

        }
        //usp_getmember
        protected void getReports()
        {
            try
            {
                using (MySqlConnection con = new MySqlConnection(cs))
                {
                    con.Open();
                    using (MySqlCommand cmd = new MySqlCommand("usp_getreportmaster", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.ExecuteNonQuery();
                        MySqlDataAdapter da = new MySqlDataAdapter(cmd);
                        DataTable dt = new DataTable();
                        da.Fill(dt);
                        if (dt != null && dt.Rows.Count > 0)
                        {
                            ddlReports.DataSource = dt;
                            ddlReports.DataTextField = "Name";
                            ddlReports.DataValueField = "Id";
                            ddlReports.DataBind();
                            ddlReports.Items.Insert(0, new ListItem("Select Report", "0"));
                        }
                        else
                        {
                            ddlReports.Items.Insert(0, new ListItem("No Reports", "0"));
                        }
                    }
                }
            }
            catch (Exception Ex)
            {

            }
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            litFileName.Text = "File: " + imageFileUpload1.FileName;
            // string reporturl = "", Extension1, fileName1, dt1;
            string reporturl = "", Extension1, fileName1, dt1;

            if (imageFileUpload1.HasFile)
            {
                Extension1 = Path.GetExtension(imageFileUpload1.PostedFile.FileName);
                fileName1 = Path.GetFileName(imageFileUpload1.PostedFile.FileName);
                dt1 = DateTime.Now.ToString("MM_dd_yyyy_hh_mm_ss_fff");
                imageFileUpload1.PostedFile.SaveAs(Server.MapPath("~/upload/report/") + txtReportName.Text.Trim().ToString().Replace("'", "").Replace(" ", "").Replace("+", "_").Replace("/", "_").Replace("(", "").Replace(")", "").Replace("&", "_") + dt1 + Extension1);
                reporturl = txtReportName.Text.Trim().ToString().Replace("'", "").Replace(" ", "").Replace("+", "_").Replace("/", "_").Replace("(", "").Replace(")", "").Replace("&", "_") + dt1 + Extension1;
            }

            int UserId = DAL.validateInt(Session["Userid"].ToString());//
            string reportname = txtReportName.Text;
            int reportId = DAL.validateInt(ddlReports.SelectedValue);
            double fileSize = Math.Round(DAL.validateDouble_(imageFileUpload1.PostedFile.ContentLength) / 1024, 0);
            if (Session["CurrentusedStorage"] != null)
            {
                double usedSt = (double)Session["CurrentusedStorage"];
                double TotalAllotStorage = DAL.validateDouble_(ConfigurationManager.AppSettings["StorageLimit"].ToString());
                if ((usedSt + (fileSize/1024)) <= TotalAllotStorage)
                {
                    int msg = AddReport(sender, UserId, reportname, reporturl, reportId, fileSize);
                    //Clear all
                    clear();
                }
                else
                {
                    clear();
                    showmembersdiv(sender);
                    ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", " toastr.error('Not enough storage.');", true);
                }
            }

        }
        protected void clear()
        {
            txtReportName.Text = string.Empty;
            ddlReports.ClearSelection();
            litFileName.Text = string.Empty;
            ddlMembers2.ClearSelection();
        }
        public int AddReport(object sender, int UserId, string reportname, string reporturl, int reportId, double FileSize)
        {
            int memberId = Convert.ToInt32(Session["memberId"]);
            List<int> selectedIds = new List<int>();

            foreach (ListItem item in ddlMembers2.Items)
            {
                if (item.Selected)
                {
                    selectedIds.Add(Convert.ToInt32(item.Value));
                }
            }
            string memberIdList = string.Join(",", selectedIds);
            //int memberId = Convert.ToInt32(ddlMembers2.SelectedItem.Value);
            int result = 0;
            try
            {
                //int age= Convert.ToInt32(Session["MemberAge"].ToString());
                int age = 0;

                using (MySqlConnection con = new MySqlConnection(cs))
                {
                    con.Open();
                    using (MySqlCommand cmd = new MySqlCommand("usp_addreportwithaccess", con))
                    {
                        //if (memberId > 0)
                        if (Session["memberRelation"] == null)
                        {
                            Session["memberRelation"] = "Self";
                        }
                        if (Session["memberRelation"].ToString() == "Self" || Session["memberRelation"].ToString() == "Son" || Session["memberRelation"].ToString() == "daughter" || Session["memberRelation"].ToString() == "cat" || Session["memberRelation"].ToString() == "Dog" || Session["memberRelation"].ToString() == "GrandFather" || Session["memberRelation"].ToString() == "GrandMother" || Session["memberRelation"].ToString() == "Son" && age < 17 || age > 70)
                        {
                            cmd.CommandType = CommandType.StoredProcedure;
                            cmd.Parameters.AddWithValue("_UserId", UserId);
                            cmd.Parameters.AddWithValue("_reportname", reportname);
                            cmd.Parameters.AddWithValue("_reporturl", reporturl);
                            cmd.Parameters.AddWithValue("_reportId", reportId);
                            // cmd.Parameters.AddWithValue("_memberId", memberId);
                            cmd.Parameters.AddWithValue("_memberId", memberIdList);
                            cmd.Parameters.AddWithValue("_FileSize", FileSize);
                            cmd.Parameters.AddWithValue("_rId", 0);
                            cmd.Parameters.AddWithValue("_SpType", "C");
                            cmd.Parameters.AddWithValue("_Result", SqlDbType.Int);
                            cmd.Parameters["_Result"].Direction = ParameterDirection.Output;
                            cmd.ExecuteNonQuery();
                            int retVal = Convert.ToInt32(cmd.Parameters["_Result"].Value);
                            result = DAL.validateInt(retVal);
                            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", " toastr.success('Report Added Successfully');", true);
                            //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Report Added Successfully')", true);
                            //ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "swal("Report Added Successfully");", true);
                            Session["memberId"] = 0;
                        }
                        else if (memberId == UserId)
                        {
                            //using (MySqlCommand cmd = new MySqlCommand("usp_addreport", con))
                            //{
                            cmd.CommandType = CommandType.StoredProcedure;
                            cmd.Parameters.AddWithValue("_UserId", UserId);
                            cmd.Parameters.AddWithValue("_reportname", reportname);
                            cmd.Parameters.AddWithValue("_reporturl", reporturl);
                            cmd.Parameters.AddWithValue("_reportId", reportId);
                            // cmd.Parameters.AddWithValue("_memberId", memberId);
                            cmd.Parameters.AddWithValue("_memberId", memberIdList);
                            cmd.Parameters.AddWithValue("_rId", 0);
                            cmd.Parameters.AddWithValue("_SpType", "C");
                            cmd.Parameters.AddWithValue("_Result", SqlDbType.Int);
                            cmd.Parameters["_Result"].Direction = ParameterDirection.Output;
                            cmd.ExecuteNonQuery();
                            int retVal = Convert.ToInt32(cmd.Parameters["_Result"].Value);
                            result = DAL.validateInt(retVal);
                            //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Report Added Successfully')", true);
                            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", " toastr.success('Report Added Successfully');", true);
                            //ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "swal("Report Added Successfully");", true);
                        }
                        else
                        {
                            //using (MySqlCommand cmd = new MySqlCommand("usp_addreport", con))
                            //{
                            cmd.CommandType = CommandType.StoredProcedure;
                            cmd.Parameters.AddWithValue("_UserId", UserId);
                            cmd.Parameters.AddWithValue("_reportname", reportname);
                            cmd.Parameters.AddWithValue("_reporturl", reporturl);
                            cmd.Parameters.AddWithValue("_reportId", reportId);
                            // cmd.Parameters.AddWithValue("_memberId", memberId);
                            cmd.Parameters.AddWithValue("_memberId", memberIdList);
                            cmd.Parameters.AddWithValue("_rId", 0);
                            cmd.Parameters.AddWithValue("_SpType", "C");
                            cmd.Parameters.AddWithValue("_Result", SqlDbType.Int);
                            cmd.Parameters["_Result"].Direction = ParameterDirection.Output;
                            cmd.ExecuteNonQuery();
                            int retVal = Convert.ToInt32(cmd.Parameters["_Result"].Value);
                            result = DAL.validateInt(retVal);
                            //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Report Added Successfully')", true);
                            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", " toastr.success('Report Added Successfully');", true);
                            //else
                            //{
                            //    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('You don't have permission to add reports for this member')", true);
                            //}
                        }
                    }
                    showmembersdiv(sender);
                }
            }
            catch (Exception Ex)
            {
                result = 0;
            }
            getUsedStorage();
            return result;
        }

        protected void bindData(int user_id)
        {
            //usp_commonproductvariation
            //string sptype = "BIND";

            using (MySqlConnection con = new MySqlConnection(cs))
            {
                con.Open();
                using (MySqlCommand cmd = new MySqlCommand("usp_getuserdetailsbyId", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("_user_id", DAL.validateInt(user_id));
                    //cmd.Parameters.AddWithValue("_SpType", sptype);
                    //cmd.Parameters.Add("_Result", MySqlDbType.Int32).Direction = ParameterDirection.Output;

                    MySqlDataAdapter da = new MySqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    if (dt != null && dt.Rows.Count > 0)
                    {
                        gender = dt.Rows[0]["user_gender"].ToString();
                        selectedmembername.InnerText = lbluser.Text = dt.Rows[0]["user_firstname"].ToString();
                        age = 0;
                        dob = dt.Rows[0]["user_dob"].ToString();
                        relation = dt.Rows[0]["user_relation"].ToString();
                        if (dob != null && dob != string.Empty)
                        {
                            age = GetAge(DateTime.Now, Convert.ToDateTime(dob));
                            Session["MemberAge"] = age;
                        }
                        if (gender != null)

                        {
                            if (gender == "1")
                            {
                                gender = "male";
                            }
                            else if (gender == "2")
                            {
                                gender = "female";
                            }
                            //newly added by chetan dated on 07/11/2023
                            else if (gender == "3")
                            {
                                gender = "other";
                            }
                            else if (gender == "4")
                            {
                                gender = "cat";
                            }
                            else if (gender == "5")
                            {
                                gender = "dog";
                            }

                        }
                    }
                    else
                    {

                    }
                    imgAvatar.ImageUrl = GetImagePath(age, gender);
                }
            }
        }
        public string GetImagePath(int age, string gender)
        {
            string basePath = "~/Avatar/";
            string type = "";
            switch (gender.ToLower())
            {
                case "male":
                    if (age >= 0 && age <= 3)
                    {
                        return basePath + "male/3.png";
                    }
                    else if (age >= 4 && age <= 6)
                    {
                        return basePath + "male/6.png";
                    }
                    else if (age >= 7 && age <= 13)
                    {
                        return basePath + "male/13.png";
                    }
                    else if ((age >= 14 && age <= 21))
                    {
                        return basePath + "male/21.png";
                    }
                    else if ((age >= 22 && age <= 45))
                    {
                        return basePath + "male/45.png";
                    }
                    else if ((age >= 46 && age <= 70))
                    {
                        return basePath + "male/70.png";
                    }
                    else if (70 < age)
                    {
                        return basePath + "male/70plus.png";
                    }
                    else
                    {
                        return basePath + "male/70plus.png";
                    }

                case "female":
                    if ((age >= 0 && age <= 3))
                    {
                        return basePath + "female/3.png";
                    }
                    else if ((age >= 4 && age <= 6))
                    {
                        return basePath + "female/6.png";
                    }
                    else if ((age >= 7 && age <= 13))
                    {
                        return basePath + "female/13.png";
                    }
                    else if ((age >= 14 && age <= 21))
                    {
                        return basePath + "female/21.png";
                    }
                    else if ((age >= 22 && age <= 45))
                    {
                        return basePath + "female/45.png";
                    }
                    else if ((age >= 46 && age <= 70))
                    {
                        return basePath + "female/70.png";
                    }
                    else if (70 < age)
                    {
                        return basePath + "female/70plus.png";
                    }
                    else
                    {
                        return basePath + "female/70plus.png";
                    }

                case "dog":

                    return basePath + "pet/Dog-1.png";

                case "cat":

                    return basePath + "pet/cat.png";


                case "other":
                    {
                        return basePath + "others/others.png";
                    }
                default:
                    return basePath + "default.png";
            }
            //imgAvatar.ImageUrl = GetImagePath(age, gender);
        }

        protected void member3_Click(object sender, EventArgs e)
        {
            showmembersdiv(sender);
            string memberid = "";
            string relation = "";
            string IdName = member2.CommandArgument;

            string[] IdNamevalues = IdName.Split('|');
            if (IdNamevalues.Length == 2)
            {
                memberid = IdNamevalues[0];
                relation = IdNamevalues[1];
            }
            Session["memberId"] = memberid.ToString();
            Session["memberRelation"] = relation.ToString();
            bindData(Convert.ToInt32(memberid));
        }
        protected void member1_Click(object sender, EventArgs e)
        {
            showmembersdiv(sender);
            LinkButton linkButton = (LinkButton)(sender);
            string commandArgument = linkButton.CommandArgument;
            string[] values = commandArgument.Split('|');

            //var memberid = linkButton.CommandArgument.ToString();
            string memberid = "";
            string relation = "";
            string IdName = linkButton.CommandArgument;
            string[] IdNamevalue = commandArgument.Split('|');

            string[] IdNamevalues = IdName.Split('|');
            if (IdNamevalues.Length == 2)
            {
                memberid = values[0];
                relation = values[1];
            }
            foreach (RepeaterItem item in rptMember.Items)
            {
                LinkButton linkButton1 = item.FindControl("member1") as LinkButton;
                linkButton1.Style.Add("font-weight", "450");
            }
            linkButton.Style.Add("font-weight", "900");
            Session["memberId"] = memberid.ToString();
            Session["memberRelation"] = relation.ToString();
            bindData(Convert.ToInt32(memberid));
        }

        protected void rptMember_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                HtmlGenericControl divWrapper = (HtmlGenericControl)e.Item.FindControl("divWrapper");

                // Set padding for each item
                //divWrapper.Style["padding"] = "10px"; // Adjust the value as needed
            }
        }
        protected void getMembersList()
        {
            int UserId = DAL.validateInt(Session["Userid"].ToString());
            try
            {
                using (MySqlConnection con = new MySqlConnection(cs))
                {
                    con.Open();
                    using (MySqlCommand cmd = new MySqlCommand("usp_getmember", con)) /*usp_getMembers*/
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("_UserId", UserId);
                        cmd.Parameters.AddWithValue("_MemberId", 0);
                        cmd.Parameters.AddWithValue("_SpType", "LS");
                        //cmd.Parameters.AddWithValue("_AccessMappingId", 0);
                        cmd.Parameters.AddWithValue("_ReportId", 0);
                        cmd.Parameters.AddWithValue("_RId", 0);
                        cmd.ExecuteNonQuery();
                        MySqlDataAdapter da = new MySqlDataAdapter(cmd);
                        DataTable dt = new DataTable();
                        da.Fill(dt);
                        if (dt != null && dt.Rows.Count > 0)
                        {
                            //ddlMembers.DataSource = dt;
                            //ddlMembers.DataTextField = "user_FirstName";
                            //ddlMembers.DataValueField = "user_Id";
                            //ddlMembers.DataBind();
                            //ddlMembers.Items.Insert(0, new ListItem("Select Member", "0"));

                            //ddlMembers1.DataSource = dt;
                            //ddlMembers1.DataTextField = "user_FirstName";
                            //ddlMembers1.DataValueField = "user_Id";
                            //ddlMembers1.DataBind();

                            //ddlMembers1.Items.Insert(0, new ListItem("Select Member", "0"));

                            ddlMembers2.DataSource = dt;
                            ddlMembers2.DataTextField = "user_FirstName";
                            ddlMembers2.DataValueField = "user_Id";
                            ddlMembers2.DataBind();
                            ddlMembers2.Items.Insert(0, new ListItem("Select Member", "0"));
                        }
                        else
                        {
                            ddlMembers2.Items.Insert(0, new ListItem("No Members", "0"));
                        }
                    }
                }
            }
            catch (Exception Ex)
            {

            }
        }

        protected void member2_Click(object sender, EventArgs e)
        {
            Session["memberId"] = null;
            bindData(DAL.validateInt(Session["UserId"]));
            foreach (RepeaterItem item in rptMember.Items)
            {
                LinkButton linkButton = item.FindControl("member1") as LinkButton;
                linkButton.Style.Add("font-weight", "450");
            }
            showmembersdiv(sender);
        }

        protected void getMembers()
        {
            int UserId = DAL.validateInt(Session["Userid"].ToString());
            try
            {
                using (MySqlConnection con = new MySqlConnection(cs))
                {
                    con.Open();
                    using (MySqlCommand cmd = new MySqlCommand("usp_getmember", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("_UserId", UserId);
                        cmd.Parameters.AddWithValue("_MemberId", 0);
                        cmd.Parameters.AddWithValue("_SpType", "LS");
                        //cmd.Parameters.AddWithValue("_AccessMappingId", 0);
                        cmd.Parameters.AddWithValue("_ReportId", 0);
                        cmd.Parameters.AddWithValue("_RId", 0);
                        cmd.ExecuteNonQuery();
                        MySqlDataAdapter da = new MySqlDataAdapter(cmd);
                        DataTable dt = new DataTable();
                        da.Fill(dt);
                        if (dt != null && dt.Rows.Count > 0)
                        {
                            rptMember.DataSource = dt;
                            rptMember.DataBind();
                            Repeater1.DataSource = dt;
                            Repeater1.DataBind();
                        }
                        else
                        {

                        }
                    }
                }
            }
            catch (Exception Ex)
            {

            }
        }
        protected void getUsedStorage()
        {
            int UserId = DAL.validateInt(Session["Userid"].ToString());
            try
            {
                using (MySqlConnection con = new MySqlConnection(cs))
                {
                    con.Open();
                    using (MySqlCommand cmd = new MySqlCommand("usp_getusedstorage", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("_UserId", UserId);
                        string usedStorage1 = "0";//cmd.ExecuteScalar().ToString();
                        double usedStorage = DAL.validateDouble_(cmd.ExecuteScalar());
                        Session["CurrentusedStorage"] = usedStorage;
                        double TotalAllotStorage = DAL.validateDouble_(ConfigurationManager.AppSettings["StorageLimit"].ToString());
                        storageused.InnerText = (usedStorage).ToString() + " MB Storage Used ";
                        storageleft.InnerText = (Math.Round(TotalAllotStorage - usedStorage, 2)).ToString() + " of " + TotalAllotStorage.ToString() + " MB Left";
                        if (usedStorage >= TotalAllotStorage)
                        {
                            //btnSubmit.Enabled = false;
                            //ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", " toastr.success('Logged in successfully');", true);
                        }
                        else
                        {
                            //btnSubmit.Enabled = true;

                        }
                    }
                }
            }
            catch (Exception Ex)
            {

            }
        }

    }
}