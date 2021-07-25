using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;

namespace c3315176_Assig1.DataAccessLayer
{
    public class loginDAL
    {
        public static int intCheckLogin(string strEmail, string strPwd)
        {

            //connect to DB
            SqlConnection SqlConn = new SqlConnection("Data Source =.\\sqlexpress; Initial Catalog = C3315176_INFT3050_A1; Integrated Security = True");
            SqlConn.Open();
            int returnVal = 0;

            try
            {
                DS_UserTableAdapters.UserTableAdapter userTableAdapter =
                    new DS_UserTableAdapters.UserTableAdapter();

                //both email and pwd match
                if (userTableAdapter.checkUserLogin(strEmail, strPwd) == 1)
                {
                    returnVal = 2;
                }
                //only email 
                else if (userTableAdapter.checkUserEmail(strEmail) == 1)
                {
                    returnVal = 1;
                }
                //invalid login
                else
                {
                    returnVal = 0;
                }

            }
            catch
            {
                returnVal = 3;
            }
            finally
            {
                SqlConn.Close();
                
            }
            return returnVal;
        }
    }
}