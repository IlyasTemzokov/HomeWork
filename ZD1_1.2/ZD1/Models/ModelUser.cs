using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ZD1.Models
{
    class ModelUser
    {
        private string firstName;
        private string surName;
        private string lastName;
        private string login;

        public ModelUser()
        {
        }

        public ModelUser(string _firstName, string _surName, string _lastName, string _login)
        {
            firstName = _firstName;
            surName = _surName;
            lastName = _lastName;
            login = _login;
        }

        public string GetFirstName() { return firstName; }
        public string GetSurName() { return surName; }
        public string GetLastName() { return lastName; }
        public string GetLogin() { return login; }
    }
}
