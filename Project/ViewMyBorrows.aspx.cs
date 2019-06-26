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

public partial class ViewMyBorrows : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["admin"] != null)
            if (Session["admin"].Equals("true"))
            {
                Response.Redirect("ViewBorrows.aspx?msg=401");
            }
        borrowSource.SelectCommand = "SELECT Borrow.* FROM Borrow, Person WHERE (Borrow.id_person = Person.id_person AND Person.username = '" + HttpContext.Current.User.Identity.Name + "')";
    }
}