using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class wsTest : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DressStoreService.Dresses dress = new DressStoreService.Dresses();
        DressStoreService.DressStore dsws = new DressStoreService.DressStore();
        dress = dsws.getDressObjectByID(1);
        l1.Text = dress.ToStringMod();
    }
}