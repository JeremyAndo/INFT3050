using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Data;

namespace c3315176_Assig1.DataAccessLayer
{
    public class transactionDAL
    {
        public static int createTransaction(
            int transactionNo, string postageAddress, string emailID, string cardNumber, int cardCVC, string itemsPurchased)
        {
            int returnVal = 0;
            //connect to DB
            SqlConnection SqlConn = new SqlConnection("Data Source =.\\sqlexpress; Initial Catalog = C3315176_INFT3050_A1; Integrated Security = True");
            SqlConn.Open();

            try
            {
                DS_TransactionTableAdapters.TransactionTableAdapter transAdapter =
                    new DS_TransactionTableAdapters.TransactionTableAdapter();
                transAdapter.Insert(transactionNo, postageAddress, emailID, cardNumber, cardCVC, itemsPurchased);

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
    }
}