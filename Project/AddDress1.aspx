<%@ Page Title="" Language="C#" MasterPageFile="~/Style.master" AutoEventWireup="true" CodeFile="AddDress1.aspx.cs" Inherits="AddDress1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    הוספת שמלה
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet">
    <style>
        * {
            box-sizing: border-box;
        }

        #regForm {
            background-color: #f1f1f1;
            margin: auto;
            padding: 40px;
            width: 100%;
            min-width: 500px;
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

        /* Hide all steps by default: */
        .tab {
            display: none;
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

        #prevBtn {
            background-color: #bbbbbb;
        }

        /* Make circles that indicate the steps of the form: */
        .step {
            height: 15px;
            width: 15px;
            margin: 0 2px;
            background-color: #bbbbbb;
            border: none;
            border-radius: 50%;
            display: inline-block;
            opacity: 0.5;
        }

            .step.active {
                opacity: 1;
            }

            /* Mark the steps that are finished and valid: */
            .step.finish {
                background-color: #4CAF50;
            }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Title1" runat="Server">
    הוספת שמלה חדשה לקטלוג
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="TextContent1" runat="Server">
    אנא מילאו את פרטי השמלה
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="MainContent" runat="Server">

    <form id="regForm" action="/action_page.php" runat="server">

        <h1 id="h1c">שמלה חדשה:</h1>
        <!-- One "tab" for each step in the form: -->
        <div class="tab" dir="ltr">
            Dress size (SI):
            <p>
                <asp:TextBox ID="Size" runat="server"></asp:TextBox>
            </p>
            Dress length (cm):
            <p>
                <asp:TextBox ID="Length" runat="server"></asp:TextBox>
            </p>
        </div>
        <div class="tab">
            Dominant color:
    <p>
        <asp:TextBox ID="Color" runat="server"></asp:TextBox>
    </p>
            Style:
            <p>
                <asp:TextBox ID="Style" type="text" runat="server"></asp:TextBox>
            </p>
        </div>
        <div class="tab">
            additional info (enter "none" if no info):
    <p>
        <asp:TextBox ID="Info" type="text" runat="server"></asp:TextBox>
    </p>
        </div>
        <div class="tab">
            Picture of dress:
    <p>
        <!-- <input type="image" oninput="this.className = ''" name="image">!-->
        <asp:FileUpload ID="Image" runat="server" name="image" oninput="this.className = ''" accept=".png,.jpg,.jpeg,.gif" />
    </p>
        </div>
        <div style="overflow: auto;">
            <div style="float: right;">
                <button type="button" id="prevBtn" onclick="nextPrev(-1)">Previous</button>
                <button type="button" id="nextBtn" onclick="nextPrev(1)">Next</button>
            </div>
        </div>
        <!-- Circles which indicates the steps of the form: -->
        <div style="text-align: center; margin-top: 40px;">
            <span class="step"></span>
            <span class="step"></span>
            <span class="step"></span>
            <span class="step"></span>
        </div>
    </form>

    <script>
        var currentTab = 0; // Current tab is set to be the first tab (0)
        showTab(currentTab); // Display the current tab

        function showTab(n) {
            // This function will display the specified tab of the form...
            var x = document.getElementsByClassName("tab");
            x[n].style.display = "block";
            //... and fix the Previous/Next buttons:
            if (n == 0) {
                document.getElementById("prevBtn").style.display = "none";
            } else {
                document.getElementById("prevBtn").style.display = "inline";
            }
            if (n == (x.length - 1)) {
                document.getElementById("nextBtn").innerHTML = "Submit";
            } else {
                document.getElementById("nextBtn").innerHTML = "Next";
            }
            //... and run a function that will display the correct step indicator:
            fixStepIndicator(n)
        }

        function nextPrev(n) {
            // This function will figure out which tab to display
            var x = document.getElementsByClassName("tab");
            // Exit the function if any field in the current tab is invalid:
            if (n == 1 && !validateForm()) return false;
            // Hide the current tab:
            x[currentTab].style.display = "none";
            // Increase or decrease the current tab by 1:
            currentTab = currentTab + n;
            // if you have reached the end of the form...
            if (currentTab >= x.length) {
                // ... the form gets submitted:
                document.getElementById("regForm").submit();
                return false;
            }
            // Otherwise, display the correct tab:
            showTab(currentTab);
        }

        function validateForm() {
            // This function deals with validation of the form fields
            var x, y, i, valid = true;
            x = document.getElementsByClassName("tab");
            y = x[currentTab].getElementsByTagName("input");
            // A loop that checks every input field in the current tab:
            for (i = 0; i < y.length; i++) {
                // If a field is empty...
                if (y[i].value == "") {
                    // add an "invalid" class to the field:
                    y[i].className += " invalid";
                    // and set the current valid status to false
                    valid = false;
                }
            }
            // If the valid status is true, mark the step as finished and valid:
            if (valid) {
                document.getElementsByClassName("step")[currentTab].className += " finish";
            }
            return valid; // return the valid status
        }

        function fixStepIndicator(n) {
            // This function removes the "active" class of all steps...
            var i, x = document.getElementsByClassName("step");
            for (i = 0; i < x.length; i++) {
                x[i].className = x[i].className.replace(" active", "");
            }
            //... and adds the "active" class on the current step:
            x[n].className += " active";
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

