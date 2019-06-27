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

    public DressStore() {}

    [WebMethod]
    //returns dresses published in the last 30 days on the catalog
    public DataSet GetLatestDresses()
    {
        return ReturnDS("SELECT * FROM Dress WHERE date_published >= DATEADD(month,-1,GETDATE())");
    }
    [WebMethod]
    public DataSet GetLatestDressesByStyle(string style)
    {
        style = style.Replace("'", "''");
        return ReturnDS("SELECT Dress.* FROM Dress INNER JOIN Style2Dress ON Dress.id_dress = Style2Dress.id_dress INNER JOIN Style ON Style2Dress.id_style = Style.id_style WHERE (Style.style = '" + style + "')AND Dress.date_published >= DATEADD(month,-1,GETDATE())");
    }
    [WebMethod]
    public DataSet getDressDSByID(int dressId)
    {
        string cmd = "SELECT * FROM Dress WHERE id_dress=" + dressId;
        DataSet ds = ReturnDS(cmd);
        return ds;
    }
    [WebMethod]
    public string OrderDressByIDAndQuantity(int dressId, int quantity, string name)
    {
        name = name.Replace("'", "''");
        string sql = "INSERT INTO [dbo].[Order] ([id_dress], [quantity], [name]) VALUES ("+dressId+", "+quantity+", N'"+name+"')";
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
        return ds;
    }
}
