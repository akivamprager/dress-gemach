using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;

/// <summary>
/// Summary description for DressStore
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
// [System.Web.Script.Services.ScriptService] 
public class DressStore : System.Web.Services.WebService
{

    public DressStore()
    {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }

    [WebMethod]
    public string HelloWorld()
    {
        return "Hello World";
    }

    [WebMethod]
    //returns dresses published in the last 30 days on the catalog
    public DataSet GetLatestDresses()
    {
        return ReturnDS("SELECT * FROM Dresses WHERE date_published >= DATEADD(month,-1,GETDATE())");
    }
    [WebMethod]
    public DataSet GetLatestDressesByStyle(string style)
    {
        //new code with param - will check asap, first have to see if this works at all :)
        /*DataSet ds = new DataSet();
        SqlParameter param = new SqlParameter();
        param.ParameterName = "@style";
        param.Value = style;
        SqlCommand cmd = new SqlCommand();
        cmd.Parameters.Add(param);
        string connectionString = @"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\DressStore.mdf;Integrated Security=True;Connect Timeout=30";
        SqlConnection connection = new SqlConnection(connectionString);
        cmd.CommandText = "SELECT Dresses.* FROM Dresses INNER JOIN Style2Dress ON Dresses.id_dress = Style2Dress.id_dress INNER JOIN Styles ON Style2Dress.id_style = Styles.id_style WHERE (Styles.style = '@style')AND Dresses.date_published >= DATEADD(month,-1,GETDATE())";
        cmd.Connection = connection;
        connection.Open();
        SqlDataAdapter adapter = new SqlDataAdapter(cmd);
        adapter.Fill(ds);
        return ds;
        */
        //first code - probably less safe
        style = style.Replace("'", "''");
        return ReturnDS("SELECT Dresses.* FROM Dresses INNER JOIN Style2Dress ON Dresses.id_dress = Style2Dress.id_dress INNER JOIN Styles ON Style2Dress.id_style = Styles.id_style WHERE (Styles.style = '" + style + "')AND Dresses.date_published >= DATEADD(month,-1,GETDATE())");
    }
    [WebMethod]
    public Dresses getDressObjectByID(int dressId)
    {
        string cmd = "SELECT * FROM Dresses WHERE id_dress=" + dressId;
        DataSet ds = ReturnDS(cmd);
        int id_dress = Convert.ToInt32(ds.Tables[0].Rows[0]["id_dress"]);
        string size = ds.Tables[0].Rows[0]["size"].ToString();
        string length = ds.Tables[0].Rows[0]["length"].ToString();
        string additional_info = ds.Tables[0].Rows[0]["additional_info"].ToString();
        DateTime date_published = Convert.ToDateTime(ds.Tables[0].Rows[0]["date_published"]);
        Dresses dress = new Dresses(id_dress, size, length, additional_info, date_published);

        return dress;
    }
    [WebMethod]
    public string OrderDressByIDAndQuantity(int dressId, int quantity, string name)
    {
        name = name.Replace("'", "''");
        string sql = "INSERT INTO [dbo].[Orders] ([id_dress], [quantity], [name]) VALUES ("+dressId+", "+quantity+", N'"+name+"')";
        string connectionString = @"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\DressStore.mdf;Integrated Security=True;Connect Timeout=30";
        SqlConnection connection = new SqlConnection(connectionString);
        SqlCommand command = new SqlCommand(sql, connection);
        connection.Open();
        int rowsAffected = command.ExecuteNonQuery();
        connection.Close();
        if (rowsAffected == 1)
            return "SUCCESS";
        else
            return "FAILED";
    }
    //returns DataSet from DB for given SQL command string
    public DataSet ReturnDS(string sql)
    {
        DataSet ds = new DataSet();
        string connectionString = @"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\DressStore.mdf;Integrated Security=True;Connect Timeout=30";
        SqlConnection connection = new SqlConnection(connectionString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = sql;
        cmd.Connection = connection;
        connection.Open();
        SqlDataAdapter adapter = new SqlDataAdapter(cmd);
        adapter.Fill(ds);
        string x = ds.Tables[0].Rows[0]["size"].ToString();
        return ds;
    }
}
