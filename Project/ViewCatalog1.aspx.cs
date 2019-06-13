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
                ViewState["SortExpression"] = "ShipperID";
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
        using (SqlCommand cmd = new SqlCommand("SELECT * FROM [Dress]", conn))
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
        using (SqlCommand cmd = new SqlCommand("UPDATE [Dress] SET [size] = @size, [length] = @length, [color] = @color, [image_path] = @image_path, [style] = @style, [additional_text] = @additional_text, WHERE (id_dress = @id_dress)", conn))
        {
            cmd.Parameters.AddWithValue("id_dress", gvDress.DataKeys[row.RowIndex]["id_dress"]);
            cmd.Parameters.AddWithValue("size", newValues["size"]);
            cmd.Parameters.AddWithValue("length", newValues["length"]);
            cmd.Parameters.AddWithValue("color", newValues["color"]);
            cmd.Parameters.AddWithValue("image_path", newValues["image_path"]);
            cmd.Parameters.AddWithValue("style", newValues["style"]);
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
    }

    protected void gvDress_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        using (SqlConnection conn = new SqlConnection(db.connectionString))
        using (SqlCommand cmd = new SqlCommand("DELETE FROM [Dress] WHERE (id_dress = @id_dress)", conn))
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
    }

    protected void gvDress_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName.Equals("Insert"))
        {
            LinkButton btnInsert = e.CommandSource as LinkButton;

            if (btnInsert == null) { return; }

            GridViewRow row = btnInsert.NamingContainer as GridViewRow;
            TextBox txtSize = row.FindControl("txtSize") as TextBox;
            TextBox txtLength = row.FindControl("txtLength") as TextBox;
            TextBox txtColor = row.FindControl("txtColor") as TextBox;
            TextBox txtImagePath = row.FindControl("txtImagePath") as TextBox;
            TextBox txtStyle = row.FindControl("txtStyle") as TextBox;
            TextBox txtAdditionalText = row.FindControl("txtAdditionalText") as TextBox;

            if (txtSize == null) { return; }
            if (txtLength == null) { return; }
            if (txtColor == null) { return; }
            if (txtImagePath == null) { return; }
            if (txtStyle == null) { return; }
            if (txtAdditionalText == null) { return; }


            using (SqlConnection conn = new SqlConnection(db.connectionString))
            using (SqlCommand cmd = new SqlCommand("INSERT INTO [Dress] ([size], [length], [color], [image_path], [style], [additional_text]) VALUES (@size, @length, @color, @image_path, @style, @additional_text); SELECT @id_dress = SCOPE_IDENTITY()", conn))
            {
                cmd.Parameters.AddWithValue("size", txtSize.Text);
                cmd.Parameters.AddWithValue("length", txtLength.Text);
                cmd.Parameters.AddWithValue("color", txtColor.Text);
                cmd.Parameters.AddWithValue("image_path", txtImagePath.Text);
                cmd.Parameters.AddWithValue("style", txtStyle.Text);
                cmd.Parameters.AddWithValue("additional_text", txtAdditionalText.Text);

                cmd.Parameters.Add("id_dress", SqlDbType.Int);
                cmd.Parameters["id_dress"].Direction = ParameterDirection.Output;

                try
                {
                    conn.Open();

                    if (cmd.ExecuteNonQuery().Equals(1))
                    {
                        lblMessage.Text = String.Format(
                            "Dress '{0}' successfully added.",
                            cmd.Parameters["id_dress"].Value);

                        this.SetData();
                    }
                }
                catch { }
            }
        }
        if (e.CommandName.Equals("Borrow"))
        {
            
        }
    }
}

