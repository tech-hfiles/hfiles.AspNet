using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Mail;
using MySql.Data.MySqlClient;
using System.Data;
using System.Configuration;
using System.Web.Security;
using System.Threading;
using System.Resources;
using System.Globalization;
using System.Reflection;
using System.Text.RegularExpressions;
using System.Security.Cryptography;
using System.Text;

namespace hfiles
{
    public partial class Error : System.Web.UI.Page
    {
        #region Variable
        string cs = ConfigurationManager.ConnectionStrings["signage"].ConnectionString;
        ResourceManager rm;
        CultureInfo ci;
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
          
            

        }

        
      


    }
}