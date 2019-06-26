using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Return : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Submit_Click(object sender, EventArgs e)
    {
        string strsql = "update [Borrow] set date_returned = getdate(), return_info=";
        strsql += "'" + return_info.Text;
        strsql += "' where id_dress='" + DropDownDress.SelectedIndex;
        strsql += "' and id_person='" + DropDownPerson.SelectedIndex+"'";

        db.exec(strsql);
        message.Visible = true;
        message.Text = "השמלה הושאלה בהצלחה!";
        message.CssClass += " w3-text-green";
    }
}