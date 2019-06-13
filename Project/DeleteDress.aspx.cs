using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DeleteDress : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            //if (!Session["admin"].Equals("true"))
              //  Response.Redirect("mainPage.aspx?msg=1");
            db.exec("delete from Dress WHERE id=" + Request.QueryString["id"]);
            Response.Redirect("ViewCatalog.aspx?delete=" + Request.QueryString["id"]);
        }
        catch
        {
            Response.Redirect("ViewCatalog.aspx?msg=6");
        }
    }
}