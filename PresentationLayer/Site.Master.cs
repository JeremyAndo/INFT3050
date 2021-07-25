using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace c3315176_Assig1
{
    public partial class SiteMaster : MasterPage
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] != null)
            {
                welcomeUser.InnerText = "Welcome: " + Session["username"].ToString() + ", Logout.";
            }
        }
    }
}