using System;
using System.Collections;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ViewUsers : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["admin"] != null)
            if (!Session["admin"].Equals("true"))
            {
                userSource.SelectCommand = "Select * From [Person] where username='" + HttpContext.Current.User.Identity.Name + "'";
            }
    }

}

