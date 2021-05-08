using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ZD1.DataBase;

namespace ZD1.Classes
{
    class NewOrder
    {
        public NewOrder()
        {
            using (var context = new EntityContext())
            {
                context.User.Load();
                context.Products.Load();

                product = new ObservableCollection<Products>(context.Products.Local.ToList());
                user = new ObservableCollection<User>(context.User.Local.ToList());
            }
        }
        public ObservableCollection<Products> product { get; set; }
        public Products SelectedProduct { get; set; }
        public ObservableCollection<User> user { get; set; }
        public Products SelectedUser { get; set; }
    }
}
