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
            catalog.Visible = false;
            addDressLink.Visible = false;
            viewborrowslink.Visible = false;
            mySidebar.Visible = false;
        }
        try
        {
            if (Session["admin"].Equals("true"))
            {
                admin = true;
            }
        }
        catch
        {
            ;
        }
        if (!admin)
        {
            catalog.NavigateUrl = "ViewCatalog2.aspx";
            catalog2.NavigateUrl = "ViewCatalog2.aspx";
            viewborrowslink.NavigateUrl = "ViewMyBorrows.aspx";
            viewborrowslink1.NavigateUrl = "ViewMyBorrows.aspx";
            borrowlink.Visible = false;
            borrowlink1.Visible = false;
            returnlink.Visible = false;
            returnlink1.Visible = false;
            addDressLink.Visible = false;
            addDressLink1.Visible = false;

        }
    }
    protected void logoutLink_Click(Object sender, EventArgs e)
    {
        FormsAuthentication.SignOut();
        FormsAuthentication.RedirectToLoginPage();
    }
}
