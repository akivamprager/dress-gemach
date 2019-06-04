using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Style : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string currentPage = Path.GetFileNameWithoutExtension(Page.AppRelativeVirtualPath);
        //pagename.Text = currentPage;
        if (Session["user"] == null || Session["user"].Equals(""))
        {
            if (currentPage != "Default" && currentPage != "About" && currentPage != "ContactUs")
                Response.Redirect("Default.aspx?msg=401");
                //logoutLink1.Visible = false;
                //logoutLink2.Visible = false;
                
        }
        else
        {
            loginLink1.Visible = false;
            loginLink2.Visible = false;

        }


    }
    protected void logoutLink1_Click(Object sender, EventArgs e)
    {
        Session.Abandon();
        Response.Redirect("Default.aspx?msg=logout");
    }
    protected void logoutLink2_Click(Object sender, EventArgs e)
    {
        Session.Abandon();
        Response.Redirect("Default.aspx?msg=logout");
    }
}
