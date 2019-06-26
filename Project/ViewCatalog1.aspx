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
    <!--
    <div class="w3-panel w3-green w3-round w3-display-container" dir="ltr" id="alert">
        
        <span onclick="this.parentElement.style.display='none';" class="w3-button w3-large w3-display-topleft">&times;</span>
        <p class="">
            !-->
    <asp:Label ID="lblMessage" runat="server" EnableViewState="false" Text="" /><!--
        </p>
    </div>!-->
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
            OnRowCommand="gvDress_RowCommand" OnRowDeleting="gvDress_RowDeleting" OnRowEditing="gvDress_RowEditing"
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
                        <!-- <div id="modal01" class="w3-modal w3-animate-zoom" onclick="this.style.display='none'">
                            <span class="w3-button w3-hover-red w3-xlarge w3-display-topright">&times;</span>
                            <asp:Image ID="Image2" runat="server" ImageUrl='<%# Bind("image_path") %>' Style="width: fit-content" class="w3-modal-content w3-responsive w3-round-large w3-image" onerror="if (this.src != 'images/noimage.png') this.src = 'images/noimage.png';" />
                        </div>!-->
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

        <asp:SqlDataSource ID="SqlDataSource1" runat="server"
            ConnectionString="Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\GemachDB.mdf;Integrated Security=True"
            SelectCommand="SELECT Dress.id_dress, Dress.size, Dress.length, Dress.image_path, Dress.additional_text, Style.id_style, Style.style_name, Color.id_color, Color.color_name FROM Dress INNER JOIN Style2Dress ON Dress.id_dress = Style2Dress.id_dress INNER JOIN Style ON Style2Dress.id_style = Style.id_style INNER JOIN Color2Dress ON Dress.id_dress = Color2Dress.id_dress INNER JOIN Color ON Color2Dress.id_color = Color.id_color"
            DeleteCommand="DELETE FROM [Dress] WHERE [id_dress] = @id_dress; DELETE FROM [Color2Dress] where [id_dress] = @id_dress; DELETE FROM [Style2Dress] where [id_dress] = @id_dress;"
            UpdateCommand="UPDATE [Dress] SET [size] = @size, [length] = @length, [image_path] = @image_path, [additional_text] = @additional_text WHERE [id_dress] = @id_dress; UPDATE [Color2Dress] SET [id_color] = @id_color WHERE [id_dress] = @id_dress; UPDATE [Style2Dress] SET [id_style] = @id_style WHERE [id_dress] = @id_dress;"
            ProviderName="System.Data.SqlClient">
            <DeleteParameters>
                <asp:Parameter Name="id_dress" Type="Int32"></asp:Parameter>
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="size" Type="String"></asp:Parameter>
                <asp:Parameter Name="length" Type="String"></asp:Parameter>
                <asp:Parameter Name="image_path" Type="String"></asp:Parameter>
                <asp:Parameter Name="additional_text" Type="String"></asp:Parameter>
                <asp:Parameter Name="id_dress" Type="Int32"></asp:Parameter>
                <asp:Parameter Name="color_name" Type="String"></asp:Parameter>
                <asp:Parameter Name="id_color" Type="Int32"></asp:Parameter>
                <asp:Parameter Name="style_name" Type="String"></asp:Parameter>
                <asp:Parameter Name="id_style" Type="Int32"></asp:Parameter>
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>

