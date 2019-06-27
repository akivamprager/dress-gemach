<%@ Page Title="" Language="C#" MasterPageFile="~/Style.master" AutoEventWireup="true" CodeFile="wsTest.aspx.cs" Inherits="wsTest" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    הזמנה חיצונית
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Title1" runat="Server">
    הזמנת שמלות מחנות השמלות
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="TextContent1" runat="Server">
    <h3>סקירת השמלות בחנות</h3>
    <asp:HyperLink runat="server" CssClass="w3-btn w3-teal" NavigateUrl="wsLatestDresses.aspx">צפייה בשמלות מהחודש האחרון</asp:HyperLink>
    <asp:HyperLink runat="server" CssClass="w3-btn w3-teal" NavigateUrl="wsLatestDressesByStyle.aspx">צפייה בשמלות לפי עיצוב</asp:HyperLink>
    
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:Label runat="server" ID="l1"></asp:Label>
    <div class="w3-container w3-card-4 w3-light-grey w3-text-teal w3-padding w3-margin">
        <h2 class="w3-center">הזמנת השמלות</h2>

        <label><b>קוד השמלה:</b></label>
        <asp:TextBox ID="dress_id" placeholder="" TextMode="Number" runat="server" class="w3-input w3-border w3-round-xxlarge"></asp:TextBox>

        <label><b>כמות להזמנה:</b></label>

        <asp:TextBox ID="quantity" TextMode="Number" runat="server" class="w3-input w3-border w3-round-xxlarge"></asp:TextBox>
        <label><b>שם מזמין:</b></label>
        <br />
        <asp:TextBox ID="name" runat="server" class="w3-input w3-border w3-round-xxlarge"></asp:TextBox>
        <asp:Button ID="Submit" runat="server" class="w3-btn w3-block w3-teal w3-round-xxlarge" Text="הזמנה" OnClick="Submit_Click" />
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

