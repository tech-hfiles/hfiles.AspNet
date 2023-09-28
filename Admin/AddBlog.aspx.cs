using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;

namespace hfiles
{
  public partial class AddBlog : System.Web.UI.Page
  {
    protected void Page_Load(object sender, EventArgs e)
    {
      if (!IsPostBack)
      {
        Session["ImageMain"] = "";
        ViewState["BlogID"] = "";
        GetBlogCategory();
        GetBlogs();
        if (Request.QueryString["ID"] != null)
        {
          string strBLOGID = Request.QueryString["ID"].ToString();
          if ((strBLOGID != null) && (strBLOGID != ""))
          {
            btnAddBlog.Text = "Update Blog";

            ViewState["BlogID"] = strBLOGID;

            int intBlogID = Convert.ToInt32(strBLOGID);

            //GetSingleBlog(intBlogID);
          }
        }


      }
    }

    protected void btnAddBlog_Click(object sender, EventArgs e)
    {
      string ExtensionP2, fileNameP2, dtP2, productImgP2 = "";
      if (fuProductMainImage.HasFile)
      {
        // Main image - Upload
        ExtensionP2 = Path.GetExtension(fuProductMainImage.PostedFile.FileName);
        fileNameP2 = Path.GetFileName(fuProductMainImage.PostedFile.FileName);
        dtP2 = DateTime.Now.ToString("MM_dd_yyyy_hh_mm_ss_fff");
        fuProductMainImage.PostedFile.SaveAs(Server.MapPath("~/BlogImages/") + txtHeading.Text.Trim().ToString().Replace("'", "").Replace(" ", "").Replace("+", "_").Replace("&", "") + "P2" + dtP2 + ExtensionP2);
        productImgP2 = "~/BlogImages/" + txtHeading.Text.Trim().ToString().Replace("'", "").Replace(" ", "").Replace("+", "_").Replace("&", "") + "P2" + dtP2 + ExtensionP2;
        //AddUpdate(productImgP2);
      }
      else if (Session["ImageMain"] != null && Session["ImageMain"].ToString() != string.Empty)
      {
        productImgP2 = Session["ImageMain"].ToString();
        //AddUpdate(productImgP2);
      }
      else
      {
        lblMsg.Text = "Select blog image";
      }
    }

    protected void AddUpdate(string productImgP2)
    {
      //aminuAction Ac = new aminuAction();
      int Bg1 = ddlBlog1.SelectedItem.Value != "0" ? Convert.ToInt32(ddlBlog1.SelectedItem.Value) : 0;
      int Bg2 = ddlBlog2.SelectedItem.Value != "0" ? Convert.ToInt32(ddlBlog2.SelectedItem.Value) : 0;
      int Bg3 = ddlBlog3.SelectedItem.Value != "0" ? Convert.ToInt32(ddlBlog3.SelectedItem.Value) : 0;
      int Bg4 = ddlBlog4.SelectedItem.Value != "0" ? Convert.ToInt32(ddlBlog4.SelectedItem.Value) : 0;
      int Bg5 = ddlBlog5.SelectedItem.Value != "0" ? Convert.ToInt32(ddlBlog5.SelectedItem.Value) : 0;
      int readingTime = txtReadingMin.Text == "" ? 1 : Convert.ToInt32(txtReadingMin.Text);

      int Result = 0;
      if (btnAddBlog.Text.ToString().ToUpper() == "UPDATE BLOG")
      {
        int intBlogID = 0;
        if (ViewState["BlogID"] != null)
        {
          intBlogID = ViewState["BlogID"].ToString() == "" ? 0 : Convert.ToInt32(ViewState["BlogID"].ToString());
        }

        //Result = Ac.UpdateBlog(intBlogID, txtHeading.Text, CKEditorBlogSubHeading.Text, txtAuthorName.Text, ddlCategory.SelectedItem.Text, txtBlogDate.Text, CKEditorBlogSection.Text, txtKeywords.Text, productImgP2, Bg1, Bg2, Bg3, Bg4, Bg5, readingTime, txtMetaTitle.Text.Trim(), txtMetaDescription.Value.Trim());
      }
      else
      {
        //Result = Ac.InsertBlog(txtHeading.Text, CKEditorBlogSubHeading.Text, txtAuthorName.Text, ddlCategory.SelectedItem.Text, txtBlogDate.Text, CKEditorBlogSection.Text, txtKeywords.Text, productImgP2, Bg1, Bg2, Bg3, Bg4, Bg5, readingTime, txtMetaTitle.Text.Trim(), txtMetaDescription.Value.Trim());
      }

      if (Result == 1)
      {
        if (btnAddBlog.Text.ToString().ToUpper() == "UPDATE BLOG")
        {
          lblMsg.Text = "Blog updated.";
        }
        else
        {
          lblMsg.Text = "Blog added.";
        }
        lblMsg.ForeColor = System.Drawing.Color.Green;
        System.Threading.Thread.Sleep(5000);
        Response.Redirect("~/Admin/BlogMaster.aspx");
      }
      else
      {
        lblMsg.Text = "Try again.";
        lblMsg.ForeColor = System.Drawing.Color.Red;
      }
    }

    protected void GetBlogs()
    {
      //aminuAction Ac = new aminuAction();
      DataTable dt = new DataTable();
      //dt = Ac.GetBlog("Home");
      if (dt != null && dt.Rows.Count > 0)
      {
        ddlBlog1.DataSource = dt;
        ddlBlog1.DataTextField = "Header";
        ddlBlog1.DataValueField = "Blog_ID";
        ddlBlog1.DataBind();
        ddlBlog1.Items.Insert(0, new ListItem("Select Blog 1", "0"));

        ddlBlog2.DataSource = dt;
        ddlBlog2.DataTextField = "Header";
        ddlBlog2.DataValueField = "Blog_ID";
        ddlBlog2.DataBind();
        ddlBlog2.Items.Insert(0, new ListItem("Select Blog 2", "0"));

        ddlBlog3.DataSource = dt;
        ddlBlog3.DataTextField = "Header";
        ddlBlog3.DataValueField = "Blog_ID";
        ddlBlog3.DataBind();
        ddlBlog3.Items.Insert(0, new ListItem("Select Blog 3", "0"));

        ddlBlog4.DataSource = dt;
        ddlBlog4.DataTextField = "Header";
        ddlBlog4.DataValueField = "Blog_ID";
        ddlBlog4.DataBind();
        ddlBlog4.Items.Insert(0, new ListItem("Select Blog 4", "0"));

        ddlBlog5.DataSource = dt;
        ddlBlog5.DataTextField = "Header";
        ddlBlog5.DataValueField = "Blog_ID";
        ddlBlog5.DataBind();
        ddlBlog5.Items.Insert(0, new ListItem("Select Blog 5", "0"));
      }
      else
      {
        ddlBlog1.Items.Clear();
        ddlBlog1.DataSource = null;
        ddlBlog1.DataBind();
        ddlBlog1.Items.Insert(0, new ListItem("No blog found", "0"));

        ddlBlog2.Items.Clear();
        ddlBlog2.DataSource = null;
        ddlBlog2.DataBind();
        ddlBlog2.Items.Insert(0, new ListItem("No blog found", "0"));

        ddlBlog3.Items.Clear();
        ddlBlog3.DataSource = null;
        ddlBlog3.DataBind();
        ddlBlog3.Items.Insert(0, new ListItem("No blog found", "0"));

        ddlBlog4.Items.Clear();
        ddlBlog4.DataSource = null;
        ddlBlog4.DataBind();
        ddlBlog4.Items.Insert(0, new ListItem("No blog found", "0"));

        ddlBlog5.Items.Clear();
        ddlBlog5.DataSource = null;
        ddlBlog5.DataBind();
        ddlBlog5.Items.Insert(0, new ListItem("No blog found", "0"));
      }
    }

    protected void GetBlogCategory()
    {
      //aminuAction Ac = new aminuAction();
      DataTable dt = new DataTable();
      //dt = Ac.GetBlogCategory("Home");
      if (dt != null && dt.Rows.Count > 0)
      {
        ddlCategory.DataSource = dt;
        ddlCategory.DataTextField = "CategoryName";
        ddlCategory.DataValueField = "Id";
        ddlCategory.DataBind();
        ddlCategory.Items.Insert(0, new ListItem("Select Category", "0"));
      }
      else
      {
        ddlCategory.Items.Clear();
        ddlCategory.DataSource = null;
        ddlCategory.DataBind();
        ddlCategory.Items.Insert(0, new ListItem("No Category found", "0"));
      }
    }
  }
}