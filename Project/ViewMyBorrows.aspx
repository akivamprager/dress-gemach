<%@ Page Title="" Language="C#" MasterPageFile="~/Style.master" AutoEventWireup="true" CodeFile="ViewMyBorrows.aspx.cs" Inherits="ViewMyBorrows" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
     צפייה בנתוני השאלות שלי
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Title1" runat="Server">
    צפייה בנתוני השאלות שלי
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="TextContent1" runat="Server">
    נתוני השמלות שהשאלתי מהגמ"ח
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
            BorderStyle="None" HeaderStyle-CssClass="w3-row-padding"
            dir="rtl" CssClass="w3-table w3-striped w3-centered w3-border w3-hoverable w3-responsive">
            <Columns>
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
        <asp:SqlDataSource ID="borrowSource" runat="server" ConnectionString="Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\GemachDB.mdf;Integrated Security=True" 
        ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [Borrow] WHERE ([id_person] = @id_person)">
            <SelectParameters>
                <asp:SessionParameter SessionField="id_person" Name="id_person" Type="Object"></asp:SessionParameter>
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>