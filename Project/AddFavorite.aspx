<%@ Page Language="C#" MasterPageFile="~/Style.master" AutoEventWireup="true" CodeFile="AddFavorite.aspx.cs" Inherits="AddFavorite" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    הוספת שמלה מועדפת
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
הוספת שמלה לאוסף השמלות המועדפות
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="TextContent1" runat="Server">
<h2><asp:Label runat="server" Visible="false" CssClass="w3-animate-opacity" ID="message"></asp:Label></h2>
        
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="w3-container w3-card-4 w3-round-large w3-light-grey w3-text-teal w3-padding w3-margin">
        <h2 class="w3-center">הוספת שמלה למועדפים</h2>

        <label><b>קוד השמלה:</b></label>
        <asp:DropDownList CssClass="w3-select w3-border w3-padding w3-round-xxlarge" ID="DropDownDress" runat="server" DataSourceID="dressSDC" DataTextField="id_dress" DataValueField="id_dress"></asp:DropDownList>
        <asp:SqlDataSource runat="server" ID="dressSDC" ProviderName="System.Data.SqlClient"
        ConnectionString="Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\GemachDB.mdf;Integrated Security=True">
        </asp:SqlDataSource>
        <br />
        <br>
        <b>
            <asp:Button ID="Submit" runat="server" class="w3-btn w3-block w3-teal w3-round-xxlarge" Text="הוסף למועדפים" OnClick="Submit_Click" />
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

