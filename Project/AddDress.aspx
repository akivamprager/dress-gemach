<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddDress.aspx.cs" Inherits="AddDress" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Wizard ID="Wizard1" runat="server" ActiveStepIndex="5" OnFinishButtonClick="Wizard1_FinishButtonClick" BackColor="#F7F6F3" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" Height="163px" Width="319px">
            <HeaderStyle BackColor="#5D7B9D" BorderStyle="Solid" Font-Bold="True" Font-Size="0.9em" ForeColor="White" HorizontalAlign="Left" />
            <NavigationButtonStyle BackColor="#FFFBFF" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#284775" />
            <SideBarButtonStyle BorderWidth="0px" Font-Names="Verdana" ForeColor="White" />
            <SideBarStyle BackColor="#7C6F57" BorderWidth="0px" Font-Size="0.9em" VerticalAlign="Top" />
            <StepStyle BorderWidth="0px" ForeColor="#5D7B9D" />
            <WizardSteps>
                <asp:WizardStep ID="WizardStep1" runat="server" Title="Step 1" StepType="Start">
                    size of dress<asp:TextBox ID="Size" runat="server"></asp:TextBox>
                </asp:WizardStep>
                <asp:WizardStep ID="WizardStep2" runat="server" Title="Step 2" StepType="Step">
                    length of dress<asp:TextBox ID="Length" runat="server"></asp:TextBox>
                </asp:WizardStep>
                <asp:WizardStep ID="WizardStep3" runat="server" Title="Step 3" StepType="Step">
                    color of dress<asp:TextBox ID="Color" runat="server"></asp:TextBox>
                </asp:WizardStep>
                <asp:WizardStep ID="WizardStep4" runat="server" Title="Step 4" StepType="Step">
                    style of dress<asp:TextBox ID="Style" runat="server"></asp:TextBox>
                </asp:WizardStep>
                <asp:WizardStep ID="WizardStep5" runat="server" Title="Step 5" StepType="Step">
                    additional info<asp:TextBox ID="Info" runat="server"></asp:TextBox>
                </asp:WizardStep>
                <asp:WizardStep ID="WizardStep6" runat="server" Title="Step 6" StepType="Finish">
                    <asp:FileUpload ID="Image" runat="server"  accept=".png,.jpg,.jpeg,.gif"/>
                </asp:WizardStep>
                <asp:WizardStep runat="server" StepType="Complete" Title="Finished">
                You are done!<br /><a href="AddDress.aspx">Submit another dress</a>
                    <asp:Label ID="Submitted" runat="server" Text="Label"></asp:Label>
                </asp:WizardStep>
            </WizardSteps>
        </asp:Wizard>
    </form>
</body>
</html>
