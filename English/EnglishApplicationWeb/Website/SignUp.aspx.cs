using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SignUp : System.Web.UI.Page
{
    WebMessageBox wmb = new WebMessageBox();
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSignUp_Click(object sender, EventArgs e)
    {
        Account newAccount = new Account();
        newAccount.username = txtUsername.Text;
        newAccount.password = txtPassword.Text;
        newAccount.email = txtMail.Text;
        string[] arr = txtDatePicker.Text.Split('/');
        DateTime dob = DateTime.Parse(arr[1].ToString() + "/" + arr[0].ToString() + "/" + arr[2].ToString() + " 00:00:00 AM");
        string sqlFormattedDob = dob.Date.ToString("yyyy-MM-dd");
        DateTime now = DateTime.Now;
        string sqlFormattedDateNow = now.Date.ToString("yyyy-MM-dd HH:mm:ss");
        newAccount.dob = sqlFormattedDob;
        newAccount.dateCreate = sqlFormattedDateNow;
        AccountDAO dao = new AccountDAO();
        bool result = dao.addNewAccount(newAccount);
        if (result == true)
        {
            wmb.Show("Success!");
        } else
        {
            wmb.Show("Fail");
        }

    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        Response.Redirect("Login.aspx");
    }
}