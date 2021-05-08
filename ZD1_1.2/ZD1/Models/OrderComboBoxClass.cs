using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ZD1.DataBase;

namespace ZD1.Models
{
    class OrderComboBoxClass
    {
        public OrderComboBoxClass()
        {
            using (var context = new EntityContext())
            {
                context.Products.Load();
                product = new ObservableCollection<Products>(context.Products.Local.ToList());
            }
        }
        public ObservableCollection<Products> product { get; set; }
        public Products SelectedProduct { get; set; }
    }
}
