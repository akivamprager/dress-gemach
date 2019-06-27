using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SignUp : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }
    protected void Submit_Click(object sender, EventArgs e)
    {
        string strsql = "insert into [Person](is_admin,username,password,full_name,address,phone,dress_size,dress_length)  values( ";
        strsql += "'" + "false" + "',";
        strsql += "'" + Username.Text + "',";
        strsql += "'" + Password.Text + "',";
        strsql += "'" + FullName.Text + "',";
        strsql += "'" + Address.Text + "',";
        strsql += "'" + Phone.Text + "',";
        strsql += "'" + Size.Text + "',";
        strsql += "'" + Length.Text + "')";
        db.exec(strsql);
        message.Visible = true;
        message.Text = "המשתמש נרשם בהצלחה!";
        message.Text += "<br>נא להיכנס לאתר דרך דף הלוג-אין";
        
        message.CssClass += " w3-text-green";
    }
}