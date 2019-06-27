<%@ Page Title="" Language="C#" MasterPageFile="~/Style.master" AutoEventWireup="true" CodeFile="ViewMyFavorites.aspx.cs" Inherits="ViewMyFavorites" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    צפייה בשמלות המועדפות עלי
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Title1" runat="Server">
    צפייה בשמלות המועדפות עלי
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="TextContent1" runat="Server">
    נתוני השמלות שבחרתי כמועדפות
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="Title2" runat="Server">
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="TextContent2" runat="Server">
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="Title3" runat="Server">
</asp:Content>
<asp:Content ID="Content8" ContentPlaceHolderID="TextContent3" runat="Server">
</asp:Content>
<asp:Content ID="Content9" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:Label ID="lblMessage" runat="server" EnableViewState="false" Text="" />
    <div>
        <script>
            var alert = document.getElementById("alert");
            var lblMessage = '<% =lblMessage.Text%>blah';
            if (lblMessage === 'blah') {
                alert.style.display = "none";
            } else {
                alert.style.display = "normal";
            }
        </script>
        <asp:GridView ID="favTable" runat="server" AutoGenerateColumns="False" DataKeyNames="id_dress" DataSourceID="favSource" AllowSorting="True" AllowPaging="True"
            BorderStyle="None" HeaderStyle-CssClass="w3-row-padding"
            dir="rtl" CssClass="w3-table w3-striped w3-centered w3-border w3-hoverable w3-responsive">
            <Columns>
                <asp:CommandField ShowDeleteButton="True"></asp:CommandField>
                <asp:BoundField DataField="id_dress" HeaderText="id_dress" SortExpression="id_dress" InsertVisible="False" ReadOnly="True"></asp:BoundField>
                <asp:TemplateField HeaderText="Image">
                    <ItemTemplate>
                        <div class="w3-card-2">
                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# Bind("image_path") %>' class="w3-round w3-hover-opacity w3-image" Style="max-width: 100px; max-height: 100px; height: 100px;" onerror="if (this.src != 'images/noimage.png') this.src = 'images/noimage.png';" />
                        </div>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="size" HeaderText="size" SortExpression="size"></asp:BoundField>
                <asp:BoundField DataField="length" HeaderText="length" SortExpression="length"></asp:BoundField>
                <asp:BoundField DataField="color_name" HeaderText="color_name" SortExpression="color_name"></asp:BoundField>
                <asp:BoundField DataField="style_name" HeaderText="style_name" SortExpression="style_name"></asp:BoundField>
                <asp:BoundField DataField="additional_text" HeaderText="additional_text" SortExpression="additional_text"></asp:BoundField>
                <asp:BoundField DataField="image_path" HeaderText="image_path" SortExpression="image_path"></asp:BoundField>
            </Columns>
            <HeaderStyle CssClass="w3-teal"></HeaderStyle>
            <PagerStyle CssClass="w3-teal"></PagerStyle>

        </asp:GridView>
        <asp:SqlDataSource ID="favSource" runat="server" DeleteCommand="DELETE FROM [FavoriteDress] WHERE [id_dress] = @id_dress" ConnectionString="Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\GemachDB.mdf;Integrated Security=True"
            ProviderName="System.Data.SqlClient">
            <DeleteParameters>
                <asp:Parameter Name="id_dress" Type="Int32"></asp:Parameter>
            </DeleteParameters>
            </asp:SqlDataSource>

    </div>
</asp:Content>
