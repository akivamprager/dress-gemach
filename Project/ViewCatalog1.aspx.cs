using System;
using System.Collections;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ViewCatalog1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["admin"] != null)
            if (!Session["admin"].Equals("true"))
            {
                Response.Redirect("ViewCatalog2.aspx?msg=401");
            }
        if (!this.IsPostBack)
        {
            this.SetData();
        }
    }

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

    protected void gvDress_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gvDress.EditIndex = e.NewEditIndex;

        this.SetData();
    }

    protected void gvDress_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        gvDress.EditIndex = -1;

        this.SetData();

    }

    protected void gvDress_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        GridViewRow row = gvDress.Rows[e.RowIndex];
        var newValues = this.GetValues(row);

        using (SqlConnection conn = new SqlConnection(db.connectionString))
        using (SqlCommand cmd = new SqlCommand("UPDATE [Dress] SET [size] = @size, [length] = @length, [image_path] = @image_path, [additional_text] = @additional_text WHERE [id_dress] = @id_dress;", conn))// UPDATE [Color2Dress] SET [id_color] = @id_color WHERE [id_dress] = @id_dress; UPDATE [Style2Dress] SET [id_style] = @id_style WHERE [id_dress] = @id_dress;", conn))
        {
            cmd.Parameters.AddWithValue("id_dress", gvDress.DataKeys[row.RowIndex]["id_dress"]);
            cmd.Parameters.AddWithValue("size", newValues["size"]);
            cmd.Parameters.AddWithValue("length", newValues["length"]);
            cmd.Parameters.AddWithValue("image_path", newValues["image_path"]);
            cmd.Parameters.AddWithValue("additional_text", newValues["additional_text"]);

            try
            {
                conn.Open();

                if (cmd.ExecuteNonQuery().Equals(1))
                {
                    lblMessage.Text = String.Format(
                        "Dress '{0}' successfully updated.",
                        cmd.Parameters["id_dress"].Value);

                    gvDress.EditIndex = -1;

                    this.SetData();
                }
            }
            catch { }
        }
        Response.Redirect("ViewCatalog1.aspx?" + DateTime.Now.ToString());

    }

    protected void gvDress_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        using (SqlConnection conn = new SqlConnection(db.connectionString))
        using (SqlCommand cmd = new SqlCommand("DELETE FROM [Dress] WHERE [id_dress] = @id_dress; DELETE FROM [Color2Dress] where [id_dress] = @id_dress; DELETE FROM [Style2Dress] where [id_dress] = @id_dress;", conn))
        {
            cmd.Parameters.AddWithValue("id_dress", gvDress.DataKeys[e.RowIndex]["id_dress"]);

            try
            {
                conn.Open();

                if (cmd.ExecuteNonQuery().Equals(1))
                {
                    lblMessage.Text = String.Format(
                        "Dress '{0}' successfully deleted.",
                        cmd.Parameters["id_dress"].Value);

                    this.SetData();
                }
            }
            catch { }
        }
        Response.Redirect("ViewCatalog1.aspx?" + DateTime.Now.ToString());
    }
}