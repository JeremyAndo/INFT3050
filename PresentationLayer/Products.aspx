<%@ Page Title="" Language="C#" MasterPageFile="~/PresentationLayer/Site.Master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="c3315176_Assig1.PresentationLayer.Products" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">
        <h1>Pop Vinyl Venture!</h1>
        <p class="lead">The one stop shop for all Funko Pop Vinyls</p>
    </div>



    <div class="row">
        <h1>Products</h1><br />
        <div class="col-md-3">
            <h4>Series:</h4>
            <asp:DropDownList ID="DropDownList1" runat="server" DataTextField="series" DataValueField="series" AutoPostBack="True" DataSourceID="productSeriesDS">
            </asp:DropDownList>
            <asp:SqlDataSource ID="productSeriesDS" runat="server" ConnectionString="<%$ ConnectionStrings:C3315176_INFT3050_A1ConnectionString %>" SelectCommand="SELECT DISTINCT [series] FROM [Product]"></asp:SqlDataSource>
        </div>
        <div class="col-md-3">
            <h4>Character:</h4>
            <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" DataSourceID="productCharacterDS" DataTextField="character" DataValueField="character">
            </asp:DropDownList>
            <asp:SqlDataSource ID="productCharacterDS" runat="server" ConnectionString="<%$ ConnectionStrings:C3315176_INFT3050_A1ConnectionString %>" SelectCommand="SELECT DISTINCT [character] FROM [Product] WHERE ([series] = @series)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="series" PropertyName="SelectedValue" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
        <div class="col-md-3">
            <h4>Outfit:</h4>
            <asp:DropDownList ID="DropDownList3" runat="server" AutoPostBack="True" DataSourceID="productOutfitDS" DataTextField="outfit" DataValueField="outfit">
                </asp:DropDownList>
            <asp:SqlDataSource ID="productOutfitDS" runat="server" ConnectionString="<%$ ConnectionStrings:C3315176_INFT3050_A1ConnectionString %>" SelectCommand="SELECT DISTINCT [outfit] FROM [Product] WHERE (([character] = @character) AND ([series] = @series))">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList2" Name="character" PropertyName="SelectedValue" Type="String" />
                    <asp:ControlParameter ControlID="DropDownList1" Name="series" PropertyName="SelectedValue" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
        
    </div>


    <div class="row">
        <div class="col-md-3">
            <!-- IMAGE HERE -->
            <!-- wanted to determine image to displayed based on current product selection
                would need to retrieve from DB using layers, add if time permits
                -->

        </div>
        <div class="col-md-3">
            <br />
            <br />
            <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="125px" AutoGenerateRows="False" DataKeyNames="itemCode" DataSourceID="productDetailsDS">
                <Fields>
                    <asp:BoundField DataField="itemCode" HeaderText="itemCode" ReadOnly="True" SortExpression="itemCode" />
                    <asp:BoundField DataField="character" HeaderText="character" SortExpression="character" />
                    <asp:BoundField DataField="outfit" HeaderText="outfit" SortExpression="outfit" />
                    <asp:BoundField DataField="series" HeaderText="series" SortExpression="series" />
                    <asp:BoundField DataField="stock" HeaderText="stock" SortExpression="stock" />
                    <asp:BoundField DataField="available" HeaderText="available" SortExpression="available" />
                    <asp:BoundField DataField="description" HeaderText="description" SortExpression="description" />
                </Fields>
            </asp:DetailsView>


            <asp:SqlDataSource ID="productDetailsDS" runat="server" ConnectionString="<%$ ConnectionStrings:C3315176_INFT3050_A1ConnectionString %>" SelectCommand="SELECT DISTINCT [itemCode], [character], [outfit], [series], [stock], [available], [description] FROM [Product] WHERE (([series] = @series) AND ([character] = @character) AND ([outfit] = @outfit))">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="series" PropertyName="SelectedValue" Type="String" />
                    <asp:ControlParameter ControlID="DropDownList2" Name="character" PropertyName="SelectedValue" Type="String" />
                    <asp:ControlParameter ControlID="DropDownList3" Name="outfit" PropertyName="SelectedValue" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>


        </div>
        <div class="col-md-3">

            <h3>Price: $20</h3>

        </div>
    </div>

    <div class="row">
        <div class="col-md-1">
            <!-- add to cart will add the appropriately display item to cart -->
            <asp:Button ID="btnAddToCart" runat="server" Text="Add to Cart" OnClick="btnAddToCart_Click" />
            <br />

        </div>
    </div>


</asp:Content>



