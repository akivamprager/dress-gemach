using System;
using System.Collections.Generic;
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
    public DataSet dsUser(string name)
    {
        DataTable table1 = new DataTable("patients");
        table1.Columns.Add("name");
        table1.Columns.Add("id");
        table1.Rows.Add("sam", 1);
        table1.Rows.Add("mark", 2);
        table1.Rows.Add("atenolol", 12);
        table1.Rows.Add("amoxicillin", 21);

        // Create a DataSet and put both tables in it.
        DataSet Dset = new DataSet();
        Dset.Tables.Add(table1);


        return Dset;
    }
}
