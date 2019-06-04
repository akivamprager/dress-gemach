using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Delete : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        db.exec("delete from dresses WHERE id=" + Request.QueryString["id"]);
        Response.Redirect("ViewCatalog1.aspx?delete=" + Request.QueryString["id"]);
    }
}