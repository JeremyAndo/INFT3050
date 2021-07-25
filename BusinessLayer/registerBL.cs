using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace c3315176_Assig1.BusinessLayer
{
    public class registerBL
    {
        public static int intCheckEmail(string strEmailID)
        {
            int returnVal = 0;
            returnVal = DataAccessLayer.registerDAL.intCheckEmail(strEmailID);
            return returnVal;
        }

        public static int intAddUser(
            string strEmail, string strPassword, string strFName, string strLName, string strDOB)
        {
            int intAddSuccess = 0;
            intAddSuccess = DataAccessLayer.registerDAL.intAddUser(
                strEmail, strPassword, strFName, strLName, strDOB);
            return intAddSuccess;
        }
    }
}