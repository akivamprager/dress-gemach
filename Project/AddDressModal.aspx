<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddDressModal.aspx.cs" Inherits="AddDressModal" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <title></title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-black.css">
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
    outline:none;
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
</head>
<body dir="rtl">
    <!-- <h1>הוספת שמלה חדשה לקטלוג</h1>
    <h4>אנא מילאו את פרטי השמלה <i>באנגלית</i> (כרגע... &#128546; )</h4>!-->
    <form id="form1" runat="server">
        <div class="w3-container w3-card-4 w3-light-grey w3-text-teal w3-padding w3-margin">
            <h3><asp:Label runat="server" ID="error"></asp:Label></h3>
            <h2 class="w3-center">הוספת שמלה חדשה</h2>

            <label><b>מידת השמלה:</b></label>

            <asp:TextBox ID="Size" placeholder="" runat="server" class="w3-input w3-border w3-round-xxlarge"></asp:TextBox>

            <label><b>אורך השמלה (ס"מ):</b></label>

            <asp:TextBox ID="Length" runat="server" class="w3-input w3-border w3-round-xxlarge"></asp:TextBox>

            <label><b>צבע דומיננטי בשמלה:</b></label>

            <asp:TextBox ID="Color" runat="server" class="w3-input w3-border w3-round-xxlarge"></asp:TextBox>

            <label><b>עיצוב:</b></label>

            <asp:TextBox ID="Style" type="text" runat="server" class="w3-input w3-border w3-round-xxlarge"></asp:TextBox>

            <label><b>מידע נוסף (הכניסו "none" אם אין מידע נוסף):</b></label>

            <asp:TextBox ID="Info" type="text" runat="server" class="w3-input w3-border w3-round-xxlarge"></asp:TextBox>

            <label><b>תמונת השמלה:</b></label>

            <asp:FileUpload ID="ImageFile" runat="server" CssClass="w3-btn w3-border w3-round-xxlarge" name="image" accept="image/*" />
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Only image files are allowed"
                ControlToValidate="ImageFile" ValidationExpression="^(([a-zA-Z]:)|(\\{2}\w+)\$?)(\\(\w[\w].*))+(.jpg|.JPG|.gif|.GIF|.png|.PNG|.bmp|.BMP)$">
            </asp:RegularExpressionValidator>
            <b><br /><br>
                <asp:Button ID="Submit" runat="server" class="w3-btn w3-block w3-teal w3-round-xxlarge" Text="הוספת השמלה" OnClick="Submit_Click" />
            </b>
        </div>
    </form>

</body>
</html>
