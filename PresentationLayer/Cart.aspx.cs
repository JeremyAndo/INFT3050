using System;
using System.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace c3315176_Assig1.PresentationLayer
{
    public partial class Cart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //force secure connection
            if (!Request.IsSecureConnection) {
                string url = ConfigurationManager.AppSettings["SecurePath"] + "Cart";
                Response.Redirect(url);
            }
            //If the person is not logged in, force them to log in before access cart

            if (Session["UserName"] == null)
                Response.Redirect("Login.aspx");
            lblCost.Text = "Cost: $" + Session["CartTotal"].ToString();
        }

        protected void RemoveFromCart_Click(object sender, EventArgs e)
        {
            //clear all out items and price
            cartCheckout.Items.Clear();
            Session["CartTotal"] = "0";
            Session["Cart"] = "";
            //clear price and items from DB
            int clearCart = BusinessLayer.cartBL.clearCart(Session["sessionCode"].ToString());
            if (clearCart == 0) //did not work
            {
                Response.Redirect("ErrorMain");
            } 
            else
            {
                MessageBox.Show("Cart Cleared of all items");
            }
        }

        protected void ContinueShopping_Click(object sender, EventArgs e)
        {
            Response.Redirect("Products.aspx");
        }

        protected void Checkout_Click(object sender, EventArgs e)
        {
            if (Page.IsValid == true)
                Response.Redirect("Payment.aspx");
        }

        protected void CartEmptyValid_ServerValidate(object source, ServerValidateEventArgs args)
        {
            //if (cartCheckout.Items.Count == 0)
            if (Session["cart"].Equals(""))
                args.IsValid = false;
            else
                args.IsValid = true;
        }

    }
}