using System;
using System.Collections.Generic;
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
using System.Windows.Shapes;
using ZD1.DataBase;

namespace ZD1
{
    /// <summary>
    /// Логика взаимодействия для SaleCreate.xaml
    /// </summary>
    public partial class SaleCreate : Window
    {
        public SaleCreate()
        {
            InitializeComponent();
        }

        private void CreateButton_Click_1(object sender, RoutedEventArgs e)
        {
            if (FirstNameText.Text != "" && LastNameText.Text != "" && SurNameText.Text != "" && ProductNameBox.ItemsSource != null)
            {
                OrderCreator();
                DialogResult = true;
                Close();
            }
            else
            {
                MessageBox.Show("You are bubon", "Sucktion!", MessageBoxButton.OKCancel, MessageBoxImage.Error);
            }       
        }

        private void OrderCreator()
        {
            using (var context = new EntityContext())
            {
                int user_status = 0;
                foreach (var user in context.User)
                {
                    if (user.FirstName == FirstNameText.Text && user.LastName == LastNameText.Text && user.SurName == SurNameText.Text) user_status = 1;
                }
                if (user_status == 0)
                {
                    context.User.Add(new User() { FirstName = FirstNameText.Text, SurName = SurNameText.Text, LastName = LastNameText.Text });
                    MessageBox.Show("New client");
                }
                int order_ID = 0;
                foreach (var order in context.Products)
                {
                    if (order.ID > order_ID) order_ID = order.ID;
                }
                MessageBox.Show(order_ID.ToString(), "Order_ID");
                context.SaveChanges();
            }
        }
            private void CloseButton_Click(object sender, RoutedEventArgs e)
        {
            Close();
        }
    }
}
