using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;

namespace c3315176_Assig1.DataAccessLayer
{
	public class registerDAL
	{
		public static int intCheckEmail(string strEmailID)
		{
			//connect to DB
			SqlConnection SqlConn = new SqlConnection("Data Source =.\\sqlexpress; Initial Catalog = C3315176_INFT3050_A1; Integrated Security = True");
			SqlConn.Open();
			int returnVal = 0;

			try
			{
				DS_UserTableAdapters.UserTableAdapter userTableAdapter =
					new DS_UserTableAdapters.UserTableAdapter();

				//check if email exists in system
				if (userTableAdapter.checkUserEmail(strEmailID) == 0)
                {
					//can create new user
					returnVal = 0;
                }
				else
                {
					//user already exists
					returnVal = 1;
                }

			}
			catch
			{
				//redirect to error page
				returnVal = 3;
			}
			finally
			{
				SqlConn.Close();
			}
			//return
			return returnVal;
		}

		public static int intAddUser(
			string strEmail, string strPassword, string strFName, string strLName, string strDOB)
        {
			//connect to DB
			SqlConnection SqlConn = new SqlConnection("Data Source =.\\sqlexpress; Initial Catalog = C3315176_INFT3050_A1; Integrated Security = True");
			SqlConn.Open();
			int returnVal = 0;


			try
            {
				DS_UserTableAdapters.UserTableAdapter userTableAdapter =
					new DS_UserTableAdapters.UserTableAdapter();

				userTableAdapter.InsertUser(strEmail, strFName, strLName, /**Convert.ToDateTime(strDOB)*/strDOB, strPassword,"false", "inactive");
				returnVal = 1;
			} 
			catch
            {
				//redirect to error page
            }
			finally
            {
				SqlConn.Close();
			}

			return returnVal;

		}
	}
}