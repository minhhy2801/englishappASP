using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void txtPassword_TextChanged(object sender, EventArgs e)
    {

    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        String username = txtUsername.Text;
        String password = txtPassword.Text;
        AccountDAO dao = new AccountDAO();

        String result = dao.checkLogin(username, password);
        if (result != "fail")
        {
            WebMessageBox wmb = new WebMessageBox();
            Session.Add("ID", username);
            Session.Add("NAME", dao.getName(username));
            Response.Redirect("HomePage.aspx");
        }
        else
        {
            WebMessageBox wmb = new WebMessageBox();
            wmb.Show("Invalid username or password, please try again!");
        }


    }

    protected void btnSignUp_Click(object sender, EventArgs e)
    {
        Response.Redirect("SignUp.aspx");
    }
}