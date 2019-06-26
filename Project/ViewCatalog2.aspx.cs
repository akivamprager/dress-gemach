using System;
using System.Collections;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ViewCatalog2 : System.Web.UI.Page
{
    private string Sort
    {
        get
        {
            return String.Concat(this.SortExpression, (this.SortDirection == SortDirection.Ascending) ? " ASC" : " DESC");
        }
    }

    private SortDirection SortDirection
    {
        get
        {
            if (ViewState["SortDirection"] == null)
            {
                ViewState["SortDirection"] = SortDirection.Ascending;
            }

            return (SortDirection)ViewState["SortDirection"];
        }
        set { ViewState["SortDirection"] = value; }
    }

    private string SortExpression
    {
        get
        {
            if (ViewState["SortExpression"] == null)
            {
                ViewState["SortExpression"] = "id_dress";
            }

            return ViewState["SortExpression"].ToString();
        }
        set { ViewState["SortExpression"] = value; }
    }

    private IDictionary<string, object> GetValues(GridViewRow row)
    {
        IOrderedDictionary dictionary = new OrderedDictionary();

        foreach (Control control in row.Controls)
        {
            DataControlFieldCell cell = control as DataControlFieldCell;

            if ((cell != null) && cell.Visible)
            {
                cell.ContainingField.ExtractValuesFromCell(dictionary, cell, row.RowState, true);
            }
        }

        IDictionary<string, object> values = new Dictionary<string, object>();

        foreach (DictionaryEntry de in dictionary)
        {
            values[de.Key.ToString()] = de.Value;
        }

        return values;
    }

    private void SetData()
    {
        using (SqlConnection conn = new SqlConnection(db.connectionString))
        using (SqlCommand cmd = new SqlCommand("SELECT Dress.id_dress, Dress.size, Dress.length, Dress.image_path, Dress.additional_text, Style.id_style, Style.style_name, Color.id_color, Color.color_name FROM Dress INNER JOIN Style2Dress ON Dress.id_dress = Style2Dress.id_dress INNER JOIN Style ON Style2Dress.id_style = Style.id_style INNER JOIN Color2Dress ON Dress.id_dress = Color2Dress.id_dress INNER JOIN Color ON Color2Dress.id_color = Color.id_color", conn))
        using (SqlDataAdapter adapter = new SqlDataAdapter(cmd))
        {
            try
            {
                conn.Open();
                DataTable dt = new DataTable();
                adapter.Fill(dt);
                DataView dv = dt.DefaultView;
                dv.Sort = this.Sort;

                gvDress.DataSource = dv;
                gvDress.DataBind();
            }
            catch { }
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["admin"].Equals("true"))
        {
            Response.Redirect("ViewCatalog1.aspx?msg=401");
        }
        if (!this.IsPostBack)
        {
            this.SetData();
        }
    }

    protected void gvDress_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvDress.PageIndex = e.NewPageIndex;

        this.SetData();
    }

    protected void gvDress_Sorting(object sender, GridViewSortEventArgs e)
    {
        if (this.SortExpression.Equals(e.SortExpression))
        {
            this.SortDirection = (this.SortDirection == SortDirection.Ascending)
                ? SortDirection.Descending
                : SortDirection.Ascending;
        }
        else
        {
            this.SortDirection = SortDirection.Ascending;
        }

        this.SortExpression = e.SortExpression;

        this.SetData();
    }

    protected void gvDress_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName.Equals("Favorite"))
        {
            using (SqlConnection conn = new SqlConnection(db.connectionString))
            using (SqlCommand cmd = new SqlCommand("INSERT INTO [FavoriteDress] ([id_person],[id_dress]) VALUES (@id_person, @id_dress)", conn))
            {
                cmd.Parameters.AddWithValue("id_person", Session["id"]);
                cmd.Parameters.Add("id_dress", SqlDbType.Int);
                cmd.Parameters["id_dress"].Direction = ParameterDirection.Output;

                try
                {
                    conn.Open();

                    if (cmd.ExecuteNonQuery().Equals(1))
                    {
                        lblMessage.Text = String.Format(
                            "Dress '{0}' successfully added to favs.",
                            cmd.Parameters["id_dress"].Value);

                        this.SetData();
                    }
                }
                catch { }
            }
        }
        if (e.CommandName.Equals("AskBorrow"))
        {
            string email = "akivaprager@gmail.com";
            string link = "parent.location='mailto:" + email + "?subject=Dress Request&body=I would like to request to borrow dress numbered...'";
            ClientScript.RegisterStartupScript(this.GetType(), "mailto", link, true);
        }
    }
}

