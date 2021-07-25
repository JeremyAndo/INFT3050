<%@ Page Title="" Language="C#" MasterPageFile="~/PresentationLayer/Site.Master" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" Inherits="c3315176_Assig1.PresentationLayer.Payment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">
        <h1>Pop Vinyl Venture!</h1>
        <p class="lead">Purchase Items</p>
    </div>

    <div class="row">
        <!-- Contents of cart are displayed here-->
        
        <div class="col-md-3">

            <h2>Cart Details</h2>
            <asp:ListBox ID="cartPayment" 
                runat="server"
                rows="8"
                width="300px"
                >
            </asp:ListBox>

            <br />
            <h2>Total Cost</h2>
            <asp:ListBox ID="ListBox1" runat="server" DataSourceID="CartTotalDS" DataTextField="cartTotal" DataValueField="cartTotal" Height="26px" Width="130px"></asp:ListBox>
            <asp:SqlDataSource ID="CartTotalDS" runat="server" ConnectionString="<%$ ConnectionStrings:C3315176_INFT3050_A1ConnectionString %>" SelectCommand="SELECT [cartTotal] FROM [Cart] WHERE ([sessionID] = @sessionID)">
                <SelectParameters>
                    <asp:SessionParameter Name="sessionID" SessionField="sessionCode" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>

        </div>

        
        <div class="col-md-4">
            <!-- Shipping details here -->
            <br />
            <h2>Shipping Details</h2> <br />
            Street Address <br />
            <asp:TextBox ID="street" runat="server" Width="200px"></asp:TextBox>
            
            <asp:RequiredFieldValidator ID="streetValid" runat="server" ControlToValidate="street" ForeColor="Red">&nbsp; *Required</asp:RequiredFieldValidator>
            
            <br />

            <br />
            City <br />
            <asp:TextBox ID="city" runat="server"></asp:TextBox>
            
            <asp:RequiredFieldValidator ID="cityValid" runat="server" ControlToValidate="city" ForeColor="Red">&nbsp; *Required</asp:RequiredFieldValidator>
            
            <br />

            <br />
            State <br />
            <asp:TextBox ID="state" runat="server"></asp:TextBox>
            
            <asp:RequiredFieldValidator ID="stateValid" runat="server" ControlToValidate="state" ForeColor="Red">&nbsp; *Required</asp:RequiredFieldValidator>
            
            <br />

        </div>
        <div class="col-md-4">
            <!-- Payment details here -->
            <br />
            <h2>Card Details</h2>
            <br />
            Card Number <br />
            <asp:TextBox ID="cardNumber" runat="server" Width="200px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="requireCard" runat="server" ControlToValidate="cardNumber" ForeColor="Red">&nbsp; *Required</asp:RequiredFieldValidator>
            <br />

            <asp:RegularExpressionValidator ID="cardValid" 
                runat="server"
                ControlToValidate="cardNumber"
                ForeColor="Red"
                ValidationExpression="\d{16}">
                &nbsp; *Invalid Card

            </asp:RegularExpressionValidator>

            <br />
            CVC <br />
            <asp:TextBox ID="cardCVC" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="requireCVC" runat="server" ControlToValidate="cardCVC" ForeColor="Red">&nbsp; *Required</asp:RequiredFieldValidator>
            <br />
            <asp:RegularExpressionValidator ID="cardCVCValid" 
                runat="server" 
                ControlToValidate="cardCVC"
                ForeColor="Red"  
                ValidationExpression="\d{3}"
                
                >&nbsp; *Invalid CVC
            </asp:RegularExpressionValidator>
            <br />
            <asp:Button ID="makePayment" runat="server" Text="Pay Now" OnClick="makePayment_Click"/>

        </div>
    </div>

</asp:Content>
