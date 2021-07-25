<%@ Page Title="" Language="C#" MasterPageFile="~/PresentationLayer/Site.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="c3315176_Assig1.PresentationLayer.Cart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>Pop Vinyl Venture!</h1>
        <p class="lead">Items in Cart</p>
    </div>

    <div class="row">
        <div class="col-md-4">
            <!-- cart contents here-->
            <asp:SqlDataSource ID="CartItemsDS" runat="server" ConnectionString="<%$ ConnectionStrings:C3315176_INFT3050_A1ConnectionString %>" SelectCommand="SELECT [itemsInCart] FROM [Cart] WHERE ([sessionID] = @sessionID)">
                <SelectParameters>
                    <asp:SessionParameter Name="sessionID" SessionField="sessionCode" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:ListBox ID="cartCheckout" 
                runat="server"
                rows="8"
                width="300px" ValidationGroup="cartItems" DataSourceID="CartItemsDS" DataTextField="itemsInCart" DataValueField="itemsInCart" ViewStateMode="Enabled">
            </asp:ListBox>
            <br />
        </div>
        <div class="col-md-4">
            <!-- removing from cart -->
            <br />
            <asp:Label ID="lblCost" runat="server" Text=""></asp:Label>
            <br />
            <br />
            <asp:Button ID="RemoveFromCart" runat="server" OnClick="RemoveFromCart_Click" Text="Remove All" />
            <br />
            <br />
            <asp:Button ID="ContinueShopping" runat="server" Text="Continue Shopping" OnClick="ContinueShopping_Click"/>

        </div>
    </div>
    <div class="row">
        <div class="col-md-2">
            <!-- check out button -->
            <asp:Button ID="btnCheckout" runat="server" Text="Check Out" OnClick="Checkout_Click" ValidationGroup="cartItems" />
            <asp:CustomValidator ID="CartEmptyValid" ControlToValidate="cartCheckout" OnServerValidate="CartEmptyValid_ServerValidate" runat="server" ForeColor="Red" ValidateEmptyText="True" ValidationGroup="cartItems">&nbsp; *Cart must contain items to check out!</asp:CustomValidator>

        </div>
    </div>

</asp:Content>
