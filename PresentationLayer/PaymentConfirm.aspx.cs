using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace c3315176_Assig1.PresentationLayer
{
    public partial class PaymentConfirm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            

            //load cart details to labels
            lblAmountPaid.Text = "$" + Session["CartTotal"].ToString();
            lblProductsPurchased.Text = Session["Cart"].ToString();

            //clear cart and total
            Session["Cart"] = "";
            Session["CartTotal"] = "0";
            BusinessLayer.cartBL.clearCart(Session["SessionCode"].ToString());
            
        }
    }
}