<%@ Page Title="" Language="C#" MasterPageFile="~/Style.master" AutoEventWireup="true" CodeFile="ViewBorrows.aspx.cs" Inherits="ViewBorrows" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    צפייה בנתוני השאלות
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Title1" runat="Server">
    צפייה בנתוני השאלות
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="TextContent1" runat="Server">
    נתוני השמלות שהושאלו מהגמ"ח
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
        <asp:GridView ID="borrowTable" runat="server" AutoGenerateColumns="False" DataKeyNames="id_borrow" DataSourceID="borrowSource" AllowSorting="True" AllowPaging="True"
            BorderStyle="None" HeaderStyle-CssClass="w3-row-padding" EditRowStyle-CssClass="w3-pale-yellow"
            dir="rtl" CssClass="w3-table w3-striped w3-centered w3-border w3-hoverable w3-responsive">
            <Columns>
                <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" ShowSelectButton="True"></asp:CommandField>
                <asp:BoundField DataField="id_borrow" HeaderText="id_borrow" ReadOnly="True" InsertVisible="False" SortExpression="id_borrow"></asp:BoundField>
                <asp:BoundField DataField="id_dress" HeaderText="id_dress" SortExpression="id_dress"></asp:BoundField>
                <asp:BoundField DataField="id_person" HeaderText="id_person" SortExpression="id_person"></asp:BoundField>
                <asp:BoundField DataField="date_borrowed" HeaderText="date_borrowed" SortExpression="date_borrowed"></asp:BoundField>
                <asp:BoundField DataField="date_return" HeaderText="date_return" SortExpression="date_return"></asp:BoundField>
                <asp:BoundField DataField="date_returned" HeaderText="date_returned" SortExpression="date_returned"></asp:BoundField>
                <asp:BoundField DataField="borrow_info" HeaderText="borrow_info" SortExpression="borrow_info"></asp:BoundField>
                <asp:BoundField DataField="return_info" HeaderText="return_info" SortExpression="return_info"></asp:BoundField>
            </Columns>
            <HeaderStyle CssClass="w3-teal"></HeaderStyle>
            <PagerStyle CssClass="w3-teal"></PagerStyle>

        </asp:GridView>
        <asp:SqlDataSource ID="borrowSource" runat="server" ConnectionString="Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\GemachDB.mdf;Integrated Security=True" DeleteCommand="DELETE FROM [Borrow] WHERE [id_borrow] = @id_borrow" InsertCommand="INSERT INTO [Borrow] ([id_dress], [id_person], [date_borrowed], [date_return], [date_returned], [borrow_info], [return_info]) VALUES (@id_dress, @id_person, @date_borrowed, @date_return, @date_returned, @borrow_info, @return_info)" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [Borrow] ORDER BY [date_borrowed] DESC" UpdateCommand="UPDATE [Borrow] SET [id_dress] = @id_dress, [id_person] = @id_person, [date_borrowed] = @date_borrowed, [date_return] = @date_return, [date_returned] = @date_returned, [borrow_info] = @borrow_info, [return_info] = @return_info WHERE [id_borrow] = @id_borrow">
            <DeleteParameters>
                <asp:Parameter Name="id_borrow" Type="Int32"></asp:Parameter>
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="id_dress" Type="Int32"></asp:Parameter>
                <asp:Parameter Name="id_person" Type="Int32"></asp:Parameter>
                <asp:Parameter Name="date_borrowed" Type="DateTime"></asp:Parameter>
                <asp:Parameter Name="date_return" Type="DateTime"></asp:Parameter>
                <asp:Parameter Name="date_returned" Type="DateTime"></asp:Parameter>
                <asp:Parameter Name="borrow_info" Type="String"></asp:Parameter>
                <asp:Parameter Name="return_info" Type="String"></asp:Parameter>
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="id_dress" Type="Int32"></asp:Parameter>
                <asp:Parameter Name="id_person" Type="Int32"></asp:Parameter>
                <asp:Parameter Name="date_borrowed" Type="DateTime"></asp:Parameter>
                <asp:Parameter Name="date_return" Type="DateTime"></asp:Parameter>
                <asp:Parameter Name="date_returned" Type="DateTime"></asp:Parameter>
                <asp:Parameter Name="borrow_info" Type="String"></asp:Parameter>
                <asp:Parameter Name="return_info" Type="String"></asp:Parameter>
                <asp:Parameter Name="id_borrow" Type="Int32"></asp:Parameter>
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>

