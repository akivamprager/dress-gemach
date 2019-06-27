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

public partial class ViewMyFavorites : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["admin"] != null)
            if (Session["admin"].Equals("true"))
            {
                Response.Redirect("ViewCatalog1.aspx?msg=401");
            }
        favSource.SelectCommand = "SELECT DISTINCT Color.color_name, Dress.id_dress, Dress.size, Dress.length, Dress.image_path, Dress.additional_text, Style.style_name FROM Person INNER JOIN FavoriteDress ON Person.id_person = FavoriteDress.id_person CROSS JOIN Dress INNER JOIN Color2Dress ON Dress.id_dress = Color2Dress.id_dress INNER JOIN Color ON Color2Dress.id_color = Color.id_color INNER JOIN Style2Dress ON Dress.id_dress = Style2Dress.id_dress INNER JOIN Style ON Style2Dress.id_style = Style.id_style WHERE (Person.username = '"+HttpContext.Current.User.Identity.Name+"')";
    }

}