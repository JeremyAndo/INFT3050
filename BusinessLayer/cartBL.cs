using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace c3315176_Assig1.BusinessLayer
{
    public class cartBL
    {
        public static int createCart(string sessionID, string emailID)
        {
            int returnVal = 0;
            returnVal = DataAccessLayer.cartDAL.createCart(sessionID, emailID);
            return returnVal;
        }

        public static int addToCart(string cart, double cost, string sessionID)
        {
            int returnVal = 0;
            returnVal = DataAccessLayer.cartDAL.addToCart(cart, cost, sessionID);
            return returnVal;
        }

        public static int clearCart(string sessionCode)
        {
            int returnVal = 0;
            returnVal = DataAccessLayer.cartDAL.clearCart(sessionCode);
            return returnVal;
        }
    }
}