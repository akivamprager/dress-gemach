using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddFavorite : System.Web.UI.Page
{
    static DataTable dt = db.viewt("select id_person from person where username='" + HttpContext.Current.User.Identity.Name + "'");
    public static int id_person = Convert.ToInt32(dt.Rows[0]["id_person"]);
    protected void Page_Load(object sender, EventArgs e)
    {
        dressSDC.SelectCommand = "select distinct dress.id_dress from dress, favoritedress where dress.id_dress not in (select id_dress from favoritedress where id_person=" + id_person + ")";
    }
    protected void Submit_Click(object sender, EventArgs e)
    {
        DataTable dt = db.viewt("select id_person from person where username='" + HttpContext.Current.User.Identity.Name + "'");
        int id_person = Convert.ToInt32(dt.Rows[0]["id_person"]);
        string strsql = "insert into [FavoriteDress](id_person,id_dress)  values( ";
        strsql += "'" + id_person + "',";
        strsql += "'" + DropDownDress.SelectedValue + "')";
        db.exec(strsql);
        message.Visible = true;
        message.Text = "השמלה נוספה בהצלחה!";
        message.CssClass += " w3-text-green";
    }
}