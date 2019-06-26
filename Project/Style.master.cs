using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class Style : System.Web.UI.MasterPage
{
    static bool admin = false;
    protected void Page_Load(object sender, EventArgs e)
    {
        bool admin = false;
        if (HttpContext.Current.User.Identity.IsAuthenticated)
        {
            logoutLink1.Visible = true;
            logoutLink2.Visible = true;
            usernameLabel.Text = HttpContext.Current.User.Identity.Name;
        }
        else
        {
            usernameLabel.Text = "אורח";
            logoutLink1.Visible = false;
            logoutLink2.Visible = false;

        }
        //try
        //{
            //if (Session["admin"].Equals("true"))
            {
                admin = true;
            }
       // }
        //catch {
          //  Response.Redirect("?msg=error");
        //}
        if (!admin)
        {
            catalog.NavigateUrl = "ViewCatalog2.aspx";
            catalog2.NavigateUrl = "ViewCatalog2.aspx";

        }
    }
    protected void logoutLink1_Click(Object sender, EventArgs e)
    {
        FormsAuthentication.SignOut();
        FormsAuthentication.RedirectToLoginPage();
    }
    protected void logoutLink2_Click(Object sender, EventArgs e)
    {
        FormsAuthentication.SignOut();
        FormsAuthentication.RedirectToLoginPage();
    }
}
