using System;
using System.Collections.Generic;
using System.Drawing;
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

namespace ZD1
{
    /// <summary>
    /// Логика взаимодействия для UserWindow.xaml
    /// </summary>
    public partial class UserWindow : Window
    {
        public UserWindow()
        {
            InitializeComponent();

            var user = Classes.UserSingleton.GetUser();
            LoginL.Content = user.GetLogin();
            FirstNameL.Content = user.GetFirstName();
            LastNameL.Content = user.GetLastName();
            SurNameL.Content = user.GetLastName();
            

            //ProfileImage.Source = new BitmapImage(new Uri(@"pack://application:,,,/Resources/minager.png"));
        }

        private void CreateSaleButton_Click(object sender, RoutedEventArgs e)
        {
            SaleCreate saleCreate = new SaleCreate();
            if(saleCreate.ShowDialog()==true) { }
        }

        private void SaleButton_Click(object sender, RoutedEventArgs e)
        {

        }
    }
}
