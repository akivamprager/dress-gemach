<%@ Page Title="" Language="C#" MasterPageFile="~/Style.master" AutoEventWireup="true" CodeFile="ViewUsers.aspx.cs" Inherits="ViewUsers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    צפייה בכל המשתמשים
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Title1" runat="Server">
    צפייה בכל המשתמשים
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="TextContent1" runat="Server">
    נתוני כל משתמשי האתר
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
        <asp:GridView ID="personTable" runat="server" AutoGenerateColumns="False" AllowSorting="True" AllowPaging="True"
            BorderStyle="None" HeaderStyle-CssClass="w3-row-padding" EditRowStyle-CssClass="w3-pale-yellow"
            dir="rtl" CssClass="w3-table w3-striped w3-centered w3-border w3-hoverable w3-responsive" DataSourceID="userSource" DataKeyNames="id_person">
            <Columns>
                <asp:CommandField ShowEditButton="True" ShowDeleteButton="True"></asp:CommandField>
                <asp:BoundField DataField="id_person" HeaderText="id_person" ReadOnly="True" InsertVisible="False" SortExpression="id_person"></asp:BoundField>
                <asp:CheckBoxField DataField="is_admin" HeaderText="is_admin" SortExpression="is_admin"></asp:CheckBoxField>
                <asp:BoundField DataField="username" HeaderText="username" SortExpression="username"></asp:BoundField>
                <asp:BoundField DataField="password" HeaderText="password" SortExpression="password"></asp:BoundField>
                <asp:BoundField DataField="full_name" HeaderText="full_name" SortExpression="full_name"></asp:BoundField>
                <asp:BoundField DataField="address" HeaderText="address" SortExpression="address"></asp:BoundField>
                <asp:BoundField DataField="phone" HeaderText="phone" SortExpression="phone"></asp:BoundField>
                <asp:BoundField DataField="dress_size" HeaderText="dress_size" SortExpression="dress_size"></asp:BoundField>
                <asp:BoundField DataField="dress_length" HeaderText="dress_length" SortExpression="dress_length"></asp:BoundField>
            </Columns>

            <HeaderStyle CssClass="w3-teal"></HeaderStyle>
            <PagerStyle CssClass="w3-teal"></PagerStyle>

        </asp:GridView>
        <asp:SqlDataSource ID="userSource" runat="server" ConnectionString="Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\GemachDB.mdf;Integrated Security=True" DeleteCommand="DELETE FROM [Person] WHERE [id_person] = @id_person" InsertCommand="INSERT INTO [Person] ([is_admin], [username], [password], [full_name], [address], [phone], [dress_size], [dress_length]) VALUES (@is_admin, @username, @password, @full_name, @address, @phone, @dress_size, @dress_length)" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [Person]" UpdateCommand="UPDATE [Person] SET [is_admin] = @is_admin, [username] = @username, [password] = @password, [full_name] = @full_name, [address] = @address, [phone] = @phone, [dress_size] = @dress_size, [dress_length] = @dress_length WHERE [id_person] = @id_person">
            <DeleteParameters>
                <asp:Parameter Name="id_person" Type="Int32"></asp:Parameter>
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="is_admin" Type="Boolean"></asp:Parameter>
                <asp:Parameter Name="username" Type="String"></asp:Parameter>
                <asp:Parameter Name="password" Type="String"></asp:Parameter>
                <asp:Parameter Name="full_name" Type="String"></asp:Parameter>
                <asp:Parameter Name="address" Type="String"></asp:Parameter>
                <asp:Parameter Name="phone" Type="String"></asp:Parameter>
                <asp:Parameter Name="dress_size" Type="String"></asp:Parameter>
                <asp:Parameter Name="dress_length" Type="String"></asp:Parameter>
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="is_admin" Type="Boolean"></asp:Parameter>
                <asp:Parameter Name="username" Type="String"></asp:Parameter>
                <asp:Parameter Name="password" Type="String"></asp:Parameter>
                <asp:Parameter Name="full_name" Type="String"></asp:Parameter>
                <asp:Parameter Name="address" Type="String"></asp:Parameter>
                <asp:Parameter Name="phone" Type="String"></asp:Parameter>
                <asp:Parameter Name="dress_size" Type="String"></asp:Parameter>
                <asp:Parameter Name="dress_length" Type="String"></asp:Parameter>
                <asp:Parameter Name="id_person" Type="Int32"></asp:Parameter>
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>

