using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace c3315176_Assig1.BusinessLayer
{
    public class transactionBAL
    {
        public static int createTransaction(
            int transactionNo, string postageAddress, string emailID, string cardNumber, int cardCVC, string itemsPurchased)
        {
            int success = 0;
            success = DataAccessLayer.transactionDAL.createTransaction(
                transactionNo, postageAddress, emailID, cardNumber, cardCVC, itemsPurchased);
            return success;
        }
    }
}