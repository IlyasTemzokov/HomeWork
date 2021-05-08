using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using ZD1.DataBase;

namespace ZD1.Pages
{
    /// <summary>
    /// Логика взаимодействия для TablePage.xaml
    /// </summary>
    public partial class TablePage : Page
    {
        public TablePage()
        {
            InitializeComponent();

            using (var context = new EntityContext())
            {
                //context.Order.Load();
                //context.User.Load();
                //context.Products.Load();
                //context.Client.Load();
                //var ord = from p in context.Products
                //          join o in context.Order on new {x1 = p.ID} equals new {x1=o.id}
                //          join c in context.Client on new {x1 = }
                          
                         
            }
        }
    }
}
