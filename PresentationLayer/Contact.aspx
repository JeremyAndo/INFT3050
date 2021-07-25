<%@ Page Title="Contact" Language="C#" MasterPageFile="~/PresentationLayer/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="c3315176_Assig1.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
     <div class="jumbotron">
        <h1>Pop Vinyl Venture!</h1>
        <p class="lead">The one stop shop for all Funko Pop Vinyls</p>
    </div>
    <h2><%: Title %> - Pop Vinyl Venture!</h2>
    <p>Please feel free to get in touch with any queries you may have.</p>

    <address>
        130 University Drive<br />
        Callaghan, NSW 2308<br />
        <abbr title="Phone">P: 4555 5555</abbr>
        
    </address>

    <address>
        <strong>Support:</strong><a href="mailto:Support@popventure.com">Support@popventure.com</a><br />
        <strong>Marketing:</strong><a href="mailto:Marketing@popventyre.com">Marketing@popventure.com</a>
    </address>
</asp:Content>
