<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddDressModal.aspx.cs" Inherits="AddDressModal" %>

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
            function RefreshParent() {
                parent.document.getElementById('add_dress_modal').style.display = 'none';
                parent.document.getElementById('alert').className += " w3-green";
                parent.document.getElementById("alert").style.display = 'inline-block';
                parent.document.getElementById("alert_content").innerHTML = 'השמלה נוספה בהצלחה.';
            }
        </script>
        <div class="w3-container w3-card-4 w3-light-grey w3-text-teal w3-padding w3-margin">
            <h3>
                <asp:Label runat="server" ID="error"></asp:Label></h3>
            <h2 class="w3-center">הוספת שמלה חדשה</h2>

            <label><b>מידת השמלה:</b></label>

            <asp:TextBox ID="Size" placeholder="" runat="server" class="w3-input w3-border w3-round-xxlarge"></asp:TextBox>

            <label><b>אורך השמלה (ס"מ):</b></label>

            <asp:TextBox ID="Length" runat="server" class="w3-input w3-border w3-round-xxlarge"></asp:TextBox>

            <label><b>צבע דומיננטי בשמלה:</b></label>
            <br />
            <asp:DropDownList CssClass="w3-select w3-border w3-padding w3-round-xxlarge" ID="DropDownColor" runat="server" DataSourceID="colorSDC" DataTextField="color_name" DataValueField="id_color">
            </asp:DropDownList>
            <asp:SqlDataSource runat="server" ID="colorSDC" ConnectionString="Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\GemachDB.mdf;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [Color]"></asp:SqlDataSource>
            <br />
            <label><b>עיצוב:</b></label>
            <br />
            <asp:DropDownList ID="DropDownStyle" CssClass="w3-select w3-border w3-padding w3-round-xxlarge" runat="server" DataSourceID="styleSDC" DataTextField="style_name" DataValueField="id_style">
            </asp:DropDownList>
            <asp:SqlDataSource runat="server" ID="styleSDC" ConnectionString="Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\GemachDB.mdf;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [Style]"></asp:SqlDataSource>
            <br />
            <label><b>מידע נוסף (הכניסו "none" אם אין מידע נוסף):</b></label>

            <asp:TextBox ID="Info" type="text" runat="server" class="w3-input w3-border w3-round-xxlarge"></asp:TextBox>

            <label><b>תמונת השמלה:</b></label>

            <asp:FileUpload ID="ImageFile" runat="server" CssClass="w3-btn w3-border w3-round-xxlarge" name="image" accept="image/*" />
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Only image files are allowed"
                ControlToValidate="ImageFile" ValidationExpression="^(([a-zA-Z]:)|(\\{2}\w+)\$?)(\\(\w[\w].*))+(.jpg|.JPG|.gif|.GIF|.png|.PNG|.bmp|.BMP)$">
            </asp:RegularExpressionValidator>
            <b>
                <br />
                <br>
                <asp:Button ID="Submit" runat="server" class="w3-btn w3-block w3-teal w3-round-xxlarge" Text="הוספת השמלה" OnClick="Submit_Click" />
            </b>
        </div>
    </form>

</body>
</html>
