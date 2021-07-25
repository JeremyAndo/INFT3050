using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace c3315176_Assig1.PresentationLayer
{
    public partial class Products : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAddToCart_Click(object sender, EventArgs e)
        {
            string strCharacter = DropDownList2.Text;
            string strOutfit = DropDownList3.Text;
            
            
            string strProduct = strCharacter + ": " + strOutfit;
            //if user is not logged in, redirect to log in screen
            if (Session["UserName"] == null)
                Response.Redirect("Login");
            string strSessionID = Session["sessionCode"].ToString();
            

            int addSuccess = 0;

            //add to cart total session object
            //all pop vinyls on website cost $20
            int newTotal = Convert.ToInt32(Session["CartTotal"]) + 20;
            Session["CartTotal"] = newTotal.ToString();

            //add to cart session object
            //---- \n was used to try produce new lines for cart items in list box
            // did not work
            Session["Cart"] += strProduct + " \n";
            //update DB database
            addSuccess = BusinessLayer.cartBL.addToCart(Session["Cart"].ToString(), newTotal, Session["sessionCode"].ToString());

            


            if (addSuccess == 0)
            {
                
                Response.Redirect("ErrorMain");
            } else
            {
                MessageBox.Show("Added to Cart");
            }

        }
    }
}