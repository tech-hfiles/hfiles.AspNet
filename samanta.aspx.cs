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
    public partial class samanta : System.Web.UI.Page
    {
        #region Variable
        string cs = ConfigurationManager.ConnectionStrings["signage"].ConnectionString;
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //Session["Userid"] = 1;
                if (Session["Userid"] != null)
                {
                    bindData(DAL.validateInt(Session["Userid"].ToString()));
                }
                else
                {
                    Response.Redirect("~/login.aspx");
                }
                //bindData(DAL.validateInt(4));
            }
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
                        Session["userpic"] =dt.Rows[0]["user_image"].ToString();
                        Session["username"] = dt.Rows[0]["user_firstname"].ToString();
                        Session["user_gender"] = dt.Rows[0]["user_gender"].ToString();
                        Session["user_membernumber"] = dt.Rows[0]["user_membernumber"].ToString();
                        Session["user_contact"] = dt.Rows[0]["user_contact"].ToString();

                        Session["user_dob"] = null;
                        Session["user_dob"] = dt.Rows[0]["user_dob"].ToString();
                        if (Session["user_dob"] != null && Session["user_dob"].ToString() != string.Empty)
                        {
                            Session["age"] = GetAge(DateTime.Now, Convert.ToDateTime(Session["user_dob"]));
                        }

                        if (Session["user_gender"] != null)
                        {
                            if (DAL.validateInt(Session["user_gender"].ToString()) == 1)
                            {
                                Session["gender_string"] = "male";
                            }
                            else if (DAL.validateInt(Session["user_gender"].ToString()) == 2)
                            {
                                Session["gender_string"] = "female";
                            }
                            //newly added by chetan dated on 07/11/2023
                            else if (DAL.validateInt(Session["user_gender"].ToString()) == 3)
                            {
                                Session["gender_string"] = "other";
                            }
                        }
                    }
                    else
                    {

                    }
                }
            }
        }

        public static int GetAge(DateTime reference, DateTime birthday)
        {
            int age = reference.Year - birthday.Year;
            if (reference < birthday.AddYears(age))
                age--;

            return age;
        }
    }
}