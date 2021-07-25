<%@ Page Title="" Language="C#" MasterPageFile="~/PresentationLayer/Site.Master" AutoEventWireup="true" CodeBehind="PaymentConfirm.aspx.cs" Inherits="c3315176_Assig1.PresentationLayer.PaymentConfirm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">
        <h1>Pop Vinyl Venture!</h1>
        <p class="lead">Order Confirmed</p>
    </div>
    <div class="row">
        <h3>We will be in touch shortly via Email with your full order confirmation.</h3>
        <p>&nbsp; Amount Paid: 
            <asp:Label ID="lblAmountPaid" runat="server"></asp:Label>
           </p>
        <p>&nbsp; Products Purchased: <asp:Label ID="lblProductsPurchased" runat="server"></asp:Label>
        </p>
    </div>

</asp:Content>
