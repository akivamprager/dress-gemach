<%@ Page Title="" Language="C#" MasterPageFile="~/Style.master" AutoEventWireup="true" CodeFile="ViewCatalog1.aspx.cs" Inherits="ViewCatalog1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    קטלוג הגמ"ח
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Title1" runat="Server">
    קטלוג השמלות
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="TextContent1" runat="Server">
    השמלות שתועדו במחסן הגמ"ח
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
    <div class="" style="">
        <script>
            var alert = document.getElementById("alert");
            var lblMessage = '<% =lblMessage.Text%>blah';
            if (lblMessage === 'blah') {
                alert.style.display = "none";
            } else {
                alert.style.display = "normal";
            }
        </script>
        <asp:GridView BorderStyle="None" HeaderStyle-CssClass="w3-row-padding" EditRowStyle-CssClass="w3-pale-yellow"
            ID="gvDress" dir="rtl" runat="server" CssClass="w3-table w3-striped w3-centered w3-border w3-hoverable w3-responsive"
            AutoGenerateColumns="False" DataKeyNames="id_dress" AllowSorting="True"
            OnPageIndexChanging="gvDress_PageIndexChanging" OnRowCancelingEdit="gvDress_RowCancelingEdit"
            OnRowDeleting="gvDress_RowDeleting" OnRowEditing="gvDress_RowEditing"
            OnRowUpdating="gvDress_RowUpdating" OnSorting="gvDress_Sorting" ShowFooter="false">
            <Columns>
                <asp:TemplateField HeaderText="Actions">
                    <ItemTemplate>
                        <asp:Button CssClass="w3-btn w3-green" ID="btnEdit" runat="server" CommandName="Edit" Text="עריכה" />
                        <asp:Button CssClass="w3-btn w3-red" ID="btnDelete" runat="server" CommandName="Delete" Text="מחיקה" />
                        <asp:Button CssClass="w3-btn w3-blue" Visible="false" ID="btnBorrow" runat="server" CommandName="Borrow" Text="שאילה" />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:Button ID="btnUpdate" CssClass="w3-btn w3-green" runat="server" CommandName="Update" Text="עדכון" />
                        <asp:Button ID="btnCancel" CssClass="w3-btn w3-gray" runat="server" CommandName="Cancel" Text="ביטול" />
                    </EditItemTemplate>
                </asp:TemplateField>

                <asp:BoundField DataField="id_dress" HeaderText="Dress ID" ReadOnly="True" InsertVisible="False" SortExpression="id_dress"></asp:BoundField>

                <asp:TemplateField HeaderText="Image">
                    <ItemTemplate>
                        <div class="w3-card-2">
                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# Bind("image_path") %>' class="w3-round w3-hover-opacity w3-image" Style="max-width: 100px; max-height: 100px; height: 100px;" onerror="if (this.src != 'images/noimage.png') this.src = 'images/noimage.png';" />
                        </div>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Size" SortExpression="size">
                    <ItemTemplate>
                        <%# Eval("size") %>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtSize" runat="server" Text='<%# Bind("size") %>' />
                    </EditItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Length" SortExpression="length">
                    <ItemTemplate>
                        <%# Eval("length") %>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtLength" runat="server" Text='<%# Bind("length") %>' />
                    </EditItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Color" SortExpression="color_name">
                    <ItemTemplate>
                        <%# Eval("color_name") %>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:DropDownList Enabled="false" ID="ddColorName" DataSourceID="colorSDC" DataTextField="color_name" DataValueField="id_color" runat="server" />
                        <asp:SqlDataSource ID="colorSDC" runat="server" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [Color]" ConnectionString="Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\GemachDB.mdf;Integrated Security=True"></asp:SqlDataSource>
                    </EditItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Style" SortExpression="style_name">
                    <ItemTemplate>
                        <%# Eval("style_name") %>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:DropDownList Enabled="false" ID="ddStyleName" DataSourceID="styleSDC" DataTextField="style_name" DataValueField="id_style" runat="server" />
                        <asp:SqlDataSource ID="styleSDC" runat="server" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [Style]" ConnectionString="Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\GemachDB.mdf;Integrated Security=True"></asp:SqlDataSource>
                    </EditItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Image Path on Server" SortExpression="image_path">
                    <ItemTemplate>
                        <%# Eval("image_path") %>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtImagePath" runat="server" Text='<%# Bind("image_path") %>' />
                    </EditItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Additional Info" SortExpression="additional_text">
                    <ItemTemplate>
                        <%# Eval("additional_text") %>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtAdditionalText" runat="server" Text='<%# Bind("additional_text") %>' />
                    </EditItemTemplate>
                </asp:TemplateField>
            </Columns>
            <HeaderStyle CssClass="w3-teal"></HeaderStyle>
            <PagerStyle CssClass="w3-teal"></PagerStyle>
        </asp:GridView>
    </div>
</asp:Content>

