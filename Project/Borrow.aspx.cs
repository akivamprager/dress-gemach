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
        string strsql = "insert into [Borrow](id_dress,id_person,borrow_info)  values( ";
        strsql += "'" + DropDownDress.SelectedValue + "',";
        strsql += "'" + DropDownPerson.SelectedValue + "',";
        strsql += "'" + borrow_info.Text + "')";
        db.exec(strsql);
        message.Visible = true;
        message.Text = "השמלה הושאלה בהצלחה!";
        message.CssClass += " w3-text-green";
    }
}