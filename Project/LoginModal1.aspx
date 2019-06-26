<%@ Page Language="C#" MasterPageFile="~/Style.master" AutoEventWireup="true" CodeFile="LoginModal1.aspx.cs" Inherits="LoginModal1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    כניסה לאתר
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
    התחברות לאתר
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="TextContent1" runat="Server">
    התחברו על מנת להשתמש בשירותי האתר.
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="w3-container w3-card-4 w3-round-large w3-light-grey w3-text-teal w3-padding w3-margin">
        <h3>
            <asp:Label runat="server" CssClass="w3-red w3-animate-opacity" ID="error"></asp:Label></h3>
        <h2 class="w3-center">התחברות</h2>

        <label><b>שם משתמש:</b></label>

        <asp:TextBox ID="Username" placeholder="" runat="server" class="w3-input w3-border w3-round-xxlarge"></asp:TextBox>

        <label><b>סיסמה:</b></label>

        <asp:TextBox ID="Password" TextMode="Password" runat="server" class="w3-input w3-border w3-round-xxlarge"></asp:TextBox>
                <asp:CheckBox CssClass="w3-check" ID="NotPublicCheckBox" runat="server" />
        <label><b>זכור אותי</b></label>

        <br>
        <br>
        <b>
            <asp:Button ID="Submit" runat="server" class="w3-btn w3-block w3-teal w3-round-xxlarge" Text="כניסה" OnClick="Submit_Click" />
        </b>
    </div>
    <script>
        function Success() {
            parent.document.getElementById('login_modal').style.display = 'none';
            parent.document.getElementById('alert').className += " w3-green";
            parent.document.getElementById("alert").style.display = 'inline-block';
            parent.document.getElementById("alert_content").innerHTML = <%=Session["fullname"]%> +" ברוך הבא לאתר!";
        }
        function Faliure() {
            parent.document.getElementById('login_modal').style.display = 'none';
            parent.document.getElementById('alert').className += " w3-red";
            parent.document.getElementById("alert").style.display = 'inline-block';
            parent.document.getElementById("alert_content").innerHTML = "שם המשתמש או הסיסמה אינם נכונים.";
        }
    </script>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="Title2" runat="Server">
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="TextContent2" runat="Server">
</asp:Content>
<asp:Content ID="Content8" ContentPlaceHolderID="Title3" runat="Server">
</asp:Content>
<asp:Content ID="Content9" ContentPlaceHolderID="TextContent3" runat="Server">
</asp:Content>

