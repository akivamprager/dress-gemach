<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ViewCatalog.aspx.cs" Inherits="ViewCatalog" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-black.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Rubik">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
    <form id="form1" runat="server"> 
    <div>   
        <a href="AddDress.aspx" >Add new dress</a>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\GemachDB.mdf;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [Dress]" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [Dress] WHERE [id_dress] = @original_id_dress AND [size] = @original_size AND (([length] = @original_length) OR ([length] IS NULL AND @original_length IS NULL)) AND (([color] = @original_color) OR ([color] IS NULL AND @original_color IS NULL)) AND (([image_path] = @original_image_path) OR ([image_path] IS NULL AND @original_image_path IS NULL)) AND (([style] = @original_style) OR ([style] IS NULL AND @original_style IS NULL)) AND (([additional_text] = @original_additional_text) OR ([additional_text] IS NULL AND @original_additional_text IS NULL))" InsertCommand="INSERT INTO [Dress] ([size], [length], [color], [image_path], [style], [additional_text]) VALUES (@size, @length, @color, @image_path, @style, @additional_text)" OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [Dress] SET [size] = @size, [length] = @length, [color] = @color, [image_path] = @image_path, [style] = @style, [additional_text] = @additional_text WHERE [id_dress] = @original_id_dress AND [size] = @original_size AND (([length] = @original_length) OR ([length] IS NULL AND @original_length IS NULL)) AND (([color] = @original_color) OR ([color] IS NULL AND @original_color IS NULL)) AND (([image_path] = @original_image_path) OR ([image_path] IS NULL AND @original_image_path IS NULL)) AND (([style] = @original_style) OR ([style] IS NULL AND @original_style IS NULL)) AND (([additional_text] = @original_additional_text) OR ([additional_text] IS NULL AND @original_additional_text IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="original_id_dress" Type="Int32"></asp:Parameter>
                <asp:Parameter Name="original_size" Type="String"></asp:Parameter>
                <asp:Parameter Name="original_length" Type="String"></asp:Parameter>
                <asp:Parameter Name="original_color" Type="String"></asp:Parameter>
                <asp:Parameter Name="original_image_path" Type="String"></asp:Parameter>
                <asp:Parameter Name="original_style" Type="String"></asp:Parameter>
                <asp:Parameter Name="original_additional_text" Type="String"></asp:Parameter>
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="size" Type="String"></asp:Parameter>
                <asp:Parameter Name="length" Type="String"></asp:Parameter>
                <asp:Parameter Name="color" Type="String"></asp:Parameter>
                <asp:Parameter Name="image_path" Type="String"></asp:Parameter>
                <asp:Parameter Name="style" Type="String"></asp:Parameter>
                <asp:Parameter Name="additional_text" Type="String"></asp:Parameter>
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="size" Type="String"></asp:Parameter>
                <asp:Parameter Name="length" Type="String"></asp:Parameter>
                <asp:Parameter Name="color" Type="String"></asp:Parameter>
                <asp:Parameter Name="image_path" Type="String"></asp:Parameter>
                <asp:Parameter Name="style" Type="String"></asp:Parameter>
                <asp:Parameter Name="additional_text" Type="String"></asp:Parameter>
                <asp:Parameter Name="original_id_dress" Type="Int32"></asp:Parameter>
                <asp:Parameter Name="original_size" Type="String"></asp:Parameter>
                <asp:Parameter Name="original_length" Type="String"></asp:Parameter>
                <asp:Parameter Name="original_color" Type="String"></asp:Parameter>
                <asp:Parameter Name="original_image_path" Type="String"></asp:Parameter>
                <asp:Parameter Name="original_style" Type="String"></asp:Parameter>
                <asp:Parameter Name="original_additional_text" Type="String"></asp:Parameter>
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" CssClass="w3-table" AutoGenerateColumns="False" DataKeyNames="id_dress" DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" GridLines="Horizontal">
            <Columns>
                <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" ShowSelectButton="True"></asp:CommandField>
                <asp:BoundField DataField="id_dress" HeaderText="id_dress" ReadOnly="True" InsertVisible="False" SortExpression="id_dress"></asp:BoundField>
                <asp:BoundField DataField="size" HeaderText="size" SortExpression="size"></asp:BoundField>
                <asp:BoundField DataField="length" HeaderText="length" SortExpression="length"></asp:BoundField>
                <asp:BoundField DataField="color" HeaderText="color" SortExpression="color"></asp:BoundField>
                <asp:BoundField DataField="image_path" HeaderText="image_path" SortExpression="image_path"></asp:BoundField>
                <asp:BoundField DataField="style" HeaderText="style" SortExpression="style"></asp:BoundField>
                <asp:BoundField DataField="additional_text" HeaderText="additional_text" SortExpression="additional_text"></asp:BoundField>
            </Columns>
            <FooterStyle BackColor="White" ForeColor="#333333"></FooterStyle>

            <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White"></HeaderStyle>

            <PagerStyle HorizontalAlign="Center" BackColor="#336666" ForeColor="White"></PagerStyle>

            <RowStyle BackColor="White" ForeColor="#333333"></RowStyle>

            <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White"></SelectedRowStyle>

            <SortedAscendingCellStyle BackColor="#F7F7F7"></SortedAscendingCellStyle>

            <SortedAscendingHeaderStyle BackColor="#487575"></SortedAscendingHeaderStyle>

            <SortedDescendingCellStyle BackColor="#E5E5E5"></SortedDescendingCellStyle>

            <SortedDescendingHeaderStyle BackColor="#275353"></SortedDescendingHeaderStyle>
        </asp:GridView>
    </div>
    </form>
</body>
</html>
