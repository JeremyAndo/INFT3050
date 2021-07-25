<%@ Page Title="" Language="C#" MasterPageFile="~/PresentationLayer/Site.Master" AutoEventWireup="true" CodeBehind="AdminItems.aspx.cs" Inherits="c3315176_Assig1.PresentationLayer.AdminItems" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br /> 
    <!-- THIS IS FOR THE ADMIN TO EDIT THE THE ITEMS IN THE PRODUCTS SECTION-->
    <!-- planned to add option to edit and access this admin section but time ran out -->
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" DataKeyNames="itemCode" DataSourceID="SqlDataSource1" ForeColor="Black">
                <Columns>
                    <asp:BoundField DataField="itemCode" HeaderText="itemCode" ReadOnly="True" SortExpression="itemCode" />
                    <asp:BoundField DataField="character" HeaderText="character" SortExpression="character" />
                    <asp:BoundField DataField="outfit" HeaderText="outfit" SortExpression="outfit" />
                    <asp:BoundField DataField="series" HeaderText="series" SortExpression="series" />
                    <asp:BoundField DataField="available" HeaderText="available" SortExpression="available" />
                    <asp:BoundField DataField="stock" HeaderText="stock" SortExpression="stock" />
                    <asp:BoundField DataField="description" HeaderText="description" SortExpression="description" />
                </Columns>
                <FooterStyle BackColor="#CCCCCC" />
                <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                <RowStyle BackColor="White" />
                <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="Gray" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#383838" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:C3315176_INFT3050_A1ConnectionString %>" SelectCommand="SELECT * FROM [Product] WHERE ([series] = @series)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="series" PropertyName="SelectedValue" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
</asp:Content>
