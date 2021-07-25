<%@ Page Title="Login" Language="C#" MasterPageFile="~/PresentationLayer/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="c3315176_Assig1.Login" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>Pop Vinyl Venture!</h1>
        <p class="lead">Log in as an existing user.</p>
    </div>

    <div class="row">
        <div class="col-md-4">

        <asp:ValidationSummary ID="ValidationSummary1" HeaderText="Following errors occurred: " runat="server" ValidationGroup="login" ShowMessageBox="True" />

        </div>
    </div>

    <div class="row">
        <div class="col-md-4">
            <p>
                Email<br />
                <asp:TextBox ID="txtEmailID" Width="250px" runat="server"></asp:TextBox>
                <!-- checks email formatting -->
                <asp:RegularExpressionValidator ID="EmailValid" runat="server" ErrorMessage=" *Invalid Email" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txtEmailID" ForeColor="Red"></asp:RegularExpressionValidator>
                <!-- checks email to match DB -->
                <asp:CustomValidator ID="EmailMatchValid" runat="server" OnServerValidate="EmailMatch_ServerValidate" Display="None" ErrorMessage="Email incorrect" ValidationGroup="login" ControlToValidate="txtEmailID" ToolTip="The email entered does not match a registered account."></asp:CustomValidator>
            </p>
            <p>Password<br />
                <asp:TextBox ID="txtPassword" Width="250px" runat="server"></asp:TextBox>
                <!-- checks password to DB -->
                <asp:CustomValidator ID="PasswordMatchValid" runat="server" OnServerValidate="PasswordMatch_ServerValidate" ValidationGroup="login" Display="None" ErrorMessage="Password incorrect" ControlToValidate="txtPassword" ToolTip="The password entered does not match our records."></asp:CustomValidator>
            </p>
            <p>
                <asp:Button ID="BtnLogin" runat="server" Width="100px" Text="Login" OnClick="BtnLogin_Click1" ValidationGroup="login" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnForgotPwd" runat="server" OnClick="btnForgotPwd_Click" Text="Forgot Password?" />
            </p>
        </div>
    </div>
</asp:Content>
