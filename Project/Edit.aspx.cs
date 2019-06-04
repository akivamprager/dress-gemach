using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Edit : System.Web.UI.Page
{
    public static double size=0;
    public static double length=0;
    public static string color="";
    public static string style="";
    public static string info="";
    public static string saveImagePath="";


    protected void Page_Load(object sender, EventArgs e)
    {
        string id = "0";
        if (Request.QueryString["id"] != null && !Request.QueryString["id"].Equals(""))
            id = Request.QueryString["id"].ToString();
        DataSet ds = db.vieww("select * from dresses WHERE id =" + id);
        DataTable dt = ds.Tables[0];
        if (dt.Rows.Count > 0) {
            DataRow dr = dt.Rows[0];
            size = (double)dr["size"];
            length = (double)dr["length"];
            color = dr["color"].ToString();
            style = dr["style"].ToString();
            info = dr["additional_text"].ToString();
            saveImagePath = dr["image_path"].ToString();
        }
    }
}