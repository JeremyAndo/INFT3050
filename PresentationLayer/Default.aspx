<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/PresentationLayer/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="c3315176_Assig1._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>Pop Vinyl Venture!</h1>
        <p class="lead">The one stop shop for all Funko Pop Vinyls</p>
    </div>
    <!-- display for main page basic website navigation -->
    <div class="row">
        <div class="col-md-4">
            <h2 class="display-2"><a href="Products.aspx">Browse Products</a></h2>
        </div>

        <div class="col-md-4">
            <h2 class="display-2"><a href="About.aspx">Get to know us</a></h2>
        </div>

        <div class="col-md-4">
            <h2 class="display-2"><a href="Contact.aspx">Questions? Contact Us</a></h2>
        </div>



    </div>

</asp:Content>
