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
    public int chibur(int n1, int n2)
    {
        return n1 + n2;
    }

    [WebMethod]
    public users chooseUser(int id)
    {
        return new users(4, "fsdfsa", "fasfdas", "AAAAA");
    }




    [WebMethod]
    public DataSet GetLatestDresses()
    {
        DataSet ds = new DataSet();
        string connectionString = @"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\DressStore.mdf;Integrated Security=True;Connect Timeout=30";
        SqlConnection connection = new SqlConnection(connectionString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "SELECT * FROM Dresses WHERE WHERE date_published >= DATEADD(month,-1,GETDATE())";
        cmd.Connection = connection;
        connection.Open();
        SqlDataAdapter adapter = new SqlDataAdapter(cmd);
        adapter.Fill(ds);
        return ds;
    }
}
