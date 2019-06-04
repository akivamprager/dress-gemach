<%@ Page Title="" Language="C#" MasterPageFile="~/Style.master" AutoEventWireup="true" CodeFile="Default2.aspx.cs" Inherits="Default2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Hi!
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Title1" runat="Server">
    זה הדף הראשון שלי
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="TextContent1" runat="Server">
   output= <% =annotationtext%>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="Title2" runat="Server">
    שלום לכם!
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="TextContent2" runat="Server">
    .גכלכגך כעךלכעחע כחע עכלעכעכ  ח עעךכלחןחרןר  ארןארוןםרםן קקר רקםןרק רןרק  חגכ בההבמהכמככגכגד
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="Title3" runat="Server">
    מה נשמע?
</asp:Content>
<asp:Content ID="Content8" ContentPlaceHolderID="TextContent3" runat="Server">
    הכע, כע כעכגךגלכע, כעכעכג, געעככע עעכעכעע עעככעע געכגכ.
</asp:Content>
<asp:Content ID="Content9" ContentPlaceHolderID="MainContent" runat="Server">
    <table class="w3-table w3-striped w3-bordered w3-border w3-hoverable w3-responsive">
    <thead>
      <tr class="w3-light-grey">
        <th>First Name</th>
        <th>Last Name</th>
        <th>Points</th>
      </tr>
    </thead>
    <tr>
      <td>Jill</td>
      <td>Smith</td>
      <td>50</td>
    </tr>
    <tr>
      <td>Eve</td>
      <td>Jackson</td>
      <td>94</td>
    </tr>
    <tr>
      <td>Adam</td>
      <td>Johnson</td>
      <td>67</td>
    </tr>
  </table>
</asp:Content>
