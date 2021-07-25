<%@ Page Title="" Language="C#" MasterPageFile="~/PresentationLayer/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="c3315176_Assig1.PresentationLayer.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">
        <h1>Pop Vinyl Venture!</h1>
        <p class="lead">Register as a new user.</p>
    </div>

    <!-- OLD CODE - COULD NOT GET SUMMARY WORKING PROPERLY ON THIS PAGE, COMPRISES MADE
    <div class="row">
        <div class="col-md3">
            <asp:ValidationSummary ID="ValidationSummaryRegister" HeaderText="Following errors occurred: " runat="server" ValidationGroup="register" ShowMessageBox="True" />
        </div>
    </div>
    -->

    <div class="row">
        <div class="col-md-5">
            <p>Email<br />
                <asp:TextBox ID="txtEmailID" Width="250px" runat="server"></asp:TextBox>
                <!-- checks email formatting -->
                <asp:RegularExpressionValidator ID="validEmail" runat="server" ErrorMessage=" *Invalid Email" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txtEmailID" ForeColor="Red" ValidationGroup="register"></asp:RegularExpressionValidator>
                
                    <asp:RequiredFieldValidator ID="RequireEmail" runat="server" ControlToValidate="txtEmailID" ForeColor="Red">*Required</asp:RequiredFieldValidator>
            </p>
            <p>Confirm Email<br />
                
                <asp:TextBox ID="txtEmailConfirm" Width="250px" runat="server"></asp:TextBox> 
                <!-- ensures email matches first entry-->
                <asp:CompareValidator ID="compareEmail" runat="server" ErrorMessage=" *Email must match" ControlToCompare="txtEmailID" ControlToValidate="txtEmailConfirm" Operator="Equal" ForeColor="Red" ValidationGroup="register" ValueToCompare="txtEmailID"></asp:CompareValidator> 
                
                <asp:RequiredFieldValidator ID="RequireEmailConfirm" runat="server" ControlToValidate="txtEmailConfirm" ForeColor="Red">*Required</asp:RequiredFieldValidator>
            </p>
            <p>
            Date of Birth<br />
                <asp:TextBox ID="txtDate" Width="250px" runat="server"></asp:TextBox>
                <!-- CODE BORROWED FROM: https://stackoverflow.com/questions/3641594/date-of-birth-validation/3641650 -->
                <!-- checks valid date -->
                <asp:RangeValidator ID="validDate" runat="server" ControlToValidate="txtDate" MinimumValue="31/12/1900" MaximumValue="1/1/2100" Type="Date" text="*Invalid Date" ForeColor="Red" ValidationGroup="register"/>
                <asp:RequiredFieldValidator ID="RequireDate" runat="server" ControlToValidate="txtDate" ForeColor="Red">*Required</asp:RequiredFieldValidator>
            </p>
        </div>
            

        <div class="col-md-5">
            <p>First Name<br />
                <asp:TextBox ID="txtFName" Width="250px" runat="server"></asp:TextBox>
                
                <asp:RequiredFieldValidator ID="RequireFName" runat="server" ControlToValidate="txtFName" ForeColor="Red">*Required</asp:RequiredFieldValidator>
                
            </p>
            <p>Last Name<br />
                <asp:TextBox ID="txtLName" Width="250px" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequireLName" runat="server" ControlToValidate="txtLName" ForeColor="Red">*Required</asp:RequiredFieldValidator>
            </p>
            <p>Password<br />
                <asp:TextBox ID="txtPassword" Width="250px" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequirePassword" runat="server" ControlToValidate="txtPassword" ForeColor="Red">*Required</asp:RequiredFieldValidator>
                <!-- check password meets set criteria -->
                <!-- ADD CODE IF ENOUGH TIME -->
            
            </p>
            
        </div>
        
    </div>

    <div class="row">
        <div class="col-md-1">
            <br />
            <asp:Button ID="BtnRegister" runat="server" Width="100px" Text="Register" OnClick="BtnRegister_Click" />
        </div>
    </div>

        

</asp:Content>
