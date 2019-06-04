using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CheckLogin : System.Web.UI.Page
{
    public static string password = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        password = HttpUtility.HtmlEncode(Request.Form["password"]);
        if (password == "blarchus2")
        {
            Session.Add("Active", "true");
            Response.Redirect("Main.aspx");
        }
        else
        {
            Response.Redirect("Default.aspx?msg=0");
        }
 
    }
}