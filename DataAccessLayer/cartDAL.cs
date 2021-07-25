using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Windows.Forms;

namespace c3315176_Assig1.DataAccessLayer
{
    public class cartDAL
    {
        public static int createCart(string sessionID, string emailID)
        {
            int returnVal = 0;
            //connect to DB
            SqlConnection SqlConn = new SqlConnection("Data Source =.\\sqlexpress; Initial Catalog = C3315176_INFT3050_A1; Integrated Security = True");
            SqlConn.Open();

            try
            {
                
                DS_CartTableAdapters.CartTableAdapter cartTableAdapter =
                    new DS_CartTableAdapters.CartTableAdapter();
                cartTableAdapter.InsertCart(sessionID, emailID, null, 0);
                returnVal = 1;

            }
            catch
            {
                returnVal = 0;
            }
            finally
            {
                SqlConn.Close();
            }
            return returnVal;
        }

        public static int addToCart(string cart, double cost, string sessionID)
        {
            int returnVal = 0;
            //connect to DB
            SqlConnection SqlConn = new SqlConnection("Data Source =.\\sqlexpress; Initial Catalog = C3315176_INFT3050_A1; Integrated Security = True");
            SqlConn.Open();

            try
            {

                DS_CartTableAdapters.CartTableAdapter cartTableAdapter =
                    new DS_CartTableAdapters.CartTableAdapter();
                //DS_Cart.CartDataTable carts = cartTableAdapter.GetData();


                cartTableAdapter.UpdateItems(cart, sessionID);
                cartTableAdapter.UpdateCartTotal((float)cost, sessionID);





                /**
                foreach (DS_Cart.CartRow cart in carts.)
                {
                    //found match in
                    if (cart.sessionID == sessionID)
                    {
                        //if empty, just add
                        if (cart.itemsInCart == null)
                        {
                            
                            cart.itemsInCart = cartItem;
                        }
                        //if already containing items, add
                        else
                        {
                            cart.itemsInCart += " \n " + cartItem;
                        }
                    }
                }
                cartTableAdapter.Update(carts);
                */

                returnVal = 1;

            }
            catch
            {
                returnVal = 0;
            }
            finally
            {
                SqlConn.Close();
            }

            return returnVal;

        }

        public static int clearCart(string sessionCode)
        {
            int returnVal = 0;
            //connect to DB
            SqlConnection SqlConn = new SqlConnection("Data Source =.\\sqlexpress; Initial Catalog = C3315176_INFT3050_A1; Integrated Security = True");
            SqlConn.Open();

            try
            {
                DS_CartTableAdapters.CartTableAdapter cartTableAdapter =
                    new DS_CartTableAdapters.CartTableAdapter();
                cartTableAdapter.UpdateItems(null, sessionCode);
                cartTableAdapter.UpdateCartTotal((float)0, sessionCode);

                returnVal = 1;
            }
            catch
            {
                returnVal = 0;
            }
            finally
            {
                SqlConn.Close();
            }
            return returnVal;
        }



        /** TRIED TO USE THIS CODE FOR CART, THEN REALISED STATIC METHODS
         * CAN'T BE CALLED TO CODE BEHIND
        //constructor
        public cartDAL()
        {
            for (int i = 0; i < 20; i++)
            {
                cartProducts[i] = null;
            }
            cartTotal = 0;
        }

        public addToCart(string cartItem, double cost)
        {
            for (int i = 0; i < 20; i++)
            {
                if (cartProducts[i] == null)
                {
                    cartProducts[i] = cartItem;
                }
            }

            cost += cartTotal;
        }

        public void removeAllFromCart()
        {
            for (int i=0; i<20; i++)
            {
                cartProducts[i] = null;
            }
            cartTotal = 0;
        }

        public string listCartItems()
        {
            string cartItems = "";
            for (int i=0; i<20; i++)
            {
                cartItems += cartProducts[i] + " \n";
            }
            return cartItems;
        }

        public double getCartTotal()
        {
            return cartTotal;
        }

        //implementing the option to remove individual items from cart 
        //was taking too much time

        private string[] cartProducts = new string[20];
        private int cartTotal = 0;


        */

    }



}