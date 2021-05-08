using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ZD1.Classes
{
    class UserSingleton
    {
        private static Models.ModelUser user;

        public static Models.ModelUser GetUser()
        {
            if (user == null)
                user = new Models.ModelUser();
            return user;
        }

        public static Models.ModelUser FromDatabase(DataBase.Manager _manager, DataBase.User _user)
        {
            GetUser();
            user = new Models.ModelUser(_user.FirstName, _user.SurName, _user.LastName, _manager.Login);
            return user;
        }
    }
}
