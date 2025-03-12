using MySql.Data.MySqlClient;
using System;
using System.Configuration;
using System.Data;
using System.IO;
using System.Web.UI.WebControls;

namespace hfiles
{
    public partial class Clinics : System.Web.UI.Page
    {
        #region DB
        string cs = ConfigurationManager.ConnectionStrings["signage"].ConnectionString;
        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

      
    }
}
