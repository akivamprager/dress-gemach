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

    }
    protected void Submit_Click(object sender, EventArgs e)
    {
        DressStoreService.DressStore dsws = new DressStoreService.DressStore();
        if (dsws.OrderDressByIDAndQuantity(Convert.ToInt32(dress_id.Text), Convert.ToInt32(quantity.Text), name.Text) == "FAILED")
            l1.Text = "משהו השתבש";
    }
}