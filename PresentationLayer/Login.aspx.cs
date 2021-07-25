using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;


namespace c3315176_Assig1
{
    public partial class Login : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }



        protected void BtnLogin_Click1(object sender, EventArgs e)
        {
            string strEmail = txtEmailID.Text;
            string strPwd = txtPassword.Text;

            int intReturn = BusinessLayer.loginBL.intCheckLogin(strEmail, strPwd);

            if (intReturn == 2)
            {
                
                //textbox value is stored in Session  
                Session["UserName"] = txtEmailID.Text;
                //cart
                Session["Cart"] = "";
                Session["CartTotal"] = "0";

                //sessionCode
                //user can't log in twice, sessioncode does not change
                Random num = new Random();
                int randomNumber = num.Next();
                Session["sessionCode"] = Convert.ToString(randomNumber);

                //create cart
                int cartCreation = 0;
                cartCreation = BusinessLayer.cartBL.createCart(Session["sessionCode"].ToString(), strEmail);
                //if error was made creating cart, an error will redirect you
                if (cartCreation == 0)
                {

                    Response.Redirect("ErrorMain");
                               
                }
                else
                {

                    //log in success
                    Response.Redirect("Default");
                }
            }
            else if (intReturn == 1)
            {
                //set server validates here
                EmailMatchValid.IsValid = true;
                PasswordMatchValid.IsValid = false;
            }
            else if (intReturn == 3)
            {
                //Critical error
                Response.Redirect("ErrorMain");
                Response.Write("DBE01");
            }
            else
            {
                EmailMatchValid.IsValid = false;
            }


            /** OLD CODE
            //check email is right
            if (txtEmailID.Text == userEmail)
            {
                //check password is right
                if (txtPassword.Text == userPwd)
                {
                    //all checks out
                    //textbox value is stored in Session  
                    Session["UserName"] = txtEmailID.Text;

                    //create session cart
                    Session["Cart"] = "";

                    //log in success
                    Response.Redirect("Default.aspx");

                }
            }
            */

        }

        protected void PasswordMatch_ServerValidate(object source, ServerValidateEventArgs args)
        {

        }

        protected void EmailMatch_ServerValidate(object source, ServerValidateEventArgs args)
        {

        }

        protected void btnForgotPwd_Click(object sender, EventArgs e)
        {
            EmailValid.Validate();
            if (EmailValid.IsValid == true && txtEmailID.Text != "")
            {
                //send email to address
                MailMessage forgotMsg = new MailMessage();
                forgotMsg.From = new MailAddress("support@popventure.com");
                forgotMsg.To.Add(new MailAddress(txtEmailID.Text));
                forgotMsg.Subject = "Forgotten Password - Pop Vinyl Venture";
                forgotMsg.Body = "Cannot reset your password at this time, please create a new account!" +
                    " We apologise for any inconvenience.";

                SmtpClient smtpClient = new SmtpClient();
                smtpClient.Send(forgotMsg);

                Response.Write("Email sent!");
            } else
            {
                Response.Write("Enter your email!");
            }

        }
    }

}