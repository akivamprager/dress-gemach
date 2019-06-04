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
    <form id="form1" runat="server" dir="rtl">

        <div class="w3-panel w3-green w3-round w3-display-container" dir="ltr" id="alert">

            <span onclick="this.parentElement.style.display='none';" class="w3-button w3-large w3-display-topleft">&times;</span>
            <p class="">
                <asp:Label ID="lblMessage" runat="server" EnableViewState="false" Text="" />
            </p>
        </div>
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
            <asp:GridView BorderStyle="None" HeaderStyle-CssClass="w3-row-padding" EditRowStyle-CssClass="w3-pale-yellow" ID="gvDresses" dir="rtl" runat="server" CssClass="w3-table w3-striped w3-centered w3-border w3-hoverable w3-responsive" AutoGenerateColumns="False" DataKeyNames="id_dress" DataSourceID="SqlDataSource1" AllowPaging="False" AllowSorting="True" OnPageIndexChanging="gvDresses_PageIndexChanging" OnRowCancelingEdit="gvDresses_RowCancelingEdit"
                OnRowCommand="gvDresses_RowCommand" OnRowDeleting="gvDresses_RowDeleting" OnRowEditing="gvDresses_RowEditing"
                OnRowUpdating="gvDresses_RowUpdating" OnSorting="gvDresses_Sorting" ShowFooter="true">
                
                <Columns>
                    <asp:TemplateField HeaderText="Actions">
                        <ItemTemplate>
                            <asp:Button ID="btnEdit" runat="server" CommandName="Edit" Text="עריכה" />
                            <asp:Button ID="btnDelete" runat="server" CommandName="Delete"  Text="מחיקה" />
                            <asp:Button ID="btnBorrow" runat="server" CommandName="Borrow" Text="שאילה" />
                        </ItemTemplate>

                        <EditItemTemplate>
                            <asp:Button ID="btnUpdate" runat="server" CommandName="Update" Text="עדכון" />
                            <asp:Button ID="btnCancel" runat="server" CommandName="Cancel" Text="ביטול" />
                        </EditItemTemplate>
                         <FooterTemplate>
                            <asp:LinkButton ID="btnInsert" runat="server" CommandName="Insert" Text="הוספה" />
                        </FooterTemplate> 
                    </asp:TemplateField>

                    <asp:BoundField DataField="id_dress" HeaderText="Dress ID" ReadOnly="True" InsertVisible="False" SortExpression="id_dress"></asp:BoundField>

                    <asp:TemplateField HeaderText="Image">
                        <ItemTemplate>
                            <div class="w3-card-2">
                                <asp:Image ID="Image1" runat="server" ImageUrl='<%# Bind("image_path") %>' onclick="document.getElementById('modal01').style.display='block'" class="w3-round w3-hover-opacity w3-image" Style="max-width: 100px; max-height: 100px; height: 100px; cursor: zoom-in" onerror="if (this.src != 'images/noimage.png') this.src = 'images/noimage.png';" />
                            </div>
                            <div id="modal01" class="w3-modal w3-animate-zoom" onclick="this.style.display='none'">
                                <span class="w3-button w3-hover-red w3-xlarge w3-display-topright">&times;</span>
                                <asp:Image ID="Image2" runat="server" ImageUrl='<%# Bind("image_path") %>' Style="width: fit-content" class="w3-modal-content w3-responsive w3-round-large w3-image" onerror="if (this.src != 'images/noimage.png') this.src = 'images/noimage.png';" />
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
                        <FooterTemplate>
                            <asp:TextBox ID="txtSize" runat="server" />
                        </FooterTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Length" SortExpression="length">
                        <ItemTemplate>
                            <%# Eval("length") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtLength" runat="server" Text='<%# Bind("length") %>' />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtLength" runat="server" />
                        </FooterTemplate>
                    </asp:TemplateField>

                   

                    <asp:TemplateField HeaderText="Image Path on Server" SortExpression="image_path">
                        <ItemTemplate>
                            <%# Eval("image_path") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtImagePath" runat="server" Text='<%# Bind("image_path") %>' />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtImagePath" runat="server" />
                        </FooterTemplate>
                    </asp:TemplateField>

                   

                    <asp:TemplateField HeaderText="Additional Info" SortExpression="additional_text">
                        <ItemTemplate>
                            <%# Eval("additional_text") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtAdditionalText" runat="server" Text='<%# Bind("additional_text") %>' />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtAdditionalText" runat="server" />
                        </FooterTemplate>
                    </asp:TemplateField>
                </Columns>
                
                <HeaderStyle CssClass="w3-teal"></HeaderStyle>
                <PagerStyle CssClass="w3-teal"></PagerStyle>
                    

            </asp:GridView>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\GemachDB.mdf;Integrated Security=True" DeleteCommand="DELETE FROM [Dresses] WHERE [id_dress] = @id_dress" InsertCommand="INSERT INTO [Dresses] ([size], [length], [image_path], [additional_text]) VALUES (@size, @length, @image_path, @additional_text)" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [Dresses]" UpdateCommand="UPDATE [Dresses] SET [size] = @size, [length] = @length, [image_path] = @image_path, [additional_text] = @additional_text WHERE [id_dress] = @id_dress">
                <DeleteParameters>
                    <asp:Parameter Name="id_dress" Type="Int32"></asp:Parameter>
                </DeleteParameters>
                 <InsertParameters>
                    <asp:Parameter Name="size" Type="String"></asp:Parameter>
                    <asp:Parameter Name="length" Type="String"></asp:Parameter>
                    <asp:Parameter Name="image_path" Type="String"></asp:Parameter>
                    <asp:Parameter Name="additional_text" Type="String"></asp:Parameter>
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="size" Type="String"></asp:Parameter>
                    <asp:Parameter Name="length" Type="String"></asp:Parameter>
                    <asp:Parameter Name="image_path" Type="String"></asp:Parameter>
                    <asp:Parameter Name="additional_text" Type="String"></asp:Parameter>
                    <asp:Parameter Name="id_dress" Type="Int32"></asp:Parameter>
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</asp:Content>

