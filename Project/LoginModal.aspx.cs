using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class LoginModal : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Submit_Click(object sender, EventArgs e)
    {
        string username = Username.Text;
        string password = Password.Text;
        string strsql = "select * from [Person] where username='" + username + "' and password='" + password + "'";
        DataTable dt = db.viewt(strsql);
        if (dt.Rows.Count > 0)
        {
            Session["username"] = username;
            Session["id_person"] = dt.Rows[0]["id_person"];
            Session["fullname"] = dt.Rows[0]["full_name"];
            if (dt.Rows[0]["is_admin"].ToString().Equals("True"))
                Session["admin"] = "true";
            else
                Session["admin"] = "false";
            ClientScript.RegisterStartupScript(this.GetType(), "Success", "<script language='javascript'>Success()</script>");

        }
        else
        {
            ClientScript.RegisterStartupScript(this.GetType(), "Faliure", "<script language='javascript'>Faliure()</script>");
        }

    }
}