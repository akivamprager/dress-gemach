using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class AddDressModal : System.Web.UI.Page
{
    string imagePath = "";//AppDomain.CurrentDomain.BaseDirectory;// + @"images\";
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Submit_Click(object sender, EventArgs e)
    {
        string saveImagePath = "", imageName = "";
        //Submitted.Text = Size.Text+"<br>"+Length.Text+"<br>"+Color.Text+"<br>"+Style.Text+"<br>"+Info.Text+"<br>";
        if (ImageFile.HasFile)
        {
            try
            {
                imageName = DateTime.Now.ToString("yyyy_MM_dd_HH_mm_ss") + System.IO.Path.GetExtension(ImageFile.FileName);
                saveImagePath = "" + @"images\dress_images" + imageName + "";//imagePath + imageName;
                if (!File.Exists(saveImagePath))
                    ImageFile.SaveAs(Server.MapPath("images/dress_images" + imageName));//AppDomain.CurrentDomain.BaseDirectory+@"images\"+saveImagePath);
                else
                {
                    imageName = DateTime.Now.ToString("yyyy_MM_dd_HH_mm_ss") + "_1" + System.IO.Path.GetExtension(ImageFile.FileName);
                    saveImagePath = imagePath + imageName;
                    ImageFile.SaveAs(saveImagePath);
                }
            }
            catch (Exception ex)
            {
                error.Text="העלאת התמונה נכשלה מהסיבה הבאה: "+ex.Message;
            }
        }

        string strsql = "insert into [Dress](size,length,image_path,additional_text)  values( ";
        strsql += "'" + Size.Text + "',";
        strsql += "'" + Length.Text + "',";
        if (ImageFile.HasFile)
            strsql += "'" + saveImagePath + "',";
        else
            strsql += "'null',";
        strsql += "'" + Info.Text + "'); SELECT SCOPE_IDENTITY()";
        int dress_id = db.execID(strsql);
        string strsql2 = "insert into [Color2Dress](id_dress,id_color) values(";
        strsql2 += "'" + dress_id + "',";
        strsql2 += "'" + DropDownColor.SelectedValue + "')";
        db.exec(strsql2);
        string strsql3 = "insert into [Style2Dress](id_dress,id_style) values(";
        strsql3 += "'" + dress_id + "',";
        strsql3 += "'" + DropDownStyle.SelectedValue + "')";
        db.exec(strsql3);

        ClientScript.RegisterStartupScript(this.GetType(), "RefreshParent", "<script language='javascript'>RefreshParent()</script>");


        //Response.Redirect("AddDressSuccess.html");

        //Response.Redirect("NewDress.aspx");
    
    }
}