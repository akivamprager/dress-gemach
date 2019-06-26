<%@ Page Language="C#" MasterPageFile="~/Style.master" AutoEventWireup="true" CodeFile="Borrow.aspx.cs" Inherits="Borrow" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    השאלת שמלה
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
    <style>
        #h1c {
            text-align: center;
        }

        input {
            padding: 10px;
            width: 100%;
            font-size: 17px;
            border: 1px solid #aaaaaa;
        }

            input[type=text]:focus {
                box-shadow: 0 0 2pt 0.5pt teal;
                outline: none;
            }

            input[type="color"] {
                width: 44px;
                height: 23px;
                background-color: buttonface;
                border-width: 1px;
                border-style: solid;
                border-color: rgb(169, 169, 169);
                border-image: initial;
                padding: 1px 2px;
            }
            /* Mark input boxes that gets an error on validation: */
            input.invalid {
                background-color: #ffdddd;
            }

        button {
            background-color: #008080;
            color: #ffffff;
            border: none;
            padding: 10px 20px;
            font-size: 17px;
            cursor: pointer;
        }

            button:hover {
                opacity: 0.8;
            }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Title1" runat="Server">
השאלת שמלה
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="TextContent1" runat="Server">
אנא מילאו את פרטי השואל
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="w3-container w3-card-4 w3-round-large w3-light-grey w3-text-teal w3-padding w3-margin">
        <h3>
            <asp:Label runat="server" CssClass="w3-red w3-animate-opacity" ID="error"></asp:Label></h3>
        <h2 class="w3-center">השאלה</h2>

        <label><b>השואל:</b></label>
        <asp:DropDownList CssClass="w3-select w3-border w3-padding w3-round-xxlarge" ID="DropDownPerson" runat="server" DataSourceID="personSDC" DataTextField="full_name" DataValueField="id_person"></asp:DropDownList>
        <asp:SqlDataSource runat="server" ID="personSDC" ConnectionString="Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\GemachDB.mdf;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [Person]"></asp:SqlDataSource>
        <br />
        <label><b>השמלה:</b></label>
        <asp:DropDownList CssClass="w3-select w3-border w3-padding w3-round-xxlarge" ID="DropDownDress" runat="server" DataSourceID="dressSDC" DataTextField="id_dress" DataValueField="id_dress"></asp:DropDownList>
        <asp:SqlDataSource runat="server" ID="dressSDC" ProviderName="System.Data.SqlClient"
        ConnectionString="Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\GemachDB.mdf;Integrated Security=True" 
        SelectCommand="select dress.id_dress from dress, borrow where dress.id_dress not in (select id_dress from borrow) or (dress.id_dress = borrow.id_dress and datediff(day, borrow.date_return, getdate()) > 0)">
        </asp:SqlDataSource>
        <br />
        <label><b>הערות:</b></label>
        <asp:TextBox ID="borrow_info" runat="server" class="w3-input w3-border w3-round-xxlarge"></asp:TextBox>
        <br>
        <br>
        <b>
            <asp:Button ID="Submit" runat="server" class="w3-btn w3-block w3-teal w3-round-xxlarge" Text="שאילה" OnClick="Submit_Click" />
        </b>
    </div>
    </asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="Title2" runat="Server">
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="TextContent2" runat="Server">
</asp:Content>
<asp:Content ID="Content8" ContentPlaceHolderID="Title3" runat="Server">
</asp:Content>
<asp:Content ID="Content9" ContentPlaceHolderID="TextContent3" runat="Server">
</asp:Content>

