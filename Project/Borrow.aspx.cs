using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Borrow : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Submit_Click(object sender, EventArgs e)
    {
        string sql = "SELECT * FROM [Person] where username='" + Username.Text + "' and password='" + Password.Text + "'";
        DataSet ds = db.vieww(sql);
        DataTable dt = ds.Tables[0];
        if (dt.Rows.Count > 0)
        {
            FormsAuthentication.RedirectFromLoginPage(Username.Text, NotPublicCheckBox.Checked);
            Session["username"] = Username.Text;
            Session["id"] = dt.Rows[0]["id_person"].ToString();
            Session["fullname"] = dt.Rows[0]["full_name"];
            if (dt.Rows[0]["is_admin"].ToString().Equals("True"))
                Session["admin"] = "true";
            else
                Session["admin"] = "false";
        }
        else
            error.Text = "הפרטים אינם נכונים. נסה שוב.";
        /*--------------------------
        string username = Username.Text;
        string password = Password.Text;
        string strsql = "select * from [Person] where username='" + username + "' and password='" + password + "'";
        DataTable dt = db.viewt(strsql);
        if (dt.Rows.Count > 0)
        {
            Session["username"] = username;
           // Session["id"] = dt.Rows[0]["id_person"];
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
        */
    }
}