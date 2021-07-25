using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace c3315176_Assig1.PresentationLayer
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnRegister_Click(object sender, EventArgs e)
        {
            //was having issues with my validators, so this should be a quick fix for now
            if (txtEmailID.Text == txtEmailConfirm.Text)
            {
                if (Page.IsValid) //this is not working as intended
                {

                    string strEmail = txtEmailID.Text;
                    string strPassword = txtPassword.Text;
                    string strFName = txtFName.Text;
                    string strLName = txtLName.Text;
                    string strDOB = txtDate.Text;

                    //check user not registered already
                    int intReturn = 0;
                    intReturn = BusinessLayer.registerBL.intCheckEmail(strEmail);

                    //0 return allows new account
                    //anything else means the account exists
                    if (intReturn == 0)
                    {
                        //register account
                        int intRegisterSuccess = 0;
                        intRegisterSuccess = BusinessLayer.registerBL.intAddUser(
                            strEmail, strPassword, strFName, strLName, strDOB
                            );

                        if (intRegisterSuccess == 1)
                        {
                            //thanks for registering
                            //send email to address
                            MailMessage forgotMsg = new MailMessage();
                            forgotMsg.From = new MailAddress("support@popventure.com");
                            forgotMsg.To.Add(new MailAddress(txtEmailID.Text));
                            forgotMsg.Subject = "Registered - Pop Vinyl Venture";
                            forgotMsg.Body = "Thanks for registering your account with us";

                            SmtpClient smtpClient = new SmtpClient();
                            smtpClient.Send(forgotMsg);


                            //textbox value is stored in Session  
                            Session["UserName"] = txtEmailID.Text;
                            //cart
                            Session["Cart"] = "";
                            Session["CartTotal"] = "0";

                            //sessionCode
                            Random num = new Random(10000);
                            int randomNumber = num.Next();
                            Session["sessionCode"] = Convert.ToString(randomNumber);

                            //SESSION SUPPOSED TO REDIRECT TO MAIN AND NOT LOG IN IF EMAIL IS NOT VERIFIED

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
                        else //equals 3
                        {
                            //redirect to another page
                            //error writing to database
                            Response.Redirect("ErrorMain");
                        }

                    }
                    else
                    {
                        //reject request
                        Response.Write("<h2>Email is already registered!</h2>");
                    }


                }
            } else
            {
                Page.Validate();
            }
        }
    }
}