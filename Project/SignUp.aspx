<%@ Page Title="" Language="C#" MasterPageFile="~/Style.master" AutoEventWireup="true" CodeFile="SignUp.aspx.cs" Inherits="SignUp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    הרשמה לאתר
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Varela+Round">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        html, body, h1, h2, h3, h4, h5, h6 {
            font-family: 'Varela Round', sans-serif;
        }

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
    הרשמה לאתר
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="TextContent1" runat="Server">
    רישום לאתר על מנת לצפות בקטלוג השמלות. הרישום הוא חינמי.
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="MainContent" runat="Server">
    <form id="form1" runat="server">
        <label><b>שם משתמש:</b></label>
        <asp:TextBox ID="Username" placeholder="akiva1234" runat="server" class="w3-input w3-border w3-round-xxlarge"></asp:TextBox>
        <label><b>סיסמה:</b></label>
        <asp:TextBox ID="Password" TextMode="Password" runat="server" class="w3-input w3-border w3-round-xxlarge"></asp:TextBox>
        <label><b>שם מלא:</b></label>
        <asp:TextBox ID="FullName" placeholder="Akiva Prager" runat="server" class="w3-input w3-border w3-round-xxlarge"></asp:TextBox>
        <label><b>כתובת:</b></label>
        <asp:TextBox ID="Address" placeholder="sfdd 32, ghfhhg, fgfd" runat="server" class="w3-input w3-border w3-round-xxlarge"></asp:TextBox>
        <label><b>טלפון:</b></label>
        <asp:TextBox ID="Phone" placeholder="021234567" runat="server" class="w3-input w3-border w3-round-xxlarge"></asp:TextBox>
        <label><b>מידה אישית:</b></label>
        <asp:TextBox ID="Size" placeholder="12" runat="server" class="w3-input w3-border w3-round-xxlarge"></asp:TextBox>
        <label><b>גובה אישי:</b></label>
        <asp:TextBox ID="Length" placeholder="125" runat="server" class="w3-input w3-border w3-round-xxlarge"></asp:TextBox>
        <asp:Button ID="Submit" runat="server" class="w3-btn w3-block w3-teal w3-round-xxlarge" Text="הרשמה" />
    </form>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="Title2" runat="Server">
    ש
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="TextContent2" runat="Server">
    ש
</asp:Content>
<asp:Content ID="Content8" ContentPlaceHolderID="Title3" runat="Server">
    ש
</asp:Content>
<asp:Content ID="Content9" ContentPlaceHolderID="TextContent3" runat="Server">
    ש
</asp:Content>

