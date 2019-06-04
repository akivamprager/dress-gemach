<%@ Page Title="" Language="C#" MasterPageFile="~/Style.master" AutoEventWireup="true" CodeFile="AddDress2.aspx.cs" Inherits="AddDress2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    הוספת שמלה
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet">
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
    הוספת שמלה חדשה לקטלוג
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="TextContent1" runat="Server">
    אנא מילאו את פרטי השמלה <i>באנגלית</i> (כרגע... &#128546; )
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="MainContent" runat="Server">
    <form id="form1" runat="server">
        <div class="w3-container w3-card-4 w3-light-grey w3-text-teal w3-margin">
            <h2 class="w3-center">הוספת שמלה חדשה</h2>

            <div class="w3-row w3-section">
                <div class="w3-third" style="width: 50px"><i class="w3-xxlarge fa fa-user"></i></div>
                <div class="w3-rest">
                    <asp:TextBox ID="Size" placeholder="מידת השמלה" runat="server" class="w3-input w3-border w3-round"></asp:TextBox>
                </div>
            </div>

            <!--<label><b>מידת השמלה:</b></label>!-->

            <label><b>אורך השמלה (ס"מ):</b></label>

            <asp:TextBox ID="Length" runat="server" class="w3-input w3-border w3-round"></asp:TextBox>

            <label><b>צבע דומיננטי בשמלה:</b></label>

            <asp:TextBox ID="Color" runat="server" class="w3-input w3-border w3-round"></asp:TextBox>

            <label><b>עיצוב:</b></label>

            <asp:TextBox ID="Style" type="text" runat="server" class="w3-input w3-border w3-round"></asp:TextBox>

            <label><b>מידע נוסף (הכניסו "none" אם אין מידע נוסף):</b></label>

            <asp:TextBox ID="Info" type="text" runat="server" class="w3-input w3-border w3-round"></asp:TextBox>

            <label><b>תמונת השמלה:</b></label>

            <asp:FileUpload ID="Image" runat="server" name="image" oninput="this.className = ''" accept=".png,.jpg,.jpeg,.gif" />
            <b>
                <asp:Button ID="Submit" runat="server" class="w3-btn w3-block w3-teal w3-round" Text="הוספת השמלה" OnClick="Submit_Click" />
            </b>
        </div>
    </form>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="Title2" runat="Server">
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="TextContent2" runat="Server">
</asp:Content>
<asp:Content ID="Content8" ContentPlaceHolderID="Title3" runat="Server">
</asp:Content>
<asp:Content ID="Content9" ContentPlaceHolderID="TextContent3" runat="Server">
</asp:Content>

