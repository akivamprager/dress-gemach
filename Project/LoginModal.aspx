<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LoginModal.aspx.cs" Inherits="LoginModal" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <title></title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="lib/w3.css">
    <script src="lib/w3.js"></script>
    <link rel="stylesheet" href="lib/w3-theme-black.css">
    <link rel="stylesheet" href="lib/fontawesome590/css/fontawesome.css">

    <style>
        @font-face {
            font-family: "Varela Round";
            src: url("fonts/VarelaRound-Regular.ttf");
        }

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

        select:focus {
            box-shadow: 0 0 2pt 0.5pt teal;
            outline: none;
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
</head>
<body dir="rtl">
    <form id="form1" runat="server">
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
        <div class="w3-container w3-card-4 w3-light-grey w3-text-teal w3-padding w3-margin">
            <h3>
                <asp:Label runat="server" ID="error"></asp:Label></h3>
            <h2 class="w3-center">כניסה לאתר</h2>
            <label><b>שם משתמש:</b></label>
            <asp:TextBox ID="Username" placeholder="example123" runat="server" class="w3-input w3-border w3-round-xxlarge"></asp:TextBox>
            <label><b>סיסמה:</b></label>
            <asp:TextBox ID="Password" placeholder="12345" runat="server" TextMode="Password" class="w3-input w3-border w3-round-xxlarge"></asp:TextBox>
            <b>
                <br />
                <br>
                <asp:Button ID="Submit" runat="server" class="w3-btn w3-block w3-teal w3-round-xxlarge" Text="כניסה" OnClick="Submit_Click" />
            </b>
        </div>
    </form>

</body>
</html>
