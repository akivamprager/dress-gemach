using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class AddDress : System.Web.UI.Page
{
    string imagePath = "";//AppDomain.CurrentDomain.BaseDirectory;// + @"images\";
    protected void Page_Load(object sender, EventArgs e)
    {
          
    }
    protected void Wizard1_FinishButtonClick(object sender, WizardNavigationEventArgs e)
    {
        string saveImagePath = "", imageName = "";
        //Submitted.Text = Size.Text+"<br>"+Length.Text+"<br>"+Color.Text+"<br>"+Style.Text+"<br>"+Info.Text+"<br>";
        if (Image.HasFile)
        {
            imageName = DateTime.Now.ToString("yyyy_MM_dd_HH_mm_ss") + System.IO.Path.GetExtension(Image.FileName);
            saveImagePath = "" + @"images\" + imageName + "";//imagePath + imageName;
            if (!File.Exists(saveImagePath))
                Image.SaveAs(Server.MapPath("images/" + imageName));//AppDomain.CurrentDomain.BaseDirectory+@"images\"+saveImagePath);
            else
            {
                imageName = DateTime.Now.ToString("yyyy_MM_dd_HH_mm_ss") + "_1" + System.IO.Path.GetExtension(Image.FileName);
                saveImagePath = imagePath + imageName;
                Image.SaveAs(saveImagePath);
            }
        }

        string strsql = "insert into [Dresses](size,length,color,image_path,style,additional_text)  values( ";
        strsql += "'" + Size.Text + "',";
        strsql += "'" + Length.Text + "',";
        strsql += "'" + Color.Text + "',";
        if (Image.HasFile)
            strsql += "'" + saveImagePath + "',";
        else
            strsql += "'null',";  
        strsql += "'" + Style.Text + "',";
        strsql += "'" + Info.Text + "')";

        db.exec(strsql);
        Response.Redirect("ViewCatalog1.aspx?msg=2");

        //Response.Redirect("NewDress.aspx");
    }
}