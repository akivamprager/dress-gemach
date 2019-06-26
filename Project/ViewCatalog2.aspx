<%@ Page Title="" Language="C#" MasterPageFile="~/Style.master" AutoEventWireup="true" CodeFile="ViewCatalog2.aspx.cs" Inherits="ViewCatalog2" %>

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
        <asp:GridView BorderStyle="None" HeaderStyle-CssClass="w3-row-padding" EditRowStyle-CssClass="w3-pale-yellow"
            ID="gvDress" dir="rtl" runat="server" CssClass="w3-table w3-striped w3-centered w3-border w3-hoverable w3-responsive"
            AutoGenerateColumns="False" DataKeyNames="id_dress,id_color,id_style" AllowSorting="True"
            OnPageIndexChanging="gvDress_PageIndexChanging" OnRowCommand="gvDress_RowCommand" OnSorting="gvDress_Sorting">
            <Columns>
                <asp:TemplateField HeaderText="Actions">
                    <ItemTemplate>
                        <asp:Button ID="btnFavorite" runat="server" CommandName="Favorite" Text="מועדף" />
                        <asp:Button ID="btnAskBorrow" runat="server" CommandName="AskBorrow" Text="בקשה לשאילה" />
                    </ItemTemplate>
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
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Length" SortExpression="length">
                    <ItemTemplate>
                        <%# Eval("length") %>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Color" SortExpression="color_name">
                    <ItemTemplate>
                        <%# Eval("color_name") %>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Style" SortExpression="style_name">
                    <ItemTemplate>
                        <%# Eval("style_name") %>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Additional Info" SortExpression="additional_text">
                    <ItemTemplate>
                        <%# Eval("additional_text") %>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <HeaderStyle CssClass="w3-teal"></HeaderStyle>
            <PagerStyle CssClass="w3-teal"></PagerStyle>
        </asp:GridView>
    </div>
</asp:Content>

