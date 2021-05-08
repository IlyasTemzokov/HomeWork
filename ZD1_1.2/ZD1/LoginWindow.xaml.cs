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
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace ZD1
{
    
    public partial class LoginWindow : Window
    {
        public LoginWindow()
        {
            InitializeComponent();
        }

        private void CloseButton_Click(object sender, RoutedEventArgs e)
        {
            Close();
        }

        private void LoginButton_Click(object sender, RoutedEventArgs e)
        {
            if (LoginTextBox.Text != "" && (PasswordTextBox.Text != "" || PasswordBox.Password != ""))
            {
                if (AuthentificationMethod(LoginTextBox.Text, PasswordTextBox.Text.Length == 0 ? PasswordBox.Password : PasswordTextBox.Text))
                {
                    UserWindow user = new UserWindow();
                    user.Show();
                    this.Close();
                    return;
                }
                else
                {
                    MessageBox.Show("Авторизация не пройдена");
                    return;
                }
            }
            MessageBox.Show("Заполните все поля");
        }

        private bool AuthentificationMethod(string Login, string Password)
        {
            using (var context = new DataBase.EntityContext())
            {
                var manager = context.Manager.FirstOrDefault(_manager => _manager.Login == Login && _manager.Password == Password);

                if (manager == null)
                    return false;

                int id = manager.UserID;
                var managerData = context.User.FirstOrDefault(_managerData => (_managerData.id == id));
                Classes.UserSingleton.FromDatabase(manager, managerData);
                    return true;
            }
        }

        private void CheckBox_Checked(object sender, RoutedEventArgs e)
        {
            PasswordTextBox.Text = PasswordBox.Password;
            PasswordTextBox.Visibility = Visibility.Visible;
            PasswordBox.Visibility = Visibility.Hidden;
            PasswordBox.IsEnabled = false;
            PasswordTextBox.IsEnabled = true;
            PasswordTextBox.Focus();
            return;
        }

        private void CheckBox_Unchecked(object sender, RoutedEventArgs e)
        {
            PasswordBox.Password = PasswordTextBox.Text;
            PasswordBox.Visibility = Visibility.Visible;
            PasswordTextBox.Visibility = Visibility.Hidden;
            PasswordTextBox.IsEnabled = false;
            PasswordBox.IsEnabled = true;
            PasswordBox.Focus();
            return;
        }
    }
}
