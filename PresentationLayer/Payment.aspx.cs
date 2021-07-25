using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using System.Net.Mail;
using System.Configuration;

namespace c3315176_Assig1.PresentationLayer
{
    public partial class Payment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //force secure connection
            if (!Request.IsSecureConnection)
            {
                string url = ConfigurationManager.AppSettings["SecurePath"] + "Payment";
                Response.Redirect(url);
            }
            //add cart items, or make sure its clear if empty
            if (Session["cart"] != null)
            {
                cartPayment.Items.Clear();
                cartPayment.Items.Add(Session["Cart"].ToString());
            }
            else
                cartPayment.Items.Clear();

        }

        protected void makePayment_Click(object sender, EventArgs e)
        {
            //create random purchase ID - this should normally be incremented from DB
            Random random = new Random();
            int transactionNo = random.Next();
            string postage = street.Text + ", " + city.Text + ", " + state.Text;
            string emailID = Session["UserName"].ToString();
            string cardNo = cardNumber.Text;
            int cvc = Convert.ToInt32(cardCVC.Text);

            if (Page.IsValid == true)
            {
                //create purchase in DB
                int success = BusinessLayer.transactionBAL.createTransaction(
                    transactionNo, postage, emailID, cardNo, cvc, Session["Cart"].ToString());
                if (success == 1)
                {
                    //once purchase is complete, redirect
                    //send email of order confirmation
                    MailMessage forgotMsg = new MailMessage();
                    forgotMsg.From = new MailAddress("support@popventure.com");
                    forgotMsg.To.Add(new MailAddress(Session["UserName"].ToString()));
                    forgotMsg.Subject = "Order Confirmation";
                    forgotMsg.Body = "Thanks for your order: " + transactionNo;

                    SmtpClient smtpClient = new SmtpClient();
                    smtpClient.Send(forgotMsg);


                    Response.Redirect("PaymentConfirm.aspx");
                }
                else
                {
                    MessageBox.Show("Error with purchase");
                }
            }  
                
        }
    }
}