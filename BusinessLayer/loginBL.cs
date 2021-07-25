using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace c3315176_Assig1.BusinessLayer
{
    public class loginBL
    {
        public static int intCheckLogin(string strEmail, string strPwd)
        {
            //RETURN VALUE 2 means log in worked
            //1 means email exists, pwd incorrect
            //0 means invalid user details
            int returnVal = 0;

            int intDAL = 0;
            intDAL = DataAccessLayer.loginDAL.intCheckLogin(strEmail, strPwd);

            if (intDAL == 2)
            {
                returnVal = 2;
            }
            else if (intDAL == 1)
            {
                returnVal = 1;
            } else if (intDAL == 3)
            {
                returnVal = 3;
            } else
            {
                returnVal = 0;
            }

            return returnVal;
        }
    }
}